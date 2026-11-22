-- 21-22 Kasım 2026 hafta sonu sonuçları ve goller (Süper Lig, Premier Lig, La Liga)

UPDATE public.events
SET
  title = 'Manchester City 1 - 1 Fulham',
  description = NULLIF(E'Elliot Anderson 57''\n\nRodrigo Muniz 16''', '')
WHERE title = 'Manchester City - Fulham'
   OR title = 'Manchester City 1 - 1 Fulham';

UPDATE public.events
SET
  title = 'Galatasaray 2 - 1 Samsunspor',
  description = NULLIF(E'Lucas Torreira 4''\nYunus Akgün 53''\n\nMohamed Bayo 57''', '')
WHERE title = 'Galatasaray - Samsunspor'
   OR title = 'Galatasaray 2 - 1 Samsunspor';

UPDATE public.events
SET
  title = 'Chelsea 1 - 4 Leeds United',
  description = NULLIF(E'Emanuel Emegha 25''\n\nNoah Okafor 28'', 58''\nDominic Calvert-Lewin 53'' (Penaltı)\nBrenden Aaronson 90+1''', '')
WHERE title = 'Chelsea - Leeds United'
   OR title = 'Chelsea 1 - 4 Leeds United';

UPDATE public.events
SET
  title = 'Tottenham 2 - 0 Ipswich',
  description = NULLIF(E'Luca Williams-Barnett 15''\nDominic Solanke 51''', '')
WHERE title = 'Tottenham - Ipswich'
   OR title = 'Tottenham 2 - 0 Ipswich';

UPDATE public.events
SET
  title = 'Kocaelispor 2 - 2 Fenerbahçe',
  description = NULLIF(E'Berkan Kutlu 71'' (Penaltı)\nMatej Maglica 76''\n\nMilan Škriniar 61''\nMason Greenwood 90+3''', '')
WHERE title = 'Kocaelispor - Fenerbahçe'
   OR title = 'Kocaelispor 2 - 2 Fenerbahçe';

UPDATE public.events
SET
  title = 'Newcastle United 2 - 2 Arsenal',
  description = NULLIF(E'Harvey Barnes 49''\nMalick Thiaw 62''\n\nEberechi Eze 33''\nNoni Madueke 78''', '')
WHERE title = 'Newcastle United - Arsenal'
   OR title = 'Newcastle United 2 - 2 Arsenal';

UPDATE public.events
SET
  title = 'Real Madrid 2 - 1 Celta Vigo',
  description = NULLIF(E'Jude Bellingham 66''\nCarlos Espí 85''\n\nPablo Durán 6''', '')
WHERE title = 'Real Madrid - Celta Vigo'
   OR title = 'Real Madrid 2 - 1 Celta Vigo';

UPDATE public.events
SET
  title = 'Barcelona 3 - 2 Villarreal',
  description = NULLIF(E'Gerard Martín 57''\nFermín López 61''\nPau Navarro 67'' (Kendi Kalesine)\nFermín López 75'' (Kırmızı kart)\n\nTajon Buchanan 5''\nTani Oluwaseyi 7''\nPau Navarro 90+3'' (Kırmızı kart)', '')
WHERE title = 'Barcelona - Villarreal'
   OR title = 'Barcelona 3 - 2 Villarreal';

UPDATE public.events
SET
  title = 'Konyaspor 2 - 4 Beşiktaş',
  description = NULLIF(E'Jean-Luc Dompé 42''\nEnis Destan 63''\n\nDušan Vlahović 10'', 34''\nLeandro Trossard 79''\nVáclav Černý 90+2''', '')
WHERE title = 'Konyaspor - Beşiktaş'
   OR title = 'Konyaspor 2 - 4 Beşiktaş';

UPDATE public.events
SET
  title = 'Trabzonspor 1 - 0 Eyüpspor',
  description = NULLIF(E'Ozan Tufan 5''', '')
WHERE title = 'Trabzonspor - Eyüpspor'
   OR title = 'Trabzonspor 1 - 0 Eyüpspor';
