-- Porto 0 - 2 Manchester City (Şampiyonlar Ligi)
-- Not: DB'de yanlış Home-Away vardı (Manchester City - Porto); FT ile Porto ev sahibi olarak düzeltilir

UPDATE public.events
SET
  title = 'Porto 0 - 2 Manchester City',
  description = NULLIF(E'Erling Haaland 47'', 90+1''', '')
WHERE title = 'Manchester City - Porto'
   OR title = 'Porto - Manchester City'
   OR title = 'Porto 0 - 2 Manchester City'
   OR title = 'Manchester City 0 - 2 Porto';
