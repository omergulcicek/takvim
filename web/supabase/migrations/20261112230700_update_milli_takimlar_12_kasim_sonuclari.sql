-- 12 Kasım Uluslar Ligi sonuçları: Türkiye - Belçika, İngiltere - Hırvatistan, İtalya - Fransa
-- (Çekya - İspanya: kırmızı kart dakikası kaynaklar arasında çelişti, atlandı)

-- Türkiye 1 - 2 Belçika
UPDATE public.events
SET
  title = 'Türkiye 1 - 2 Belçika',
  description = NULLIF(E'Arda Güler 20''

Kevin De Bruyne 27''
Charles De Ketelaere 30''', '')
WHERE title = 'Türkiye - Belçika'
   OR title = 'Türkiye 1 - 2 Belçika';

-- İngiltere 2 - 1 Hırvatistan
UPDATE public.events
SET
  title = 'İngiltere 2 - 1 Hırvatistan',
  description = NULLIF(E'Morgan Rogers 24''
Harry Kane 64'' (Penaltı)

Petar Sučić 59''', '')
WHERE title = 'İngiltere - Hırvatistan'
   OR title = 'İngiltere 2 - 1 Hırvatistan';

-- İtalya 3 - 1 Fransa
UPDATE public.events
SET
  title = 'İtalya 3 - 1 Fransa',
  description = NULLIF(E'Pio Esposito 26''
Davide Frattesi 63''
Pio Esposito 75'' (Penaltı)

Michael Olise 10''', '')
WHERE title = 'İtalya - Fransa'
   OR title = 'İtalya 3 - 1 Fransa';
