-- Uluslar Ligi 12-14 Kasım sonuçları: Çekya-İspanya, Sırbistan-Almanya, Portekiz-Danimarka.
-- Skorlar ESPN + FotMob'da aynı; goller ESPN + FotMob. Dragojević (74'/76') ve Krejcí (69'/72') kırmızı kart dakikaları
-- kaynaklarda 1 dakikadan fazla çeliştiği için kart satırı yazılmadı (Živković 89' iki kaynakta aynı, yazıldı).

UPDATE public.events
SET
  title = 'Çekya 0 - 2 İspanya',
  description = NULLIF(E'Álex Baena 39'' (Penaltı)
Marc Pubill 90+6''', '')
WHERE title = 'Çekya - İspanya'
   OR title = 'Çekya 0 - 2 İspanya';

UPDATE public.events
SET
  title = 'Sırbistan 1 - 3 Almanya',
  description = NULLIF(E'Srđan Babić 56''
Andrija Živković 89'' (Kırmızı kart)

Srđan Babić 3'' (Kendi Kalesine)
Florian Wirtz 14''
Brajan Gruda 50''', '')
WHERE title = 'Sırbistan - Almanya'
   OR title = 'Sırbistan 1 - 3 Almanya';

UPDATE public.events
SET
  title = 'Portekiz 1 - 4 Danimarka',
  description = NULLIF(E'Bernardo Silva 90+3''

Pierre-Emile Højbjerg 43'' (Penaltı)
Rasmus Højlund 49'', 57''
Joachim Andersen 75''', '')
WHERE title = 'Portekiz - Danimarka'
   OR title = 'Portekiz 1 - 4 Danimarka';
