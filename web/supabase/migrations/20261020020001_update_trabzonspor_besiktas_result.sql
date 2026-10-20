-- Trabzonspor 2 - 0 Beşiktaş (Süper Lig) maç sonucu ve goller
UPDATE public.events
SET
  title = 'Trabzonspor 2 - 0 Beşiktaş',
  description = NULLIF(E'Ozan Tufan 21''\nMohamed Salah 71''', '')
WHERE title = 'Trabzonspor - Beşiktaş'
   OR title = 'Trabzonspor 2 - 0 Beşiktaş';
