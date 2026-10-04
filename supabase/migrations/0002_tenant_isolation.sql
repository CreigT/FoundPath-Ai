-- Phase 2: complete owner isolation for child tables and safe public tag resolution.
alter table public.recovery_tags add column if not exists owner_id uuid references auth.users(id) on delete cascade;
update public.recovery_tags t set owner_id=i.owner_id from public.items i where t.item_id=i.id and t.owner_id is null;
alter table public.recovery_tags alter column owner_id set not null;
alter table public.finder_reports add column if not exists owner_id uuid references auth.users(id) on delete cascade;
update public.finder_reports r set owner_id=i.owner_id from public.items i where r.item_id=i.id and r.owner_id is null;
alter table public.finder_reports alter column owner_id set not null;
create policy "owners manage tags" on public.recovery_tags for all using(auth.uid()=owner_id) with check(auth.uid()=owner_id);
create policy "owners read reports" on public.finder_reports for select using(auth.uid()=owner_id);
create policy "owners update reports" on public.finder_reports for update using(auth.uid()=owner_id) with check(auth.uid()=owner_id);
create policy "owners read audit" on public.audit_events for select using(auth.uid()=owner_id);
create or replace function public.resolve_recovery_tag(p_token_hash text) returns table(item_id uuid,item_name text) language sql security definer set search_path=public as $$ select i.id,i.name from recovery_tags t join items i on i.id=t.item_id where t.token_hash=p_token_hash and t.active=true limit 1 $$;
revoke all on function public.resolve_recovery_tag(text) from public;
grant execute on function public.resolve_recovery_tag(text) to anon,authenticated;