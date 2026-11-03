-- Şampiyonlar Ligi 3 Kasım 2026 maçlarının sonuçları ve goller (Adım 1)

-- Galatasaray 2 - 0 VfB Stuttgart
UPDATE public.events
SET
  title = 'Galatasaray 2 - 0 VfB Stuttgart',
  description = NULLIF(E'Alexey Batrakov 12'', 15''', '')
WHERE title = 'Galatasaray - VfB Stuttgart'
   OR title = 'Galatasaray 2 - 0 VfB Stuttgart';

-- Atlético Madrid 0 - 2 Bayern Münih
UPDATE public.events
SET
  title = 'Atlético Madrid 0 - 2 Bayern Münih',
  description = NULLIF(E'Lennart Karl 54''
Konrad Laimer 74''', '')
WHERE title = 'Atlético Madrid - Bayern Münih'
   OR title = 'Atlético Madrid 0 - 2 Bayern Münih';

-- Barcelona 3 - 0 Aston Villa
UPDATE public.events
SET
  title = 'Barcelona 3 - 0 Aston Villa',
  description = NULLIF(E'Lamine Yamal 7''
Raphinha 52'', 64''', '')
WHERE title = 'Barcelona - Aston Villa'
   OR title = 'Barcelona 3 - 0 Aston Villa';

-- Feyenoord 0 - 3 Inter
UPDATE public.events
SET
  title = 'Feyenoord 0 - 3 Inter',
  description = NULLIF(E'Yann Bisseck 8''
Pio Esposito 34''
Piotr Zieliński 54''', '')
WHERE title = 'Feyenoord - Inter'
   OR title = 'Feyenoord 0 - 3 Inter';

-- Manchester United 3 - 2 Roma
UPDATE public.events
SET
  title = 'Manchester United 3 - 2 Roma',
  description = NULLIF(E'Bruno Fernandes 58'' (Penaltı)
Matheus Cunha 83'', 86''
Matheus Cunha 90+1'' (Kırmızı kart)

Matias Soulé 11''
Donyell Malen 17'' (Penaltı)', '')
WHERE title = 'Manchester United - Roma'
   OR title = 'Manchester United 3 - 2 Roma';

-- Villarreal 0 - 6 Paris Saint-Germain
UPDATE public.events
SET
  title = 'Villarreal 0 - 6 Paris Saint-Germain',
  description = NULLIF(E'João Neves 9''
Désiré Doué 12''
Senny Mayulu 13''
Fabián Ruiz 17'', 50''
David Boly 78''', '')
WHERE title = 'Villarreal - Paris Saint-Germain'
   OR title = 'Villarreal 0 - 6 Paris Saint-Germain';
