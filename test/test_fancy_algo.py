from flakey_lib.fancy_algorithm import fancy_algorithm

def test_fancy_alog():
    assert fancy_algorithm(b'\x41') == 0x41 ^ 0xaa