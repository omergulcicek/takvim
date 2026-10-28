-- Hırvatistan 0 - 7 İngiltere (Uluslar Ligi)

UPDATE public.events
SET
  title = 'Hırvatistan 0 - 7 İngiltere',
  description = NULLIF(E'Harry Kane 8'', 53''
Jude Bellingham 21''
Anthony Gordon 39''
Bukayo Saka 45'', 68''
Morgan Rogers 87''', '')
WHERE title = 'Hırvatistan - İngiltere'
   OR title = 'Hırvatistan 0 - 7 İngiltere';
