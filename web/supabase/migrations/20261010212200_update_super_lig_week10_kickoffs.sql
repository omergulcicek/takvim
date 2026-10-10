-- Süper Lig 10. hafta: TFF onaylı kickoff (placeholder 12:00 düzeltmesi)
-- Kaynak: https://www.konhaber.com/spor/trendyol_super_lig_de_7_16_haftalarin_programi_aciklandi-2009171h

UPDATE public.events
SET
  start_date = ('2026-10-30 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-10-30 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Konyaspor - Galatasaray'
  AND start_date = ('2026-11-01 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-10-31 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-10-31 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Fenerbahçe - Göztepe'
  AND start_date = ('2026-11-01 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-11-01 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-11-01 16:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Trabzonspor - Gaziantep FK'
  AND start_date = ('2026-11-01 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');

UPDATE public.events
SET
  start_date = ('2026-11-01 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-11-01 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Kasımpaşa - Beşiktaş'
  AND start_date = ('2026-11-01 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
