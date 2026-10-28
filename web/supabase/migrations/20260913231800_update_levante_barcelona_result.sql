-- Levante 2 - 4 Barcelona (La Liga)

UPDATE public.events
SET
  title = 'Levante 2 - 4 Barcelona',
  description = NULLIF(E'Iván Romero 79''
Roger Brugué 88''

Xavi Espart 5''
Lamine Yamal 19'', 48'' (Penaltı)
Karim Adeyemi 90+3''', '')
WHERE title = 'Levante - Barcelona'
   OR title = 'Levante 2 - 4 Barcelona';
