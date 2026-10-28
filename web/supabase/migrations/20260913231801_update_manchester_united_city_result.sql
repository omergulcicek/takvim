-- Manchester United 0 - 1 Manchester City (Premier Lig)

UPDATE public.events
SET
  title = 'Manchester United 0 - 1 Manchester City',
  description = NULLIF(E'Phil Foden 23'' (Kırmızı kart)
Erling Haaland 60''', '')
WHERE title = 'Manchester United - Manchester City'
   OR title = 'Manchester United 0 - 1 Manchester City';
