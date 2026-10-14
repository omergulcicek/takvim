-- Roma 3 - 4 Real Madrid (Şampiyonlar Ligi)

UPDATE public.events
SET
  title = 'Roma 3 - 4 Real Madrid',
  description = NULLIF(E'Marten de Roon 20''
Donyell Malen 51'', 57''

Kylian Mbappé 25''
Carlos Espí 83''
Endrick 85''
Antonio Rüdiger 90''', '')
WHERE title = 'Roma - Real Madrid'
   OR title = 'Roma 3 - 4 Real Madrid';
