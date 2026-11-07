-- 7 Kasım 2026 maçlarının sonuçları ve golleri (Adım 1: geçmiş skorsuz maçlar).
-- Skor ve FT durumu ESPN + FotMob'da aynı; gol dakikaları ESPN ile FotMob'da aynı.
-- Valencia - Real Madrid: José Gayà 79' kırmızı kartı iki kaynakta da var.

-- Leeds United 1 - 0 Tottenham (Premier Lig)
UPDATE public.events
SET
  title = 'Leeds United 1 - 0 Tottenham',
  description = NULLIF(E'Noah Okafor 79''', '')
WHERE title = 'Leeds United - Tottenham'
   OR title = 'Leeds United 1 - 0 Tottenham';

-- Arsenal 1 - 0 Hull City (Premier Lig)
UPDATE public.events
SET
  title = 'Arsenal 1 - 0 Hull City',
  description = NULLIF(E'Martin Ødegaard 72''', '')
WHERE title = 'Arsenal - Hull City'
   OR title = 'Arsenal 1 - 0 Hull City';

-- Galatasaray 4 - 3 Amed SK (Süper Lig)
UPDATE public.events
SET
  title = 'Galatasaray 4 - 3 Amed SK',
  description = NULLIF(E'Rafael Leão 7''
Alban Lafont 45'' (Kendi Kalesine)
Alexey Batrakov 59''
Barış Alper Yılmaz 80''

Dia Saba 62''
Gift Orban 65''
Yira Collins Sor 90+2''', '')
WHERE title = 'Galatasaray - Amed SK'
   OR title = 'Galatasaray 4 - 3 Amed SK';

-- Nottingham Forest 3 - 1 Manchester City (Premier Lig)
UPDATE public.events
SET
  title = 'Nottingham Forest 3 - 1 Manchester City',
  description = NULLIF(E'Jair Cunha 6''
Liam Delap 18'', 73''

Rayan Cherki 52''', '')
WHERE title = 'Nottingham Forest - Manchester City'
   OR title = 'Nottingham Forest 3 - 1 Manchester City';

-- Valencia 0 - 3 Real Madrid (La Liga)
UPDATE public.events
SET
  title = 'Valencia 0 - 3 Real Madrid',
  description = NULLIF(E'José Gayà 79'' (Kırmızı kart)

Federico Valverde 28''
Arda Güler 36''
Kylian Mbappé 75''', '')
WHERE title = 'Valencia - Real Madrid'
   OR title = 'Valencia 0 - 3 Real Madrid';
