/*
TEST_OUTPUT:
---
fail_compilation/fail332.d(18): Error: function `fail332.foo(int _param_0, ...)` is not callable using argument types `()`
fail_compilation/fail332.d(18):        expected 1 argument(s), not 0
fail_compilation/fail332.d(19): Error: function `fail332.baz(int _param_0...)` is not callable using argument types `()`
fail_compilation/fail332.d(19):        expected 1 argument(s), not 0
---
*/

import core.vararg;

void foo(int, ...) {}
void baz(int...) {}

void bar()
{
    foo();
    baz();
}
