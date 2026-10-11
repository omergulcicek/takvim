-- Beşiktaş 2 - 1 Kocaelispor (Süper Lig)

UPDATE public.events
SET
  title = 'Beşiktaş 2 - 1 Kocaelispor',
  description = NULLIF(E'Orkun Kökçü 18''
Dusan Vlahovic 31'' (Penaltı)

Show 27''', '')
WHERE title = 'Beşiktaş - Kocaelispor'
   OR title = 'Beşiktaş 2 - 1 Kocaelispor';
