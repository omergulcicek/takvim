-- Samsunspor 0 - 3 Trabzonspor (Süper Lig)

UPDATE public.events
SET
  title = 'Samsunspor 0 - 3 Trabzonspor',
  description = NULLIF(E'Ernest Muçi 27''
Chibuike Nwaiwu 38''
Franculino Djú 40''
Melih Kabasakal 43'' (Kırmızı kart)', '')
WHERE title = 'Samsunspor - Trabzonspor'
   OR title = 'Samsunspor 0 - 3 Trabzonspor';
