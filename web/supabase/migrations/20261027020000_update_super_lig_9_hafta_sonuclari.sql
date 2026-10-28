-- Süper Lig 9. hafta sonuçları: Galatasaray - Fenerbahçe ve Beşiktaş - Başakşehir

UPDATE public.events
SET
  title = 'Galatasaray 2 - 1 Fenerbahçe',
  description = NULLIF(E'Victor Osimhen 29'', 44''

İrfan Can Kahveci 62''', '')
WHERE title = 'Galatasaray - Fenerbahçe'
   OR title = 'Galatasaray 2 - 1 Fenerbahçe';

UPDATE public.events
SET
  title = 'Beşiktaş 2 - 0 Başakşehir',
  description = NULLIF(E'Oh Hyeon-Gyu 76''
Junior Olaitan 89''', '')
WHERE title = 'Beşiktaş - Başakşehir'
   OR title = 'Beşiktaş 2 - 0 Başakşehir';
