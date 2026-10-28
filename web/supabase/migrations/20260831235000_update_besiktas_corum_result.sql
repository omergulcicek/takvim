-- Beşiktaş 6 - 2 Çorum FK (Süper Lig)

UPDATE public.events
SET
  title = 'Beşiktaş 6 - 2 Çorum FK',
  description = NULLIF(E'Vaclav Cerny 9''
Dusan Vlahovic 43'' (Penaltı), 59'', 66''
İlhan Fakılı 73''
Murillo 83''

Mohammed Diomande 52''
Ermin Mahmić 77''', '')
WHERE title = 'Beşiktaş - Çorum FK'
   OR title = 'Beşiktaş 6 - 2 Çorum FK';
