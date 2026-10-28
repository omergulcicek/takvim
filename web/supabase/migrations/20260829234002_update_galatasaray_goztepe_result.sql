-- Galatasaray 3 - 2 Göztepe (Süper Lig)

UPDATE public.events
SET
  title = 'Galatasaray 3 - 2 Göztepe',
  description = NULLIF(E'Davinson Sánchez 33''
Gabriel Sara 55''
Victor Osimhen 63'' (Penaltı)

Miroshi 16''
Juan 65''', '')
WHERE title = 'Galatasaray - Göztepe'
   OR title = 'Galatasaray 3 - 2 Göztepe';
