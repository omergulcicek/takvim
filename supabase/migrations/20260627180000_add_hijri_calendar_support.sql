-- Hicri takvim desteği: events metadata + Diyanet Miladi tarih override tablosu.

ALTER TABLE public.events
  ADD COLUMN IF NOT EXISTS calendar_system text NOT NULL DEFAULT 'gregorian',
  ADD COLUMN IF NOT EXISTS hijri_month smallint,
  ADD COLUMN IF NOT EXISTS hijri_day smallint,
  ADD COLUMN IF NOT EXISTS hijri_end_month smallint,
  ADD COLUMN IF NOT EXISTS hijri_end_day smallint,
  ADD COLUMN IF NOT EXISTS hijri_rule text;

COMMENT ON COLUMN public.events.calendar_system IS
  'gregorian: Miladi start_date/end_date kullanılır. hijri: Diyanet Miladi tarihleri event_gregorian_dates tablosundan okunur.';

COMMENT ON COLUMN public.events.hijri_month IS
  'Hicri ay (1=Muharrem … 12=Zilhicce). calendar_system=hijri iken zorunlu.';

COMMENT ON COLUMN public.events.hijri_day IS
  'Hicri gün (1–30). calendar_system=hijri iken zorunlu (hijri_rule tanımlıysa opsiyonel).';

COMMENT ON COLUMN public.events.hijri_end_month IS
  'Çok günlü Hicri olaylar için bitiş ayı (bayram aralığı vb.).';

COMMENT ON COLUMN public.events.hijri_end_day IS
  'Çok günlü Hicri olaylar için bitiş günü.';

COMMENT ON COLUMN public.events.hijri_rule IS
  'Sabit Hicri gün yerine kural tabanlı günler (ör. Regaib: first_friday_of_month).';

-- Hicri olaylarda start_date zorunlu değil; Miladi günler override tablosunda tutulur.
ALTER TABLE public.events
  ALTER COLUMN start_date DROP NOT NULL;

ALTER TABLE public.events
  DROP CONSTRAINT IF EXISTS events_calendar_system_check;

ALTER TABLE public.events
  ADD CONSTRAINT events_calendar_system_check
  CHECK (calendar_system = ANY (ARRAY['gregorian'::text, 'hijri'::text]));

ALTER TABLE public.events
  DROP CONSTRAINT IF EXISTS events_hijri_rule_check;

ALTER TABLE public.events
  ADD CONSTRAINT events_hijri_rule_check
  CHECK (
    hijri_rule IS NULL
    OR hijri_rule = 'first_friday_of_month'::text
  );

ALTER TABLE public.events
  DROP CONSTRAINT IF EXISTS events_hijri_month_check;

ALTER TABLE public.events
  ADD CONSTRAINT events_hijri_month_check
  CHECK (hijri_month IS NULL OR hijri_month BETWEEN 1 AND 12);

ALTER TABLE public.events
  DROP CONSTRAINT IF EXISTS events_hijri_day_check;

ALTER TABLE public.events
  ADD CONSTRAINT events_hijri_day_check
  CHECK (hijri_day IS NULL OR hijri_day BETWEEN 1 AND 30);

ALTER TABLE public.events
  DROP CONSTRAINT IF EXISTS events_hijri_end_month_check;

ALTER TABLE public.events
  ADD CONSTRAINT events_hijri_end_month_check
  CHECK (hijri_end_month IS NULL OR hijri_end_month BETWEEN 1 AND 12);

ALTER TABLE public.events
  DROP CONSTRAINT IF EXISTS events_hijri_end_day_check;

ALTER TABLE public.events
  ADD CONSTRAINT events_hijri_end_day_check
  CHECK (hijri_end_day IS NULL OR hijri_end_day BETWEEN 1 AND 30);

ALTER TABLE public.events
  DROP CONSTRAINT IF EXISTS events_recurrence_check;

ALTER TABLE public.events
  ADD CONSTRAINT events_recurrence_check
  CHECK (
    recurrence IS NULL
    OR recurrence = ANY (ARRAY['yearly'::text, 'none'::text, 'hijri_yearly'::text])
  );

ALTER TABLE public.events
  DROP CONSTRAINT IF EXISTS events_calendar_fields_check;

ALTER TABLE public.events
  ADD CONSTRAINT events_calendar_fields_check
  CHECK (
    (
      calendar_system = 'gregorian'
      AND start_date IS NOT NULL
      AND (recurrence IS NULL OR recurrence <> 'hijri_yearly')
    )
    OR (
      calendar_system = 'hijri'
      AND recurrence = 'hijri_yearly'
      AND (
        hijri_rule IS NOT NULL
        OR (hijri_month IS NOT NULL AND hijri_day IS NOT NULL)
      )
    )
  );

CREATE TABLE IF NOT EXISTS public.event_gregorian_dates (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  event_id uuid NOT NULL REFERENCES public.events(id) ON DELETE CASCADE,
  gregorian_year integer NOT NULL,
  start_date timestamptz NOT NULL,
  end_date timestamptz,
  occurrence_date timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT event_gregorian_dates_year_check CHECK (gregorian_year >= 1900 AND gregorian_year <= 2200),
  CONSTRAINT event_gregorian_dates_unique_year UNIQUE (event_id, gregorian_year)
);

COMMENT ON TABLE public.event_gregorian_dates IS
  'Diyanet''in ilan ettiği Miladi tarihler. Hicri yıllık event''ler takvimde bu kayıtlardan gösterilir.';

COMMENT ON COLUMN public.event_gregorian_dates.gregorian_year IS
  'Override''ın geçerli olduğu Miladi yıl (chip''in düştüğü yıl).';

COMMENT ON COLUMN public.event_gregorian_dates.occurrence_date IS
  'Takvimde chip günü; null ise start_date kullanılır.';

CREATE INDEX IF NOT EXISTS event_gregorian_dates_event_id_idx
  ON public.event_gregorian_dates (event_id);

CREATE INDEX IF NOT EXISTS event_gregorian_dates_year_idx
  ON public.event_gregorian_dates (gregorian_year);

ALTER TABLE public.event_gregorian_dates ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Public can read event_gregorian_dates" ON public.event_gregorian_dates;

CREATE POLICY "Public can read event_gregorian_dates"
  ON public.event_gregorian_dates
  FOR SELECT
  TO anon, authenticated
  USING (true);

DROP POLICY IF EXISTS "Authenticated can insert event_gregorian_dates" ON public.event_gregorian_dates;

CREATE POLICY "Authenticated can insert event_gregorian_dates"
  ON public.event_gregorian_dates
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

DROP POLICY IF EXISTS "Authenticated can update event_gregorian_dates" ON public.event_gregorian_dates;

CREATE POLICY "Authenticated can update event_gregorian_dates"
  ON public.event_gregorian_dates
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

DROP POLICY IF EXISTS "Authenticated can delete event_gregorian_dates" ON public.event_gregorian_dates;

CREATE POLICY "Authenticated can delete event_gregorian_dates"
  ON public.event_gregorian_dates
  FOR DELETE
  TO authenticated
  USING (true);

GRANT SELECT ON public.event_gregorian_dates TO anon, authenticated;
GRANT INSERT, UPDATE, DELETE ON public.event_gregorian_dates TO authenticated;
