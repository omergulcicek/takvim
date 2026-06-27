ALTER TABLE public.categories
  ADD COLUMN IF NOT EXISTS "desc" text;

COMMENT ON COLUMN public.categories."desc" IS
  'Kategori altında gösterilecek kısa açıklama (ör. alt türler).';

UPDATE public.categories
SET "desc" = 'İslam Alimleri ve Mutasavvıfları, Edebiyatçı ve Düşünürler, Kanaat Önderleri ve Osmanlı Padişahları'
WHERE slug = 'onemli-sahsiyetler';
