-- Liverpool 0 - 3 Manchester City (Premier Lig)

UPDATE public.events
SET
  title = 'Liverpool 0 - 3 Manchester City',
  description = NULLIF(E'Ryan Gravenberch 62'' (Kırmızı kart)

Erling Haaland 65''
Jérémy Doku 68''
Rayan Cherki 78''', '')
WHERE title = 'Liverpool - Manchester City'
   OR title = 'Liverpool 0 - 3 Manchester City';
