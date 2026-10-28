import { createMiddleware, createStart } from "@tanstack/react-start";

/**
 * HTML belgeleri her istekte Supabase verisinden render ediliyor. Etkinlikler
 * günde birkaç kez değiştiği için belge CDN'de tutulur ve arka planda
 * tazelenir; ziyaretçi beklemeden önbellekten yanıt alır. Feed yanıtları kendi
 * `Cache-Control` değerini verdiği için yalnızca `text/html` hedeflenir.
 */
const DOCUMENT_CACHE_CONTROL = "public, max-age=0, s-maxage=300, stale-while-revalidate=86400";

/**
 * Baseline security headers (parity with the Next.js template's `headers()`).
 * Extend or replace when you add CSP / auth middleware.
 */
const securityHeadersMiddleware = createMiddleware().server(async ({ next }) => {
  const result = await next();

  result.response.headers.set("X-Frame-Options", "DENY");
  result.response.headers.set("X-Content-Type-Options", "nosniff");
  result.response.headers.set("Referrer-Policy", "strict-origin-when-cross-origin");
  result.response.headers.set("Permissions-Policy", "camera=(), microphone=(), geolocation=()");

  const contentType = result.response.headers.get("Content-Type") ?? "";
  if (result.response.status === 200 && contentType.includes("text/html")) {
    result.response.headers.set("Cache-Control", DOCUMENT_CACHE_CONTROL);
  }

  return result;
});

export const startInstance = createStart(() => ({
  requestMiddleware: [securityHeadersMiddleware],
}));
