-- Gençlerbirliği 0 - 1 Galatasaray (Süper Lig)

UPDATE public.events
SET
  title = 'Gençlerbirliği 0 - 1 Galatasaray',
  description = NULLIF(E'İrfan Can Eğribayat 88'' (Kendi Kalesine)', '')
WHERE title = 'Gençlerbirliği - Galatasaray'
   OR title = 'Gençlerbirliği 0 - 1 Galatasaray';
