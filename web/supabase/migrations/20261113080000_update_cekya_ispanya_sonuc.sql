-- Çekya 0 - 2 İspanya (Uluslar Ligi). Kaynak çelişkisinde FotMob önceliklidir:
-- Krejcí kırmızı kartı FotMob'a göre 69' (ESPN 72').

UPDATE public.events
SET
  title = 'Çekya 0 - 2 İspanya',
  description = NULLIF(E'Ladislav Krejcí 69'' (Kırmızı kart)

Álex Baena 39'' (Penaltı)
Marc Pubill 90+6''', '')
WHERE title = 'Çekya - İspanya'
   OR title = 'Çekya 0 - 2 İspanya';
