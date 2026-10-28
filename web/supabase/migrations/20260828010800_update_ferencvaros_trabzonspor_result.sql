-- Ferencváros 4 - 0 Trabzonspor (Avrupa Ligi play-off rövanş; toplam 5-0 Ferencváros)

UPDATE public.events
SET
  title = 'Ferencváros 4 - 0 Trabzonspor',
  description = NULLIF(E'Callum O''Dowda 19''
Marius Dumitru Corbu 54''
Bamidele Isa Yusuf 59'' (Penaltı)
Krisztián Lisztes 86''', '')
WHERE title = 'Ferencváros - Trabzonspor'
   OR title = 'Ferencváros 4 - 0 Trabzonspor';
