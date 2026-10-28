-- İzmir'in Kurtuluşu (9 Eylül 1922) kaydı kaldırıldı.
-- Tek etkinliği ve tek kategori bağı vardı; subject'i de boşta kalmaması için silindi.
-- event_categories bağı ON DELETE CASCADE ile temizlenir.
-- Kurtuluş günlerinde Maraş, Urfa ve Antep kalıyor.

DELETE FROM public.events e
WHERE e.subject_id IN (
  SELECT s.id
  FROM public.subjects s
  JOIN public.categories c ON c.id = s.category_id
  WHERE c.slug = 'tarihi-olaylar'
    AND s.name = $n$İzmir'in Kurtuluşu$n$
);

DELETE FROM public.subjects s
USING public.categories c
WHERE c.id = s.category_id
  AND c.slug = 'tarihi-olaylar'
  AND s.name = $n$İzmir'in Kurtuluşu$n$;
