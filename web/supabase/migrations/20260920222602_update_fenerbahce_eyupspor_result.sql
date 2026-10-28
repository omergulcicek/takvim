-- Fenerbahçe 8 - 0 Eyüpspor (Süper Lig)

UPDATE public.events
SET
  title = 'Fenerbahçe 8 - 0 Eyüpspor',
  description = NULLIF(E'Mason Greenwood 5'' (Penaltı), 80''
Vedat Muriqi 7'', 21'', 47'', 55''
Matteo Guendouzi 38''
İrfan Can Kahveci 45+1''', '')
WHERE title = 'Fenerbahçe - Eyüpspor'
   OR title = 'Fenerbahçe 8 - 0 Eyüpspor';
