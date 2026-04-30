create table if not exists public.munju_leaderboard_players (
  client_id text primary key check (char_length(client_id) between 12 and 80),
  nickname text not null check (char_length(nickname) between 1 and 16),
  score bigint not null check (score >= 0 and score <= 9999999999),
  level int not null default 1,
  prestige int not null default 0,
  fame int not null default 0,
  total_core_stats int not null default 0,
  gems int not null default 0,
  clips int not null default 0,
  raid_clears int not null default 0,
  titles int not null default 0,
  facilities int not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.munju_leaderboard_players enable row level security;

drop policy if exists "public leaderboard players read" on public.munju_leaderboard_players;
create policy "public leaderboard players read"
on public.munju_leaderboard_players
for select
to anon
using (true);

drop policy if exists "public leaderboard players insert" on public.munju_leaderboard_players;
create policy "public leaderboard players insert"
on public.munju_leaderboard_players
for insert
to anon
with check (true);

drop policy if exists "public leaderboard players update" on public.munju_leaderboard_players;
create policy "public leaderboard players update"
on public.munju_leaderboard_players
for update
to anon
using (true)
with check (true);

grant select, insert, update on public.munju_leaderboard_players to anon;
