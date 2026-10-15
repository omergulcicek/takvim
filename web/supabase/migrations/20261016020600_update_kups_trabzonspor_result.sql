-- KuPS Kuopio 2 - 4 Trabzonspor (Konferans Ligi)

UPDATE public.events
SET
  title = 'KuPS Kuopio 2 - 4 Trabzonspor',
  description = NULLIF(E'Petteri Pennanen 54''
Gustav Engvall 90+6''

Paul Onuachu 3''
Mohamed Salah 44''
Franculino Djú 47'', 90+1''', '')
WHERE title = 'KuPS Kuopio - Trabzonspor'
   OR title = 'KuPS Kuopio 2 - 4 Trabzonspor';
