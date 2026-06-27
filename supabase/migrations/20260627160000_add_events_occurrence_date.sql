ALTER TABLE public.events
  ADD COLUMN IF NOT EXISTS occurrence_date timestamptz;

COMMENT ON COLUMN public.events.occurrence_date IS
  'Takvimde chip''in gösterileceği simgesel gün. start_date/end_date tarih aralığını (UI''da) tutar; null ise start_date kullanılır.';
