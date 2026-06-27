-- Paylaşılan varlık metadata'sı: kişi, savaş vb. birden fazla takvim
-- kaydına sahip olabilecek şeyler için.
CREATE TABLE public.subjects (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  category_id uuid NOT NULL REFERENCES public.categories(id) ON DELETE RESTRICT,
  name text NOT NULL,
  description text,
  source_url text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

COMMENT ON TABLE public.subjects IS
  'Birden fazla takvim kaydında paylaşılan varlık (kişi, savaş vb.). Tek tarihli kültürel günler için kullanılmaz.';

CREATE INDEX subjects_category_id_idx ON public.subjects (category_id);

ALTER TABLE public.events
  ADD COLUMN subject_id uuid REFERENCES public.subjects(id) ON DELETE SET NULL,
  ADD COLUMN kind text
    CHECK (
      kind IS NULL
      OR kind = ANY (ARRAY['birth', 'death', 'start', 'end', 'commemoration'])
    );

COMMENT ON COLUMN public.events.kind IS
  'Varlığa bağlı kayıt türü: birth/death (şahsiyet), start/end (savaş), commemoration (genel anma). Tek başına event''lerde null.';

CREATE INDEX events_subject_id_idx ON public.events (subject_id);

-- Mevcut Necip Fazıl verisini taşı
WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'onemli-sahsiyetler'
),
inserted AS (
  INSERT INTO public.subjects (category_id, name, description, source_url)
  SELECT
    cat.id,
    'Necip Fazıl Kısakürek',
    'Türk şair, yazar ve düşünür. 24 yaşında yayımladığı "Kaldırımlar" şiiri ile tanındı. Türk edebiyatının ''Üstad''ı olarak bilinir.',
    'https://tr.wikipedia.org/wiki/Necip_Fazıl_Kısakürek'
  FROM cat
  RETURNING id
)
UPDATE public.events e
SET
  subject_id = inserted.id,
  kind = CASE
    WHEN e.title ILIKE '%doğum%' THEN 'birth'
    WHEN e.title ILIKE '%vefat%' THEN 'death'
    ELSE NULL
  END,
  description = NULL,
  source_url = NULL
FROM inserted
WHERE e.title ILIKE 'Necip Fazıl Kısakürek:%';

ALTER TABLE public.subjects ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public can read subjects"
  ON public.subjects
  FOR SELECT
  TO anon, authenticated
  USING (true);

CREATE POLICY "Authenticated can insert subjects"
  ON public.subjects
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated can update subjects"
  ON public.subjects
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Authenticated can delete subjects"
  ON public.subjects
  FOR DELETE
  TO authenticated
  USING (true);

GRANT SELECT ON public.subjects TO anon, authenticated;
GRANT INSERT, UPDATE, DELETE ON public.subjects TO authenticated;
