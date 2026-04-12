#!/bin/sh

[ "$1" = python3-lru-dict ] || exit 0

python3 - << 'EOF'
from lru import LRU

cache = LRU(3)
cache["a"] = 1
cache["b"] = 2
cache["c"] = 3
assert len(cache) == 3

# Access "a" to make it recently used
_ = cache["a"]

# Add "d" - should evict "b" (least recently used)
cache["d"] = 4
assert len(cache) == 3
assert "a" in cache
assert "b" not in cache
assert "c" in cache
assert "d" in cache

# Test peek (doesn't update LRU order)
cache.peek("c")

print("python3-lru-dict OK")
EOF
