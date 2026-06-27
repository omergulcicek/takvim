INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-02-01 21:00:00+00'::timestamptz, '2026-02-02 17:59:59+00'::timestamptz, '2026-02-01 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Berat Kandili'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-01-21 21:00:00+00'::timestamptz, '2027-01-22 17:59:59+00'::timestamptz, '2027-01-21 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Berat Kandili'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-02-18 21:00:00+00'::timestamptz, '2026-02-19 17:59:59+00'::timestamptz, '2026-02-18 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-02-07 21:00:00+00'::timestamptz, '2027-02-08 17:59:59+00'::timestamptz, '2027-02-07 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-01-27 21:00:00+00'::timestamptz, '2028-01-28 17:59:59+00'::timestamptz, '2028-01-27 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-01-15 21:00:00+00'::timestamptz, '2029-01-16 17:59:59+00'::timestamptz, '2029-01-15 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-12-25 21:00:00+00'::timestamptz, '2030-12-26 17:59:59+00'::timestamptz, '2030-12-25 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-12-14 21:00:00+00'::timestamptz, '2031-12-15 17:59:59+00'::timestamptz, '2031-12-14 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-12-03 21:00:00+00'::timestamptz, '2032-12-04 17:59:59+00'::timestamptz, '2032-12-03 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-11-22 21:00:00+00'::timestamptz, '2033-11-23 17:59:59+00'::timestamptz, '2033-11-22 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-11-11 21:00:00+00'::timestamptz, '2034-11-12 17:59:59+00'::timestamptz, '2034-11-11 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-10-31 21:00:00+00'::timestamptz, '2035-11-01 17:59:59+00'::timestamptz, '2035-10-31 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-03-15 21:00:00+00'::timestamptz, '2026-03-16 17:59:59+00'::timestamptz, '2026-03-15 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kadir Gecesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-03-04 21:00:00+00'::timestamptz, '2027-03-05 17:59:59+00'::timestamptz, '2027-03-04 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kadir Gecesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-03-18 21:00:00+00'::timestamptz, '2026-03-19 17:59:59+00'::timestamptz, '2026-03-18 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-03-07 21:00:00+00'::timestamptz, '2027-03-08 17:59:59+00'::timestamptz, '2027-03-07 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-02-24 21:00:00+00'::timestamptz, '2028-02-25 17:59:59+00'::timestamptz, '2028-02-24 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-02-12 21:00:00+00'::timestamptz, '2029-02-13 17:59:59+00'::timestamptz, '2029-02-12 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-02-02 21:00:00+00'::timestamptz, '2030-02-03 17:59:59+00'::timestamptz, '2030-02-02 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-01-22 21:00:00+00'::timestamptz, '2031-01-23 17:59:59+00'::timestamptz, '2031-01-22 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-01-12 21:00:00+00'::timestamptz, '2032-01-13 17:59:59+00'::timestamptz, '2032-01-12 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-12-21 21:00:00+00'::timestamptz, '2033-12-22 17:59:59+00'::timestamptz, '2033-12-21 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;


INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-12-10 21:00:00+00'::timestamptz, '2034-12-11 17:59:59+00'::timestamptz, '2034-12-10 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-11-29 21:00:00+00'::timestamptz, '2035-11-30 17:59:59+00'::timestamptz, '2035-11-29 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-03-19 21:00:00+00'::timestamptz, '2026-03-22 17:59:59+00'::timestamptz, '2026-03-19 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-03-08 21:00:00+00'::timestamptz, '2027-03-11 17:59:59+00'::timestamptz, '2027-03-08 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-02-25 21:00:00+00'::timestamptz, '2028-02-28 17:59:59+00'::timestamptz, '2028-02-25 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-02-13 21:00:00+00'::timestamptz, '2029-02-16 17:59:59+00'::timestamptz, '2029-02-13 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-02-03 21:00:00+00'::timestamptz, '2030-02-06 17:59:59+00'::timestamptz, '2030-02-03 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-01-23 21:00:00+00'::timestamptz, '2031-01-26 17:59:59+00'::timestamptz, '2031-01-23 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-01-13 21:00:00+00'::timestamptz, '2032-01-16 17:59:59+00'::timestamptz, '2032-01-13 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-12-22 21:00:00+00'::timestamptz, '2033-12-25 17:59:59+00'::timestamptz, '2033-12-22 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-12-11 21:00:00+00'::timestamptz, '2034-12-14 17:59:59+00'::timestamptz, '2034-12-11 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-11-30 21:00:00+00'::timestamptz, '2035-12-03 17:59:59+00'::timestamptz, '2035-11-30 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Ramazan Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-05-25 21:00:00+00'::timestamptz, '2026-05-26 17:59:59+00'::timestamptz, '2026-05-25 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-05-14 21:00:00+00'::timestamptz, '2027-05-15 17:59:59+00'::timestamptz, '2027-05-14 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-05-03 21:00:00+00'::timestamptz, '2028-05-04 17:59:59+00'::timestamptz, '2028-05-03 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-04-22 21:00:00+00'::timestamptz, '2029-04-23 17:59:59+00'::timestamptz, '2029-04-22 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-04-11 21:00:00+00'::timestamptz, '2030-04-12 17:59:59+00'::timestamptz, '2030-04-11 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-03-31 21:00:00+00'::timestamptz, '2031-04-01 17:59:59+00'::timestamptz, '2031-03-31 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-03-20 21:00:00+00'::timestamptz, '2032-03-21 17:59:59+00'::timestamptz, '2032-03-20 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-03-09 21:00:00+00'::timestamptz, '2033-03-10 17:59:59+00'::timestamptz, '2033-03-09 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-02-27 21:00:00+00'::timestamptz, '2034-02-28 17:59:59+00'::timestamptz, '2034-02-27 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-02-16 21:00:00+00'::timestamptz, '2035-02-17 17:59:59+00'::timestamptz, '2035-02-16 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı Arefesi'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;


INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-05-26 21:00:00+00'::timestamptz, '2026-05-30 17:59:59+00'::timestamptz, '2026-05-26 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-05-15 21:00:00+00'::timestamptz, '2027-05-19 17:59:59+00'::timestamptz, '2027-05-15 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-05-04 21:00:00+00'::timestamptz, '2028-05-08 17:59:59+00'::timestamptz, '2028-05-04 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-04-23 21:00:00+00'::timestamptz, '2029-04-27 17:59:59+00'::timestamptz, '2029-04-23 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-04-12 21:00:00+00'::timestamptz, '2030-04-16 17:59:59+00'::timestamptz, '2030-04-12 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-04-01 21:00:00+00'::timestamptz, '2031-04-05 17:59:59+00'::timestamptz, '2031-04-01 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-03-21 21:00:00+00'::timestamptz, '2032-03-25 17:59:59+00'::timestamptz, '2032-03-21 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-03-10 21:00:00+00'::timestamptz, '2033-03-14 17:59:59+00'::timestamptz, '2033-03-10 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-02-28 21:00:00+00'::timestamptz, '2034-03-04 17:59:59+00'::timestamptz, '2034-02-28 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-02-17 21:00:00+00'::timestamptz, '2035-02-21 17:59:59+00'::timestamptz, '2035-02-17 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Kurban Bayramı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-06-15 21:00:00+00'::timestamptz, '2026-06-16 17:59:59+00'::timestamptz, '2026-06-15 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-06-05 21:00:00+00'::timestamptz, '2027-06-06 17:59:59+00'::timestamptz, '2027-06-05 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-05-24 21:00:00+00'::timestamptz, '2028-05-25 17:59:59+00'::timestamptz, '2028-05-24 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-05-13 21:00:00+00'::timestamptz, '2029-05-14 17:59:59+00'::timestamptz, '2029-05-13 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-05-02 21:00:00+00'::timestamptz, '2030-05-03 17:59:59+00'::timestamptz, '2030-05-02 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-04-22 21:00:00+00'::timestamptz, '2031-04-23 17:59:59+00'::timestamptz, '2031-04-22 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-04-10 21:00:00+00'::timestamptz, '2032-04-11 17:59:59+00'::timestamptz, '2032-04-10 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-03-31 21:00:00+00'::timestamptz, '2033-04-01 17:59:59+00'::timestamptz, '2033-03-31 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-03-20 21:00:00+00'::timestamptz, '2034-03-21 17:59:59+00'::timestamptz, '2034-03-20 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-03-10 21:00:00+00'::timestamptz, '2035-03-11 17:59:59+00'::timestamptz, '2035-03-10 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Hicri Yılbaşı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-06-24 21:00:00+00'::timestamptz, '2026-06-25 17:59:59+00'::timestamptz, '2026-06-24 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-06-14 21:00:00+00'::timestamptz, '2027-06-15 17:59:59+00'::timestamptz, '2027-06-14 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;


INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-06-02 21:00:00+00'::timestamptz, '2028-06-03 17:59:59+00'::timestamptz, '2028-06-02 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-05-22 21:00:00+00'::timestamptz, '2029-05-23 17:59:59+00'::timestamptz, '2029-05-22 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-05-11 21:00:00+00'::timestamptz, '2030-05-12 17:59:59+00'::timestamptz, '2030-05-11 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-05-01 21:00:00+00'::timestamptz, '2031-05-02 17:59:59+00'::timestamptz, '2031-05-01 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-04-19 21:00:00+00'::timestamptz, '2032-04-20 17:59:59+00'::timestamptz, '2032-04-19 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-04-09 21:00:00+00'::timestamptz, '2033-04-10 17:59:59+00'::timestamptz, '2033-04-09 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-03-29 21:00:00+00'::timestamptz, '2034-03-30 17:59:59+00'::timestamptz, '2034-03-29 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-03-19 21:00:00+00'::timestamptz, '2035-03-20 17:59:59+00'::timestamptz, '2035-03-19 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Aşure Günü'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-08-23 21:00:00+00'::timestamptz, '2026-08-24 17:59:59+00'::timestamptz, '2026-08-23 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Mevlid Kandili'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-08-12 21:00:00+00'::timestamptz, '2027-08-13 17:59:59+00'::timestamptz, '2027-08-12 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Mevlid Kandili'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-12-09 21:00:00+00'::timestamptz, '2026-12-10 17:59:59+00'::timestamptz, '2026-12-09 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-11-28 21:00:00+00'::timestamptz, '2027-11-29 17:59:59+00'::timestamptz, '2027-11-28 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2028, '2028-11-17 21:00:00+00'::timestamptz, '2028-11-18 17:59:59+00'::timestamptz, '2028-11-17 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2029, '2029-11-06 21:00:00+00'::timestamptz, '2029-11-07 17:59:59+00'::timestamptz, '2029-11-06 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2030, '2030-10-27 21:00:00+00'::timestamptz, '2030-10-28 17:59:59+00'::timestamptz, '2030-10-27 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2031, '2031-10-16 21:00:00+00'::timestamptz, '2031-10-17 17:59:59+00'::timestamptz, '2031-10-16 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2032, '2032-10-05 21:00:00+00'::timestamptz, '2032-10-06 17:59:59+00'::timestamptz, '2032-10-05 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2033, '2033-09-24 21:00:00+00'::timestamptz, '2033-09-25 17:59:59+00'::timestamptz, '2033-09-24 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2034, '2034-09-13 21:00:00+00'::timestamptz, '2034-09-14 17:59:59+00'::timestamptz, '2034-09-13 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2035, '2035-09-02 21:00:00+00'::timestamptz, '2035-09-03 17:59:59+00'::timestamptz, '2035-09-02 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Üç Ayların Başlangıcı'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2026, '2026-12-09 21:00:00+00'::timestamptz, '2026-12-10 17:59:59+00'::timestamptz, '2026-12-09 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Regaib Kandili'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;



INSERT INTO public.event_gregorian_dates (event_id, gregorian_year, start_date, end_date, occurrence_date)
SELECT e.id, 2027, '2027-12-01 21:00:00+00'::timestamptz, '2027-12-02 17:59:59+00'::timestamptz, '2027-12-01 21:00:00+00'::timestamptz
FROM public.events e
JOIN public.categories c ON c.id = e.category_id
WHERE c.slug = 'dini-gunler' AND e.title = 'Regaib Kandili'
ON CONFLICT (event_id, gregorian_year) DO UPDATE SET start_date = EXCLUDED.start_date, end_date = EXCLUDED.end_date, occurrence_date = EXCLUDED.occurrence_date;