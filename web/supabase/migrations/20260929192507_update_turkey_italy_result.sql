-- Türkiye 1 - 4 İtalya (Uluslar Ligi)

UPDATE public.events
SET
  title = 'Türkiye 1 - 4 İtalya',
  description = NULLIF(E'Barış Alper Yılmaz 47''

Alessandro Bastoni 9''
Davide Frattesi 22''
Michael Kayode 27''
Pio Esposito 50''', '')
WHERE title = 'Türkiye - İtalya'
   OR title = 'Türkiye 1 - 4 İtalya';
