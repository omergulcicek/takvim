-- 1 Kasım 2026 maç sonuçları (Süper Lig, La Liga, Premier Lig, Serie A)

-- Trabzonspor 2 - 0 Gaziantep FK
UPDATE public.events
SET
  title = 'Trabzonspor 2 - 0 Gaziantep FK',
  description = NULLIF(E'Stefan Savić 45+2''\nErnest Muçi 61''', '')
WHERE title = 'Trabzonspor - Gaziantep FK'
   OR title = 'Trabzonspor 2 - 0 Gaziantep FK';

-- Racing Santander 0 - 3 Real Madrid
UPDATE public.events
SET
  title = 'Racing Santander 0 - 3 Real Madrid',
  description = NULLIF(E'Kylian Mbappé 11'' (Penaltı)\nJude Bellingham 21''\nYan Diomande 36''', '')
WHERE title = 'Racing Santander - Real Madrid'
   OR title = 'Racing Santander 0 - 3 Real Madrid';

-- Kasımpaşa 2 - 2 Beşiktaş
UPDATE public.events
SET
  title = 'Kasımpaşa 2 - 2 Beşiktaş',
  description = NULLIF(E'Cláudio Winck 60''\nMarcus Rafferty 87''\n\nLeandro Trossard 27''\nDušan Vlahović 47''', '')
WHERE title = 'Kasımpaşa - Beşiktaş'
   OR title = 'Kasımpaşa 2 - 2 Beşiktaş';

-- Liverpool 0 - 1 Arsenal
UPDATE public.events
SET
  title = 'Liverpool 0 - 1 Arsenal',
  description = NULLIF(E'Kai Havertz 16''', '')
WHERE title = 'Liverpool - Arsenal'
   OR title = 'Liverpool 0 - 1 Arsenal';

-- Juventus 2 - 0 Napoli
UPDATE public.events
SET
  title = 'Juventus 2 - 0 Napoli',
  description = NULLIF(E'Kerim Alajbegović 70''\nJérémie Boga 87''\n\nLuca Marianucci 75'' (Kırmızı kart)', '')
WHERE title = 'Juventus - Napoli'
   OR title = 'Juventus 2 - 0 Napoli';
