[ "$1" = python3-pycrate ] || exit 0

python3 - << 'EOF'
import pycrate_core
from pycrate_core.elt import Element, Envelope, Sequence
from pycrate_core.base import Uint8, Uint16, Buf

# Test basic element creation and encoding
class TestMsg(Envelope):
    _GEN = (
        Uint8('Type'),
        Uint16('Length'),
    )

msg = TestMsg()
msg['Type'].set_val(0x01)
msg['Length'].set_val(42)

assert msg['Type'].get_val() == 0x01
assert msg['Length'].get_val() == 42

print("python3-pycrate OK")
EOF
