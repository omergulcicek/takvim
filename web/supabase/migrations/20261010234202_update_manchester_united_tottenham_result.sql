-- Manchester United 1 - 1 Tottenham (Premier Lig) — FT

UPDATE public.events
SET
  title = 'Manchester United 1 - 1 Tottenham',
  description = NULLIF(E'Bryan Mbeumo 73''

Rodrigo Bentancur 78'' (Kırmızı kart)
Dominic Solanke 90+2''', '')
WHERE title = 'Manchester United - Tottenham'
   OR title = 'Manchester United 1 - 1 Tottenham';
