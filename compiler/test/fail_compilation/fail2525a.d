/*
TEST_OUTPUT:
---
fail_compilation/fail2525a.d(14): Error: class `fail2525a.C` interface function `void foo()` is not implemented
---
*/
// https://issues.dlang.org/show_bug.cgi?id=2525

interface A
{
	void foo();
}

abstract class B : A
{
}

class C : B
{
}
