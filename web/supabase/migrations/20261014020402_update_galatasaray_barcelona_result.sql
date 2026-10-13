-- Galatasaray 1 - 4 Barcelona (Şampiyonlar Ligi)

UPDATE public.events
SET
  title = 'Galatasaray 1 - 4 Barcelona',
  description = NULLIF(E'Aleksey Batrakov 28''

João Cancelo 43''
Fermín López 50''
Anthony Gordon 53''
Karim Adeyemi 65''', '')
WHERE title = 'Galatasaray - Barcelona'
   OR title = 'Galatasaray 1 - 4 Barcelona';
