-- Barcelona 5 - 1 Feyenoord (Şampiyonlar Ligi)

UPDATE public.events
SET
  title = 'Barcelona 5 - 1 Feyenoord',
  description = NULLIF(E'Raphinha 3'', 57''
Karim Adeyemi 22''
Lamine Yamal 77''
Gabriel Jesus 85''

Sem Steijn 82''', '')
WHERE title = 'Barcelona - Feyenoord'
   OR title = 'Barcelona 5 - 1 Feyenoord';
