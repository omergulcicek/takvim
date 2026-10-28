-- İtalya 3 - 1 Türkiye (Uluslar Ligi)

UPDATE public.events
SET
  title = 'İtalya 3 - 1 Türkiye',
  description = NULLIF(E'Gianluca Scamacca 26''
Riccardo Calafiori 64''
Pio Esposito 87''

Aral Şimşir 61''', '')
WHERE title = 'İtalya - Türkiye'
   OR title = 'İtalya 3 - 1 Türkiye';
