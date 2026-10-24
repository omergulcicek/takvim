-- Şampiyonlar Ligi 3. hafta (20-21 Ekim 2026) maç sonuçları ve goller

-- Fenerbahçe 2 - 2 Slavia Prague
UPDATE public.events
SET
  title = 'Fenerbahçe 2 - 2 Slavia Prague',
  description = NULLIF(E'Oğuz Aydın 4''
Mason Greenwood 11''

Lukas Provod 15''
Pavel Kacor 90''', '')
WHERE title = 'Fenerbahçe - Slavia Prague'
   OR title = 'Fenerbahçe 2 - 2 Slavia Prague';

-- Roma 4 - 0 Slovan Bratislava
UPDATE public.events
SET
  title = 'Roma 4 - 0 Slovan Bratislava',
  description = NULLIF(E'Mario Hermoso 21''
Nahuel Molina 39''
Niccolò Pisilli 52''
Donyell Malen 58'' (Penaltı)', '')
WHERE title = 'Roma - Slovan Bratislava'
   OR title = 'Roma 4 - 0 Slovan Bratislava';

-- Liverpool 4 - 3 Villarreal
UPDATE public.events
SET
  title = 'Liverpool 4 - 3 Villarreal',
  description = NULLIF(E'Alexis Mac Allister 36'', 65''
Ronald Araújo 45+2''
Florian Wirtz 68''

Georges Mikautadze 4''
Sergi Cardona 29''
Tani Oluwaseyi 87''', '')
WHERE title = 'Liverpool - Villarreal'
   OR title = 'Liverpool 4 - 3 Villarreal';

-- Manchester City 5 - 1 AEK Athens
UPDATE public.events
SET
  title = 'Manchester City 5 - 1 AEK Athens',
  description = NULLIF(E'Elliot Anderson 12''
Phil Foden 34'', 65'', 76''
Rayan Cherki 57''

Stavros Pilios 52''', '')
WHERE title = 'Manchester City - AEK Athens'
   OR title = 'Manchester City 5 - 1 AEK Athens';

-- Paris Saint-Germain 4 - 2 Barcelona
UPDATE public.events
SET
  title = 'Paris Saint-Germain 4 - 2 Barcelona',
  description = NULLIF(E'Désiré Doué 38''
Lucas Hernández 72''
Vitinha 81''
Fabián Ruiz 86''

Xavi Espart 55''
Lamine Yamal 79''', '')
WHERE title = 'Paris Saint-Germain - Barcelona'
   OR title = 'Paris Saint-Germain 4 - 2 Barcelona';

-- Como 4 - 1 Manchester United
UPDATE public.events
SET
  title = 'Como 4 - 1 Manchester United',
  description = NULLIF(E'Nico Paz 2'', 57''
Anastasios Douvikas 49''
Jacobo Ramón 76''

Joshua Zirkzee 90+1''', '')
WHERE title = 'Como - Manchester United'
   OR title = 'Como 4 - 1 Manchester United';

-- Real Madrid 4 - 1 RB Leipzig
UPDATE public.events
SET
  title = 'Real Madrid 4 - 1 RB Leipzig',
  description = NULLIF(E'Bernardo Silva 43''
Arda Güler 52''
Kylian Mbappé 83''
Yan Diomande 87''

Tidiam Gomis 85''', '')
WHERE title = 'Real Madrid - RB Leipzig'
   OR title = 'Real Madrid 4 - 1 RB Leipzig';

-- Inter 1 - 0 Shakhtar Donetsk
UPDATE public.events
SET
  title = 'Inter 1 - 0 Shakhtar Donetsk',
  description = NULLIF(E'Carlos Augusto 77''', '')
WHERE title = 'Inter - Shakhtar Donetsk'
   OR title = 'Inter 1 - 0 Shakhtar Donetsk';

-- Bayern Münih 2 - 2 Arsenal
UPDATE public.events
SET
  title = 'Bayern Münih 2 - 2 Arsenal',
  description = NULLIF(E'Alphonso Davies 35''
Harry Kane 61'' (Penaltı)

Eberechi Eze 25''
Declan Rice 82''', '')
WHERE title = 'Bayern Münih - Arsenal'
   OR title = 'Bayern Münih 2 - 2 Arsenal';
