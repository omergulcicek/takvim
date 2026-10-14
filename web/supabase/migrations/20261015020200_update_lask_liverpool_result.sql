-- LASK Linz 3 - 6 Liverpool (Şampiyonlar Ligi)

UPDATE public.events
SET
  title = 'LASK Linz 3 - 6 Liverpool',
  description = NULLIF(E'Robert Ljubičić 63''
Florian Flecker 74'', 77''

Ronald Araujo 22''
Bradley Barcola 24'', 37'', 66''
Jeremie Frimpong 51''
Lewis Koumas 72''', '')
WHERE title = 'LASK Linz - Liverpool'
   OR title = 'LASK Linz 3 - 6 Liverpool';
