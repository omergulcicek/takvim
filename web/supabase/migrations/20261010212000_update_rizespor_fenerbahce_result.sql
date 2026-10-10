-- Ç. Rizespor 0 - 3 Fenerbahçe (Süper Lig) — FT

UPDATE public.events
SET
  title = 'Ç. Rizespor 0 - 3 Fenerbahçe',
  description = NULLIF(E'Marco Asensio 12''
İrfan Can Kahveci 83''
Oğuz Aydın 87''', '')
WHERE title = 'Ç. Rizespor - Fenerbahçe'
   OR title = 'Ç. Rizespor 0 - 3 Fenerbahçe';
