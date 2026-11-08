-- 8 Kasım 2026 maç sonuçları ve goller (Süper Lig, Premier Lig, La Liga)
-- Kaynaklar: ESPN + FotMob (skor ve goller iki kaynakta aynı)

-- Çorum FK 0 - 5 Fenerbahçe
UPDATE public.events
SET
  title = 'Çorum FK 0 - 5 Fenerbahçe',
  description = NULLIF(E'Mason Greenwood 12'', 63''\nİrfan Can Kahveci 21'', 56''\nOğuz Aydın 74''', '')
WHERE title = 'Çorum FK - Fenerbahçe'
   OR title = 'Çorum FK 0 - 5 Fenerbahçe';

-- Sunderland 1 - 0 Chelsea
UPDATE public.events
SET
  title = 'Sunderland 1 - 0 Chelsea',
  description = NULLIF(E'Enzo Le Fée 36'' (Penaltı)', '')
WHERE title = 'Sunderland - Chelsea'
   OR title = 'Sunderland 1 - 0 Chelsea';

-- Crystal Palace 1 - 3 Liverpool
UPDATE public.events
SET
  title = 'Crystal Palace 1 - 3 Liverpool',
  description = NULLIF(E'Eddie Nketiah 90+5'' (Penaltı)\n\nAlexis Mac Allister 40''\nFlorian Wirtz 54''\nAlexander Isak 89''', '')
WHERE title = 'Crystal Palace - Liverpool'
   OR title = 'Crystal Palace 1 - 3 Liverpool';

-- Alanyaspor 0 - 2 Trabzonspor
UPDATE public.events
SET
  title = 'Alanyaspor 0 - 2 Trabzonspor',
  description = NULLIF(E'Wagner Pina 17''\nMohamed Salah 34''', '')
WHERE title = 'Alanyaspor - Trabzonspor'
   OR title = 'Alanyaspor 0 - 2 Trabzonspor';

-- Manchester United 4 - 4 Aston Villa
UPDATE public.events
SET
  title = 'Manchester United 4 - 4 Aston Villa',
  description = NULLIF(E'Bruno Fernandes 16'' (Penaltı)\nYouri Tielemans 44''\nJoshua Zirkzee 90+2''\nPatrick Dorgu 90+6''\n\nAlysson 1''\nNicolas Jackson 4''\nJohn McGinn 48'' (Penaltı)\nLeon Goretzka 53''', '')
WHERE title = 'Manchester United - Aston Villa'
   OR title = 'Manchester United 4 - 4 Aston Villa';

-- Beşiktaş 3 - 0 Gençlerbirliği
UPDATE public.events
SET
  title = 'Beşiktaş 3 - 0 Gençlerbirliği',
  description = NULLIF(E'Dušan Vlahović 20'', 45''\nErnest Poku 85''\n\nMetehan Baltacı 22'' (Kırmızı kart)', '')
WHERE title = 'Beşiktaş - Gençlerbirliği'
   OR title = 'Beşiktaş 3 - 0 Gençlerbirliği';

-- Atlético Madrid 1 - 2 Barcelona
UPDATE public.events
SET
  title = 'Atlético Madrid 1 - 2 Barcelona',
  description = NULLIF(E'Giuliano Simeone 10''\n\nFermín López 45'', 66''', '')
WHERE title = 'Atlético Madrid - Barcelona'
   OR title = 'Atlético Madrid 1 - 2 Barcelona';
