-- Real Betis 2 - 5 Barcelona (La Liga)

UPDATE public.events
SET
  title = 'Real Betis 2 - 5 Barcelona',
  description = NULLIF(E'Valentín Gómez 27''
Abde Ezzalzouli 53''
Facundo Bernal 54'' (Kırmızı kart)

Lamine Yamal 10''
Rodri 41''
Gabriel Jesus 51''
Eric García 62''
Dani Olmo 81''', '')
WHERE title = 'Real Betis - Barcelona'
   OR title = 'Real Betis 2 - 5 Barcelona';
