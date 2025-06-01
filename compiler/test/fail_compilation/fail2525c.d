/*
TEST_OUTPUT:
---
fail_compilation/fail2525c.d(20): Error: class `fail2525c.B` interface function `void foo()` is not implemented
fail_compilation/fail2525c.d(20): Error: class `fail2525c.B` interface function `void bar()` is not implemented
---
*/
// https://issues.dlang.org/show_bug.cgi?id=2525

interface IA
{
	void foo();
}

interface IB : IA
{
	void bar();
}

abstract class A : IB
{
}

class B : A
{
}
