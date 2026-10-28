-- Erzurumspor FK 0 - 4 Galatasaray (Süper Lig)

UPDATE public.events
SET
  title = 'Erzurumspor FK 0 - 4 Galatasaray',
  description = NULLIF(E'Roland Sallai 12''
Yunus Akgün 20''
Victor Osimhen 45'', 80''', '')
WHERE title = 'Erzurumspor FK - Galatasaray'
   OR title = 'Erzurumspor FK 0 - 4 Galatasaray';
