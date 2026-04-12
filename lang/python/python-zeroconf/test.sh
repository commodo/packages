[ "$1" = python3-zeroconf ] || exit 0

python3 - << 'EOF'
import zeroconf
from zeroconf import Zeroconf, ServiceBrowser, ServiceInfo
from zeroconf._dns import DNSRecord, DNSAddress

assert zeroconf.__version__ is not None
assert Zeroconf is not None
assert ServiceBrowser is not None
assert ServiceInfo is not None

print("python3-zeroconf OK")
EOF
