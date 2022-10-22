**tl;dr** `locus` is ~5x faster than `geolix`

```console
$ MIX_ENV=bench mix run bench/lookup.exs
Operating System: macOS
CPU Information: Apple M1
Number of Available Cores: 8
Available memory: 8 GB
Elixir 1.14.0
Erlang 25.0.4

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 2 s
reduction time: 0 ns
parallel: 1
inputs: dbip, maxmind
Estimated total run time: 54 s

Benchmarking control with input dbip ...
Benchmarking control with input maxmind ...
Benchmarking geolix with input dbip ...
Benchmarking geolix with input maxmind ...
Benchmarking locus with input dbip ...
Benchmarking locus with input maxmind ...

##### With input dbip #####
Name              ips        average  deviation         median         99th %
control     2838.41 K        0.35 μs  ±8116.01%        0.25 μs        0.46 μs
locus        106.37 K        9.40 μs    ±62.59%       10.42 μs       14.67 μs
geolix        22.61 K       44.23 μs   ±208.04%       12.17 μs      406.93 μs

Comparison:
control     2838.41 K
locus        106.37 K - 26.68x slower +9.05 μs
geolix        22.61 K - 125.55x slower +43.88 μs

Memory usage statistics:

Name            average  deviation         median         99th %
control         0.55 KB     ±0.00%        0.55 KB        0.55 KB
locus          22.07 KB    ±36.50%       25.26 KB       26.15 KB
geolix         16.60 KB    ±32.90%       18.77 KB       19.31 KB

Comparison:
control         0.55 KB
locus          22.07 KB - 39.78x memory usage +21.51 KB
geolix         16.60 KB - 29.92x memory usage +16.04 KB

##### With input maxmind #####
Name              ips        average  deviation         median         99th %
control     2864.55 K        0.35 μs  ±8061.04%        0.25 μs        0.46 μs
locus         86.85 K       11.51 μs    ±70.32%       10.75 μs       22.79 μs
geolix        15.76 K       63.44 μs   ±141.34%       17.25 μs      322.44 μs

Comparison:
control     2864.55 K
locus         86.85 K - 32.98x slower +11.17 μs
geolix        15.76 K - 181.74x slower +63.09 μs

Memory usage statistics:

Name            average  deviation         median         99th %
control         0.55 KB     ±0.00%        0.55 KB        0.55 KB
locus          28.06 KB    ±43.50%       27.20 KB       47.01 KB
geolix         23.22 KB    ±41.31%       22.59 KB       37.66 KB

Comparison:
control         0.55 KB
locus          28.06 KB - 50.59x memory usage +27.51 KB
geolix         23.22 KB - 41.86x memory usage +22.66 KB
```
