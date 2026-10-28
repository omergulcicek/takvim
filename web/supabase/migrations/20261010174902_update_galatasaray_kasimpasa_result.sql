-- Galatasaray 3 - 1 Kasımpaşa (Süper Lig)

UPDATE public.events
SET
  title = 'Galatasaray 3 - 1 Kasımpaşa',
  description = NULLIF(E'Abdülkerim Bardakçı 45''
Lucas Torreira 65'' (Kırmızı kart)
Barış Alper Yılmaz 90''
Mario Lemina 90+6''

Jesurun Rak-Sakyi 68''', '')
WHERE title = 'Galatasaray - Kasımpaşa'
   OR title = 'Galatasaray 3 - 1 Kasımpaşa';
