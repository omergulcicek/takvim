-- Beşiktaş 3 - 0 Erzurumspor FK (Süper Lig)

UPDATE public.events
SET
  title = 'Beşiktaş 3 - 0 Erzurumspor FK',
  description = NULLIF(E'Emirhan Topçu 21''
Leandro Trossard 27''
İlhan Fakılı 82''', '')
WHERE title = 'Beşiktaş - Erzurumspor FK'
   OR title = 'Beşiktaş 3 - 0 Erzurumspor FK';
