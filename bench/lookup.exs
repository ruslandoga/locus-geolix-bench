:ok = :locus.start_loader(:dbip, "downloads/dbip-city-lite-2022-10.mmdb")
{:ok, {{2022, 10, 1}, {0, 33, 54}}} = :locus.await_loader(:dbip)

:ok =
  Geolix.load_database(%{
    id: :dbip,
    adapter: Geolix.Adapter.MMDB2,
    source: "downloads/dbip-city-lite-2022-10.mmdb"
  })

:ok = :locus.start_loader(:maxmind, "downloads/geolite2-city.mmdb")
{:ok, {{2022, 10, 20}, {15, 10, 18}}} = :locus.await_loader(:maxmind)

:ok =
  Geolix.load_database(%{
    id: :maxmind,
    adapter: Geolix.Adapter.MMDB2,
    source: "downloads/geolite2-city.mmdb"
  })

Benchee.run(
  %{
    "control" => fn _ -> B.rand_ipv4() end,
    "locus" => fn db -> :locus.lookup(db, B.rand_ipv4()) end,
    "geolix" => fn db -> Geolix.lookup(B.rand_ipv4(), where: db) end
  },
  inputs: %{"dbip" => :dbip, "maxmind" => :maxmind},
  memory_time: 2
)
