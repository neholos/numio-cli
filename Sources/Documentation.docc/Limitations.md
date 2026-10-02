# Errors and limitations

Numio accepts time expressions, not dates or natural-language phrases. It does not handle time zones or calendar arithmetic.

Clock values must be in range. For example, `12:75` is invalid because minutes must be between `0` and `59`:

```sh
numio 12:75
```

Invalid input prints a diagnostic and exits with a non-zero status. An expression is required:

```sh
numio
```
