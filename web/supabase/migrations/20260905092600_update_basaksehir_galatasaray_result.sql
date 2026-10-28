-- Başakşehir 2 - 3 Galatasaray (Süper Lig)

UPDATE public.events
SET
  title = 'Başakşehir 2 - 3 Galatasaray',
  description = NULLIF(E'Eldor Shomurodov 66'' (Penaltı)
Davinson Sanchez 76'' (kk)
Umut Bozok 79'' (Kırmızı kart)

Victor Osimhen 16''
Lucas Torreira 71''
Gabriel Sara 90''', '')
WHERE title = 'Başakşehir - Galatasaray'
   OR title = 'Başakşehir 2 - 3 Galatasaray';
