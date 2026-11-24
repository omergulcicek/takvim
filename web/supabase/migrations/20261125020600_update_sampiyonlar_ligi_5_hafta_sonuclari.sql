-- Şampiyonlar Ligi 5. hafta (24 Kasım) sonuçları: skor ve gol dakikaları

UPDATE takvim.events
SET
  title = 'Galatasaray 1 - 0 Aston Villa',
  description = NULLIF(E'Deniz Gül 77''', '')
WHERE title = 'Galatasaray - Aston Villa'
   OR title = 'Galatasaray 1 - 0 Aston Villa';

UPDATE takvim.events
SET
  title = 'Arsenal 1 - 1 Borussia Dortmund',
  description = NULLIF(E'Viktor Gyökeres 10''

Maximilian Beier 55''', '')
WHERE title = 'Arsenal - Borussia Dortmund'
   OR title = 'Arsenal 1 - 1 Borussia Dortmund';

UPDATE takvim.events
SET
  title = 'Manchester City 2 - 2 Napoli',
  description = NULLIF(E'Ayyoub Bouaddi 67''
Rayan Cherki 86''

Rasmus Højlund 55''
Noa Lang 76''', '')
WHERE title = 'Manchester City - Napoli'
   OR title = 'Manchester City 2 - 2 Napoli';

UPDATE takvim.events
SET
  title = 'Real Madrid 5 - 1 PSV Eindhoven',
  description = NULLIF(E'Federico Valverde 50''
Jude Bellingham 60''
Kylian Mbappé 64'', 84''
Vinícius Júnior 87''

Ivan Perišić 32'' (Penaltı)', '')
WHERE title = 'Real Madrid - PSV Eindhoven'
   OR title = 'Real Madrid 5 - 1 PSV Eindhoven';
