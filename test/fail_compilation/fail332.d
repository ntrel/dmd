/*
TEST_OUTPUT:
---
fail_compilation/fail332.d(21): Error: function `fail332.foo(int _param_0, ...)` is not callable using argument types `()`
fail_compilation/fail332.d(21):        expected 1 argument(s), not 0
fail_compilation/fail332.d(22): Error: function `fail332.baz(int _param_0...)` is not callable using argument types `()`
fail_compilation/fail332.d(22):        expected 1 argument(s), not 0
fail_compilation/fail332.d(23): Error: function `fail332.bar(Object, int[2]...)` is not callable using argument types `(typeof(null), int)`
fail_compilation/fail332.d(23):        expected 2 variadic argument(s), not 0
---
*/

import core.vararg;

void foo(int, ...) {}
void baz(int...) {}
void bar(Object, int[2]...);

void test()
{
    foo();
    baz();
    bar(null, 2,3,1,3);
}
