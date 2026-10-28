-- Galatasaray 1 - 0 Kocaelispor (Süper Lig)

UPDATE public.events
SET
  title = 'Galatasaray 1 - 0 Kocaelispor',
  description = NULLIF(E'Abdülkerim Bardakcı 71''', '')
WHERE title = 'Galatasaray - Kocaelispor'
   OR title = 'Galatasaray 1 - 0 Kocaelispor';
