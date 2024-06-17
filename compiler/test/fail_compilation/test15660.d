/* REQUIRED_ARGS: -preview=fixImmutableConv
TEST_OUTPUT:
---
fail_compilation/test15660.d(27): Error: cannot implicitly convert expression `f(v)` of type `int[]` to `immutable(int[])`
fail_compilation/test15660.d(35): Error: cannot copy `const(void)[]` to `void[]`
fail_compilation/test15660.d(35):        Source data has incompatible type qualifier(s)
fail_compilation/test15660.d(35):        Use `cast(void[])` to force copy
fail_compilation/test15660.d(37): Error: cannot copy `const(int*)[]` to `void[]`
fail_compilation/test15660.d(37):        Source data has incompatible type qualifier(s)
fail_compilation/test15660.d(37):        Use `cast(void[])` to force copy
fail_compilation/test15660.d(46): Error: cannot implicitly convert expression `a` of type `S[]` to `void[]`
---
*/

// https://issues.dlang.org/show_bug.cgi?id=15660

int[] f(ref void[] m) pure
{
    auto result = new int[5];
    m = result;
    return result;
}

void main()
{
    void[] v;
    immutable x = f(v);
}

// https://issues.dlang.org/show_bug.cgi?id=17148
void f(int*[] a, const int*[] b) @system
{
	void[] a1 = a;
	const(void)[] b1 = b;
	a1[] = b1[];
	*a[0] = 0; //modify const data
	a1[] = new const(int*)[2];
}

void g() @system
{
    S[] a = [S(5)];
    //a[0] = S(0); // error, modifying immutable member of S
    const void[] vc = a; // OK

    void[] va = a; // need to disallow
    va[] = [0]; // corrupt a[0]
    assert(a[0].i == 5); // fails
}

struct S
{
    const int i;
}
