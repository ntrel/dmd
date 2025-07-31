void f(int) @system
{
    void s() @safe
    {
        static assert(__traits(canCall, f, int));
    }
}

static assert(__traits(canCall, f, int));
static assert(!__traits(canCall, f, string));

void g(ref int);

static assert(__traits(canCall, f, int));
