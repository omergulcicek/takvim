import { toWebcalUrl } from "@/lib/site-url";

export type CalendarApp = "apple" | "google" | "outlook";

const GOOGLE_SUBSCRIBE_ENDPOINT = "https://calendar.google.com/calendar/r";
const OUTLOOK_SUBSCRIBE_ENDPOINT = "https://outlook.live.com/calendar/0/addfromweb";

/**
 * Apple Takvim ve webcal'i tanıyan diğer istemciler bu şemayı doğrudan açar;
 * tarayıcı isteği işletim sistemindeki takvim uygulamasına devreder.
 */
export function buildAppleSubscribeUrl(feedUrl: string): string {
  return toWebcalUrl(feedUrl);
}

/**
 * Google Takvim'in "URL'den abone ol" girişi. `cid` parametresi webcal şemasını
 * bekler; https verildiğinde Google akışı tek seferlik içe aktarmaya düşürür.
 */
export function buildGoogleSubscribeUrl(feedUrl: string): string {
  const params = new URLSearchParams({ cid: toWebcalUrl(feedUrl) });
  return `${GOOGLE_SUBSCRIBE_ENDPOINT}?${params.toString()}`;
}

/** Outlook on the web'in "Web'den abone ol" girişi; https adres ve ad bekler. */
export function buildOutlookSubscribeUrl(feedUrl: string, calendarName: string): string {
  const params = new URLSearchParams({ url: feedUrl, name: calendarName });
  return `${OUTLOOK_SUBSCRIBE_ENDPOINT}?${params.toString()}`;
}
