void f(int[3] array) { }

void main()
{
    int[] xs = [1,2,3,4,5,6];
    int i = xs[1]; // runtime value
    f(xs[i .. i+3]);
    static assert(!__traits(compiles, f(xs[i++ .. i + 3])));
    static assert(!__traits(compiles, f(xs[cast(bool)i .. i + 3])));
    static assert(!__traits(compiles, f(xs[i .. cast(ubyte)i + 3])));

    static @property int p()
    {
        static si = 2;
        return si++;
    }
    static assert(!__traits(compiles, f(xs[p .. p+3])));
}

struct S
{
    ubyte[100] m_data;

    ref inout(ubyte[14]) foo(uint n) inout
    {
        uint offset = 2 + 14 * n;
        return m_data[offset .. offset + 14];
    }
}
