#!/bin/sh

[ "$1" = python3-dbus-fast ] || exit 0

python3 - << 'EOF'
import dbus_fast
from dbus_fast.message import Message, MessageType
from dbus_fast.signature import Variant

assert hasattr(dbus_fast, "__version__")

msg = Message(
    message_type=MessageType.METHOD_CALL,
    path="/org/example/Test",
    interface="org.example.Test",
    member="TestMethod",
)
assert msg.path == "/org/example/Test"
assert msg.interface == "org.example.Test"
assert msg.member == "TestMethod"

v = Variant("s", "hello")
assert v.type.token == "s"
assert v.value == "hello"

print("python3-dbus-fast OK")
EOF
