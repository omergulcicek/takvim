-- Avrupa kupaları 5. hafta sonuçları (26 Kasım 2026): Beşiktaş ve Trabzonspor maçları

UPDATE takvim.events
SET
  title = 'Beşiktaş 2 - 1 Hapoel Be''er Sheva',
  description = NULLIF(E'Junior Olaitan 75''
Orkun Kökçü 90''

Javon East 90+3''', '')
WHERE title = 'Beşiktaş - Hapoel Be''er Sheva'
   OR title = 'Beşiktaş 2 - 1 Hapoel Be''er Sheva';

UPDATE takvim.events
SET
  title = 'CSKA Sofya 1 - 2 Trabzonspor',
  description = NULLIF(E'Sidny Lopes Cabral 32'' (Kendi Kalesine)

Mohamed Salah 69''
Noah Saviolo 90+3''', '')
WHERE title = 'CSKA Sofya - Trabzonspor'
   OR title = 'CSKA Sofya 1 - 2 Trabzonspor';
