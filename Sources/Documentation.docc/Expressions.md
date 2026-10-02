# Expressions

Pass one expression to `numio`. An expression starts with a value and can continue with any number of `+` or `-` operations. Operations run from left to right.

```text
numio <value> [<+ or -> <value> ...]
```

## Values

Use a clock value with hours, minutes, and optional seconds:

```text
HH
HH:mm
HH:mm:ss
```

Hours range from `0` to `24`; minutes and seconds range from `0` to `59`. `24` is valid only as `24:00` or `24:00:00`.

Use a duration with units, or a bare number of hours:

```text
2
1h
24min
90s
1h 24min
1h24min
```

Units are case-insensitive. Hour, minute, and second units accept common singular, plural, and abbreviated forms, such as `hour`, `hours`, `hr`, `min`, `minutes`, `s`, and `seconds`.

## Output

Clock arithmetic wraps at midnight. Duration arithmetic does not wrap. Results use `HH:mm`, or `HH:mm:ss` when an input includes seconds.
