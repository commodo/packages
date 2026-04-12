[ "$1" = python3-pyroute2 ] || exit 0

python3 - << 'EOF'
import pyroute2
from pyroute2 import IPRoute
from pyroute2.netlink import nlmsg

assert pyroute2.__version__ is not None

# Verify key classes are importable
assert IPRoute is not None
assert nlmsg is not None

print("python3-pyroute2 OK")
EOF
