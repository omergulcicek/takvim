-- Takvim tablolarını kendi şemasına taşır: aynı Supabase projesi başka uygulamalara da hizmet edecek.
-- ALTER TABLE ... SET SCHEMA veriyi, indeksleri, RLS kurallarını, tetikleyicileri ve yetkileri birlikte taşır.

create schema if not exists takvim;

grant usage on schema takvim to anon, authenticated, service_role;

alter table public.categories set schema takvim;
alter table public.events set schema takvim;
alter table public.subjects set schema takvim;
alter table public.event_gregorian_dates set schema takvim;
alter table public.event_categories set schema takvim;

alter function public.set_updated_at() set schema takvim;

-- Şemaya sonradan eklenecek tablolar da aynı yetkilerle açılsın.
alter default privileges in schema takvim grant select on tables to anon, authenticated;
alter default privileges in schema takvim grant all on tables to service_role;
alter default privileges in schema takvim grant all on sequences to service_role;

-- Geçiş köprüsü: yeni kod yayına çıkana kadar eski adlarla gelen okuma ve yazmalar yeni tablolara gider.
-- security_invoker, RLS'nin çağıran kullanıcıya göre çalışmasını sağlar. Geçiş doğrulanınca silinecek.
create view public.categories with (security_invoker = true) as select * from takvim.categories;
create view public.events with (security_invoker = true) as select * from takvim.events;
create view public.subjects with (security_invoker = true) as select * from takvim.subjects;
create view public.event_gregorian_dates with (security_invoker = true) as select * from takvim.event_gregorian_dates;
create view public.event_categories with (security_invoker = true) as select * from takvim.event_categories;

revoke all on public.categories, public.events, public.subjects, public.event_gregorian_dates, public.event_categories from anon, authenticated;
grant select on public.categories, public.events, public.subjects, public.event_gregorian_dates, public.event_categories to anon, authenticated;
