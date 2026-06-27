-- 2026 FIFA Dünya Kupası grup maçları (Türkiye saati, ~2 saat süre).

UPDATE public.events
SET
  title = '🇦🇺 Avustralya 2 - 0 Türkiye 🇹🇷',
  description = E'Nestory Irankunda 27''
Connor Metcalfe 75''',
  start_date = ('2026-06-14 05:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-06-14 05:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'futbol'
  AND events.title ILIKE '%Avustralya%Türkiye%';

INSERT INTO public.events (
  category_id, title, description, start_date, end_date, is_all_day, status, recurrence, subject_id
)
SELECT
  cat.id,
  v.title,
  NULLIF(v.description, ''),
  (v.local_start::timestamp AT TIME ZONE 'Europe/Istanbul'),
  (v.local_start::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  false,
  'published',
  'none',
  sub.id
FROM public.categories cat
CROSS JOIN public.subjects sub
CROSS JOIN (
  VALUES
    ('🇲🇽 Meksika 2 - 0 Güney Afrika 🇿🇦', E'Henry Martín 24''
Santiago Giménez 71''', '2026-06-11 22:00:00'),
    ('🇰🇷 Güney Kore 1 - 2 Çekya 🇨🇿', E'Son Heung-min 43''

Tomáš Souček 18''
Patrik Schick 64''', '2026-06-12 05:00:00'),
    ('🇨🇦 Kanada 1 - 1 Bosna-Hersek 🇧🇦', E'Jonathan David 38''

Edin Džeko 55''', '2026-06-12 22:00:00'),
    ('🇺🇸 ABD 4 - 1 Paraguay 🇵🇾', E'Christian Pulisic 14''
Folarin Balogun 32''
Timothy Weah 58''
Weston McKennie 81''

Miguel Almirón 45''', '2026-06-13 04:00:00'),
    ('🇨🇭 İsviçre 1 - 1 Katar 🇶🇦', E'Breel Embolo 29''

Akram Afif 74''', '2026-06-13 22:00:00'),
    ('🇧🇷 Brezilya 1 - 1 Fas 🇲🇦', E'Vinícius Júnior 61''

Hakim Ziyech 44''', '2026-06-13 23:30:00'),
    ('🇭🇹 Haiti 0 - 1 İskoçya 🏴󠁧󠁢󠁳󠁣󠁴󠁿', E'John McGinn 37''', '2026-06-14 02:00:00'),
    ('🇩🇪 Almanya 7 - 1 Curaçao 🇨🇼', E'Niclas Füllkrug 12'', 39''
Kai Havertz 22''
Florian Wirtz 45''
Leroy Sané 62''
Serge Gnabry 77''
Jamal Musiala 88''

Juninho Bacuna 54''', '2026-06-14 20:00:00'),
    ('🇳🇱 Hollanda 2 - 2 Japonya 🇯🇵', E'Memphis Depay 19''
Cody Gakpo 73''

Takumi Minamino 41''
Kaoru Mitoma 85''', '2026-06-14 23:00:00'),
    ('🇨🇮 Fildişi Sahili 1 - 0 Ekvador 🇪🇨', E'Sébastien Haller 51''', '2026-06-15 02:00:00'),
    ('🇸🇪 İsveç 5 - 1 Tunus 🇹🇳', E'Alexander Isak 8'', 64''
Dejan Kulusevski 31''
Viktor Gyökeres 55''
Emil Forsberg 82''

Youssef Msakni 45''', '2026-06-15 19:00:00'),
    ('🇪🇸 İspanya 0 - 0 Yeşil Burun Adaları 🇨🇻', E'', '2026-06-15 22:00:00'),
    ('🇧🇪 Belçika 1 - 1 Mısır 🇪🇬', E'Romelu Lukaku 34''

Mohamed Salah 59''', '2026-06-16 01:00:00'),
    ('🇮🇷 İran 2 - 2 Yeni Zelanda 🇳🇿', E'Mehdi Taremi 17''
Sardar Azmoun 79''

Chris Wood 44'', 68''', '2026-06-16 04:00:00'),
    ('🇨🇿 Çekya 1 - 1 Güney Afrika 🇿🇦', E'Tomáš Souček 52''

Percy Tau 28''', '2026-06-18 19:00:00'),
    ('🇲🇽 Meksika 1 - 0 Güney Kore 🇰🇷', E'Hirving Lozano 67''', '2026-06-18 22:00:00'),
    ('🇨🇭 İsviçre 4 - 1 Bosna-Hersek 🇧🇦', E'Granit Xhaka 14''
Breel Embolo 41'', 73''
Xherdan Shaqiri 85''

Edin Džeko 60''', '2026-06-19 02:00:00'),
    ('🇨🇦 Kanada 6 - 0 Katar 🇶🇦', E'Jonathan David 9'', 31''
Alphonso Davies 22''
Cyle Larin 54'', 80''
Tajon Buchanan 67''', '2026-06-19 05:00:00'),
    ('🏴󠁧󠁢󠁳󠁣󠁴󠁿 İskoçya 0 - 1 Fas 🇲🇦', E'Youssef En-Nesyri 58''', '2026-06-19 22:00:00'),
    ('🇧🇷 Brezilya 3 - 0 Haiti 🇭🇹', E'Rodrygo 26''
Neymar 55''
Gabriel Jesus 82''', '2026-06-20 01:00:00'),
    ('🇺🇸 ABD 2 - 0 Avustralya 🇦🇺', E'Folarin Balogun 40''
Christian Pulisic 72''', '2026-06-20 04:00:00'),
    ('🇹🇷 Türkiye 0 - 1 Paraguay 🇵🇾', E'Antonio Sanabria 63''', '2026-06-20 05:00:00'),
    ('🇩🇪 Almanya 2 - 1 Fildişi Sahili 🇨🇮', E'Kai Havertz 35''
Niclas Füllkrug 71''

Sébastien Haller 58''', '2026-06-20 23:00:00'),
    ('🇪🇨 Ekvador 0 - 0 Curaçao 🇨🇼', E'', '2026-06-21 02:00:00'),
    ('🇳🇱 Hollanda 5 - 1 İsveç 🇸🇪', E'Cody Gakpo 14'', 62''
Memphis Depay 39''
Xavi Simons 75''
Denzel Dumfries 88''

Alexander Isak 49''', '2026-06-21 05:00:00'),
    ('🇯🇵 Japonya 4 - 0 Tunus 🇹🇳', E'Kyogo Furuhashi 21''
Kaoru Mitoma 44''
Takumi Minamino 61''
Ritsu Doan 78''', '2026-06-21 22:00:00'),
    ('🇺🇾 Uruguay 2 - 2 Yeşil Burun Adaları 🇨🇻', E'Darwin Núñez 33''
Federico Valverde 74''

Ryan Mendes 19'', 55''', '2026-06-22 01:00:00'),
    ('🇳🇿 Yeni Zelanda 1 - 3 Mısır 🇪🇬', E'Chris Wood 60''

Mohamed Salah 12'', 45''
Mostafa Mohamed 82''', '2026-06-22 04:00:00'),
    ('🇦🇷 Arjantin 2 - 0 Avusturya 🇦🇹', E'Lionel Messi 29'', 67''', '2026-06-22 20:00:00'),
    ('🇫🇷 Fransa 3 - 0 Irak 🇮🇶', E'Kylian Mbappé 18'', 54''
Antoine Griezmann 42''', '2026-06-23 00:00:00'),
    ('🇳🇴 Norveç 3 - 2 Senegal 🇸🇳', E'Erling Haaland 11'', 65''
Martin Ødegaard 43''

Sadio Mané 30''
Nicolas Jackson 78''', '2026-06-23 03:00:00'),
    ('🇯🇴 Ürdün 1 - 2 Cezayir 🇩🇿', E'Musa Al-Taamari 56''

Riyad Mahrez 23''
Baghdad Bounedjah 71''', '2026-06-23 06:00:00'),
    ('🇵🇹 Portekiz 5 - 0 Özbekistan 🇺🇿', E'Cristiano Ronaldo 15'', 52''
Bruno Fernandes 34''
Rafael Leão 61''
João Félix 84''', '2026-06-23 20:00:00'),
    ('🏴󠁧󠁢󠁥󠁮󠁧󠁿 İngiltere 0 - 0 Gana 🇬🇭', E'', '2026-06-23 23:00:00'),
    ('🇵🇦 Panama 0 - 1 Hırvatistan 🇭🇷', E'Luka Modrić 66''', '2026-06-24 02:00:00'),
    ('🇨🇴 Kolombiya 1 - 0 Kongo DC 🇨🇩', E'Luis Díaz 42''', '2026-06-24 05:00:00'),
    ('🇨🇭 İsviçre 2 - 1 Kanada 🇨🇦', E'Breel Embolo 31''
Granit Xhaka 69''

Jonathan David 55''', '2026-06-24 22:00:00'),
    ('🇧🇦 Bosna-Hersek 3 - 1 Katar 🇶🇦', E'Edin Džeko 18''
Miralem Pjanić 44''
Luka Menalo 79''

Almoez Ali 61''', '2026-06-24 22:00:00'),
    ('🇲🇦 Fas 4 - 2 Haiti 🇭🇹', E'Youssef En-Nesyri 14'', 49''
Hakim Ziyech 33''
Sofyan Amrabat 76''

Duckens Nazon 25''
Frantzdy Pierrot 68''', '2026-06-25 01:00:00'),
    ('🏴󠁧󠁢󠁳󠁣󠁴󠁿 İskoçya 0 - 3 Brezilya 🇧🇷', E'Neymar 21''
Vinícius Júnior 58''
Rodrygo 80''', '2026-06-25 01:00:00'),
    ('🇿🇦 Güney Afrika 1 - 0 Güney Kore 🇰🇷', E'Percy Tau 62''', '2026-06-25 04:00:00'),
    ('🇨🇿 Çekya 0 - 3 Meksika 🇲🇽', E'Santiago Giménez 36''
Henry Martín 59''
Edson Álvarez 81''', '2026-06-25 04:00:00'),
    ('🇨🇼 Curaçao 0 - 2 Fildişi Sahili 🇨🇮', E'Sébastien Haller 40''
Nicolas Pépé 73''', '2026-06-25 23:00:00'),
    ('🇪🇨 Ekvador 2 - 1 Almanya 🇩🇪', E'Enner Valencia 28''
Kendry Páez 64''

Kai Havertz 51''', '2026-06-25 23:00:00'),
    ('🇹🇳 Tunus 1 - 3 Hollanda 🇳🇱', E'Youssef Msakni 45''

Cody Gakpo 19'', 72''
Memphis Depay 55''', '2026-06-26 02:00:00'),
    ('🇯🇵 Japonya 1 - 1 İsveç 🇸🇪', E'Takumi Minamino 50''

Alexander Isak 28''', '2026-06-26 02:00:00'),
    ('🇹🇷 Türkiye 3 - 2 ABD 🇺🇸', E'Arda Güler 22''
Kerem Aktürkoğlu 45''
Barış Alper Yılmaz 90''

Christian Pulisic 14''
Folarin Balogun 67''', '2026-06-26 05:00:00'),
    ('🇵🇾 Paraguay 0 - 0 Avustralya 🇦🇺', E'', '2026-06-26 05:00:00'),
    ('🇳🇴 Norveç 1 - 4 Fransa 🇫🇷', E'Erling Haaland 38''

Kylian Mbappé 12'', 74''
Antoine Griezmann 45''
Ousmane Dembélé 81''', '2026-06-26 22:00:00'),
    ('🇸🇳 Senegal 5 - 0 Irak 🇮🇶', E'Sadio Mané 19'', 61''
Nicolas Jackson 34''
İliman Ndiaye 52''
Pape Matar Sarr 77''', '2026-06-26 22:00:00'),
    ('🇨🇻 Yeşil Burun Adaları 0 - 0 Suudi Arabistan 🇸🇦', E'', '2026-06-27 03:00:00'),
    ('🇺🇾 Uruguay 0 - 1 İspanya 🇪🇸', E'Alvaro Morata 68''', '2026-06-27 03:00:00'),
    ('🇳🇿 Yeni Zelanda 1 - 5 Belçika 🇧🇪', E'Chris Wood 41''

Romelu Lukaku 15'', 54''
Kevin De Bruyne 32''
Leandro Trossard 70''
Jérémy Doku 85''', '2026-06-27 06:00:00'),
    ('🇪🇬 Mısır 1 - 1 İran 🇮🇷', E'Mohamed Salah 38''

Mehdi Taremi 72''', '2026-06-27 06:00:00')
) AS v(title, description, local_start)
WHERE cat.slug = 'futbol'
  AND sub.name = '2026 FIFA Dünya Kupası';