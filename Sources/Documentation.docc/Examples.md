# Examples

Add two clock values:

```sh
numio 12:30 + 02:15
# 14:45
```

Wrap a clock result at midnight:

```sh
numio 23:30 + 01:00
# 00:30
```

Subtract a longer time from a clock:

```sh
numio 00:10 - 00:20
# 23:50
```

Combine a clock with a duration:

```sh
numio 12:00 + 1h 24min - 00:10
# 13:14
```

Keep seconds in the result when an input has seconds:

```sh
numio 12:30:15 + 00:00:50
# 12:31:05
```

Add durations without wrapping at 24 hours:

```sh
numio 1h + 24min
# 01:24
```
