-- Şampiyonlar Ligi lig aşaması 25 Kasım 2026 maç sonuçları (Adım 1)
-- Skorlar ESPN + Sky Sports ile doğrulandı. Sporting - Manchester United'daki
-- Tielemans kırmızı kartı tek kaynakta olduğundan yazılmadı.

UPDATE takvim.events
SET title = 'Sabah 1 - 4 Barcelona',
    description = NULLIF(E'Joy-Lance Mickels 63''\n\nAnthony Gordon 31'', 51''\nKarim Adeyemi 55''\nGabriel Jesus 60''', '')
WHERE title = 'Sabah - Barcelona' OR title = 'Sabah 1 - 4 Barcelona';

UPDATE takvim.events
SET title = 'Paris Saint-Germain 2 - 2 Roma',
    description = NULLIF(E'Illia Zabarnyi 31''\nOusmane Dembélé 62'' (Penaltı)\n\nMario Hermoso 5''\nDonyell Malen 78'' (Penaltı)', '')
WHERE title = 'Paris Saint-Germain - Roma' OR title = 'Paris Saint-Germain 2 - 2 Roma';

UPDATE takvim.events
SET title = 'Lille 2 - 1 Bayern Münih',
    description = NULLIF(E'Ayase Ueda 62''\nAleksandar Pavlovic 65'' (Kendi Kalesine)\n\nDayot Upamecano 15''', '')
WHERE title = 'Lille - Bayern Münih' OR title = 'Lille 2 - 1 Bayern Münih';

UPDATE takvim.events
SET title = 'Shakhtar Donetsk 0 - 1 Fenerbahçe',
    description = NULLIF(E'Vedat Muriqi 56''', '')
WHERE title = 'Shakhtar Donetsk - Fenerbahçe' OR title = 'Shakhtar Donetsk 0 - 1 Fenerbahçe';

UPDATE takvim.events
SET title = 'Club Brugge 0 - 3 Liverpool',
    description = NULLIF(E'Alexander Isak 13'', 82''\nFlorian Wirtz 79''', '')
WHERE title = 'Club Brugge - Liverpool' OR title = 'Club Brugge 0 - 3 Liverpool';

UPDATE takvim.events
SET title = 'Sporting CP 2 - 2 Manchester United',
    description = NULLIF(E'Luis Suárez 33'' (Penaltı), 80''\n\nBruno Fernandes 48'' (Penaltı), 50''', '')
WHERE title = 'Sporting CP - Manchester United' OR title = 'Sporting CP 2 - 2 Manchester United';

UPDATE takvim.events
SET title = 'Inter 2 - 0 VfB Stuttgart',
    description = NULLIF(E'Petar Sucic 57'' (Penaltı)\nLautaro Martínez 74''', '')
WHERE title = 'Inter - VfB Stuttgart' OR title = 'Inter 2 - 0 VfB Stuttgart';
