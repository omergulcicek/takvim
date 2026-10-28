-- Napoli 4 - 3 Bodø/Glimt ve Lille 2 - 4 Galatasaray (Şampiyonlar Ligi 3. hafta)

-- Napoli 4 - 3 Bodø/Glimt
UPDATE public.events
SET
  title = 'Napoli 4 - 3 Bodø/Glimt',
  description = NULLIF(E'Matteo Politano 1''
Scott McTominay 41'', 75''
Odin Bjørtuft 88'' (Kendi Kalesine)

Jens Petter Hauge 27''
Andreas Helmersen 62''
Sondre Fet 90+4''', '')
WHERE title = 'Napoli - Bodø/Glimt'
   OR title = 'Napoli 4 - 3 Bodø/Glimt';

-- Lille 2 - 4 Galatasaray
UPDATE public.events
SET
  title = 'Lille 2 - 4 Galatasaray',
  description = NULLIF(E'Soriba Diaoune 7'', 39''

Yunus Akgün 2''
Aleksey Batrakov 44''
Nabil Bentaleb 52'' (Kendi Kalesine)
Victor Osimhen 61''', '')
WHERE title = 'Lille - Galatasaray'
   OR title = 'Lille 2 - 4 Galatasaray';
