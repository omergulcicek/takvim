-- Şampiyonlar Ligi 4 Kasım 2026 maç sonuçları ve goller (ESPN + FotMob ile doğrulandı)

-- AEK Athens 2 - 3 Real Madrid
UPDATE public.events
SET
  title = 'AEK Athens 2 - 3 Real Madrid',
  description = NULLIF(E'Aboubakary Koïta 12''
Stavros Pilios 75''
Aboubakary Koïta 90+5'' (Kırmızı kart)

Jude Bellingham 32''
Kylian Mbappé 78''
Federico Valverde 90+2''', '')
WHERE title = 'AEK Athens - Real Madrid'
  AND start_date = ('2026-11-04 20:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

-- Fenerbahçe 3 - 2 Liverpool
UPDATE public.events
SET
  title = 'Fenerbahçe 3 - 2 Liverpool',
  description = NULLIF(E'Mason Greenwood 29''
Archie Brown 73''
Vedat Muriqi 79''

Trey Nyoni 25''
Alexander Isak 69''', '')
WHERE title = 'Fenerbahçe - Liverpool'
  AND start_date = ('2026-11-04 20:45:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

-- Porto 4 - 1 Napoli
UPDATE public.events
SET
  title = 'Porto 4 - 1 Napoli',
  description = NULLIF(E'Jan Bednarek 11''
Gabri Veiga 71''
Jakub Kiwior 80''
Samu Aghehowa 90'' (Penaltı)

Scott McTominay 43''
Rafa Marín 88'' (Kırmızı kart)', '')
WHERE title = 'Porto - Napoli'
  AND start_date = ('2026-11-04 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

-- RB Leipzig 2 - 3 Manchester City
UPDATE public.events
SET
  title = 'RB Leipzig 2 - 3 Manchester City',
  description = NULLIF(E'Ridle Baku 49''
Antonio Nusa 61''

Castello Lukeba 37'' (Kendi Kalesine)
Enzo Fernández 58''
Erling Haaland 78''', '')
WHERE title = 'RB Leipzig - Manchester City'
  AND start_date = ('2026-11-04 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

-- Slavia Prague 1 - 2 Arsenal
UPDATE public.events
SET
  title = 'Slavia Prague 1 - 2 Arsenal',
  description = NULLIF(E'Wiktor Nowak 90''

Noni Madueke 9''
Viktor Gyökeres 38''', '')
WHERE title = 'Slavia Prague - Arsenal'
  AND start_date = ('2026-11-04 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
