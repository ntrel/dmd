/*
TEST_OUTPUT:
---
fail_compilation/fail2525b.d(15): Error: class `fail2525b.B` interface function `void foo()` is not implemented
fail_compilation/fail2525b.d(19): Error: class `fail2525b.D` interface function `void foo()` is not implemented
---
*/
// https://issues.dlang.org/show_bug.cgi?id=2525

interface A
{
	void foo();
}

class B : A
{
}

abstract class C : A
{
	void bar();
}

class D : C
{
    // FIXME: no error for missing bar!
}
