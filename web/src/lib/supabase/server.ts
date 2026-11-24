import { createClient } from "@supabase/supabase-js";

import { env } from "@/env";

/** Aynı Supabase projesi birden çok uygulamaya hizmet ediyor; Takvim tabloları `takvim` şemasında. */
const DB_SCHEMA = "takvim";

export function getSupabaseServerClient() {
  return createClient(env.SUPABASE_URL, env.SUPABASE_PUBLISHABLE_KEY, {
    db: { schema: DB_SCHEMA },
    auth: {
      persistSession: false,
      autoRefreshToken: false,
    },
  });
}
