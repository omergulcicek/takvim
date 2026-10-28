-- Trabzonspor 5 - 0 Gençlerbirliği (Süper Lig)

UPDATE public.events
SET
  title = 'Trabzonspor 5 - 0 Gençlerbirliği',
  description = NULLIF(E'Paul Onuachu 5'', 22''
Mohamed Salah 14'' (Penaltı)
Ernest Muçi 59''
Franculino Djú 79''', '')
WHERE title = 'Trabzonspor - Gençlerbirliği'
   OR title = 'Trabzonspor 5 - 0 Gençlerbirliği';
