-- Manchester United 5 - 2 Ipswich (Premier Lig)

UPDATE public.events
SET
  title = 'Manchester United 5 - 2 Ipswich',
  description = NULLIF(E'Bruno Fernandes 40''
Bruno Fernandes 61'' (Penaltı)
Bruno Fernandes 68''
Bryan Mbeumo 82''

Leif Davis 29''
Jacob Greaves 56'' (kk)
Chuba Akpom 90+1''', '')
WHERE title = 'Manchester United - Ipswich'
   OR title = 'Manchester United 5 - 2 Ipswich';
