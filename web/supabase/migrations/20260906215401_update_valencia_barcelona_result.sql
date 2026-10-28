-- Valencia 0 - 5 Barcelona (La Liga)

UPDATE public.events
SET
  title = 'Valencia 0 - 5 Barcelona',
  description = NULLIF(E'Lamine Yamal 6'', 84''
Fermín López 22''
Raphinha 50''
Pedri 79''', '')
WHERE title = 'Valencia - Barcelona'
   OR title = 'Valencia 0 - 5 Barcelona';
