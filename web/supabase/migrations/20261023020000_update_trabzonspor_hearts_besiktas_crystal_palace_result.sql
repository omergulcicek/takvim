-- Trabzonspor 2 - 0 Hearts (Konferans Ligi) ve Beşiktaş 2 - 2 Crystal Palace (Avrupa Ligi) sonuçları

UPDATE public.events
SET
  title = 'Trabzonspor 2 - 0 Heart of Midlothian',
  description = NULLIF(E'Mohamed Salah 32'' (Penaltı)
Franculino Dju 58''', '')
WHERE title = 'Trabzonspor - Heart of Midlothian'
   OR title = 'Trabzonspor 2 - 0 Heart of Midlothian';

UPDATE public.events
SET
  title = 'Beşiktaş 2 - 2 Crystal Palace',
  description = NULLIF(E'Wilfred Ndidi 45+1''
Junior Olaitan 73''

Yéremy Pino 51''
Jean-Philippe Mateta 55''', '')
WHERE title = 'Beşiktaş - Crystal Palace'
   OR title = 'Beşiktaş 2 - 2 Crystal Palace';
