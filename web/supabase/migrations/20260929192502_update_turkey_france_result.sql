-- Türkiye 0 - 1 Fransa (Uluslar Ligi)

UPDATE public.events
SET
  title = 'Türkiye 0 - 1 Fransa',
  description = NULLIF(E'Uğurcan Çakır 87'' (Kırmızı kart)

Kylian Mbappé 54''', '')
WHERE title = 'Türkiye - Fransa'
   OR title = 'Türkiye 0 - 1 Fransa';
