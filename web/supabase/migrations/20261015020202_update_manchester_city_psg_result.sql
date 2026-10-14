-- Manchester City 2 - 4 Paris Saint-Germain (Şampiyonlar Ligi)

UPDATE public.events
SET
  title = 'Manchester City 2 - 4 Paris Saint-Germain',
  description = NULLIF(E'Erling Haaland 53'', 75''

Désiré Doué 13''
Ousmane Dembélé 15''
Vitinha 32''
Maghnes Akliouche 62''', '')
WHERE title = 'Manchester City - Paris Saint-Germain'
   OR title = 'Manchester City 2 - 4 Paris Saint-Germain';
