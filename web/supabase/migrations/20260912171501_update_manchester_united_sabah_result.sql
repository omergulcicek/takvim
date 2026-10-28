-- Manchester United 4 - 0 Sabah (Şampiyonlar Ligi)

UPDATE public.events
SET
  title = 'Manchester United 4 - 0 Sabah',
  description = NULLIF(E'Matheus Cunha 27''
Bruno Fernandes 42''
Benjamin Sesko 45''
Lisandro Martínez 68''', '')
WHERE title = 'Manchester United - Sabah'
   OR title = 'Manchester United 4 - 0 Sabah';
