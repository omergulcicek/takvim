-- 30-31 Ekim 2026 maç sonuçları ve goller (Süper Lig, Premier Lig, Serie A, La Liga).
-- Skor ve olaylar ESPN ile FotMob'da aynı.

UPDATE public.events
SET
  title = 'Konyaspor 0 - 4 Galatasaray',
  description = NULLIF(E'Victor Osimhen 12''\nYunus Akgün 28''\nAleksey Batrakov 49''\nRafael Leão 55'' (Penaltı)', '')
WHERE title = 'Konyaspor - Galatasaray'
   OR title = 'Konyaspor 0 - 4 Galatasaray';

UPDATE public.events
SET
  title = 'Chelsea 2 - 0 Manchester United',
  description = NULLIF(E'Morgan Rogers 50''\nCole Palmer 64'' (Penaltı)\n\nLisandro Martínez 63'' (Kırmızı kart)', '')
WHERE title = 'Chelsea - Manchester United'
   OR title = 'Chelsea 2 - 0 Manchester United';

UPDATE public.events
SET
  title = 'Manchester City 0 - 1 Brighton',
  description = NULLIF(E'Yasin Ayari 11''', '')
WHERE title = 'Manchester City - Brighton'
   OR title = 'Manchester City 0 - 1 Brighton';

UPDATE public.events
SET
  title = 'Fenerbahçe 1 - 2 Göztepe',
  description = NULLIF(E'Mattéo Guendouzi 45+1''\n\nSinclair Armstrong 76''\nAndré Henrique 78''', '')
WHERE title = 'Fenerbahçe - Göztepe'
   OR title = 'Fenerbahçe 1 - 2 Göztepe';

UPDATE public.events
SET
  title = 'Tottenham 2 - 0 Crystal Palace',
  description = NULLIF(E'Archie Gray 25''\nJan Paul van Hecke 73''\n\nJean-Philippe Mateta 13'' (Kırmızı kart)', '')
WHERE title = 'Tottenham - Crystal Palace'
   OR title = 'Tottenham 2 - 0 Crystal Palace';

UPDATE public.events
SET
  title = 'Milan 3 - 1 Inter',
  description = NULLIF(E'Christian Pulisic 4''\nAdrien Rabiot 10''\nDiego Moreira 43''\n\nAlessandro Bastoni 22''', '')
WHERE title = 'Milan - Inter'
   OR title = 'Milan 3 - 1 Inter';

UPDATE public.events
SET
  title = 'Barcelona 6 - 1 Alavés',
  description = NULLIF(E'Raphinha 8'', 41''\nFermín López 23''\nLamine Yamal 45+1'', 64''\nAnthony Gordon 81''\n\nMariano Díaz 84''', '')
WHERE title = 'Barcelona - Alavés'
   OR title = 'Barcelona 6 - 1 Alavés';
