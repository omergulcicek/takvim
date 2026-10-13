-- Arsenal 3 - 0 Lille (Şampiyonlar Ligi)

UPDATE public.events
SET
  title = 'Arsenal 3 - 0 Lille',
  description = NULLIF(E'Jurriën Timber 64''
Eberechi Eze 67''
Bukayo Saka 71''', '')
WHERE title = 'Arsenal - Lille'
   OR title = 'Arsenal 3 - 0 Lille';
