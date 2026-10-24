-- 24 Ekim 2026 maç sonuçları: Aston Villa - Manchester City, Arsenal - Everton, Napoli - Roma, Chelsea - Tottenham

UPDATE public.events
SET
  title = 'Aston Villa 2 - 1 Manchester City',
  description = NULLIF(E'Nicolas Jackson 6'', 60''

Erling Haaland 52''', '')
WHERE title = 'Aston Villa - Manchester City'
   OR title = 'Aston Villa 2 - 1 Manchester City';

UPDATE public.events
SET
  title = 'Arsenal 2 - 0 Everton',
  description = NULLIF(E'Ezri Konsa 7''
Gabriel Magalhães 68''', '')
WHERE title = 'Arsenal - Everton'
   OR title = 'Arsenal 2 - 0 Everton';

UPDATE public.events
SET
  title = 'Napoli 3 - 3 Roma',
  description = NULLIF(E'Frank Anguissa 28''
Scott McTominay 48'', 83''

Matías Soulé 69''
Leonardo Balerdi 74'', 89''', '')
WHERE title = 'Napoli - Roma'
   OR title = 'Napoli 3 - 3 Roma';

UPDATE public.events
SET
  title = 'Chelsea 0 - 2 Tottenham',
  description = NULLIF(E'Mike Penders 77'' (Kendi Kalesine)
Mathys Tel 87''', '')
WHERE title = 'Chelsea - Tottenham'
   OR title = 'Chelsea 0 - 2 Tottenham';
