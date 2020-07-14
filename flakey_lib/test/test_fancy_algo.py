from algorithms.fancy_algorithm import fancy_algorithm
import pytest

def test_fancy_algo():
    assert fancy_algorithm(b'\x41') == 0x41 ^ 0xaa


@pytest.mark.skip()
def test_fancy_algo_fail():
    assert 0 == 1
