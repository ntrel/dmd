void f(int) @system
{
    void s() @safe
    {
        // safe false?
        static assert(__traits(canCall, f, 1));
    }
}

static assert(!__traits(canCall, f));
static assert(__traits(canCall, f, 1));
static assert(!__traits(canCall, f, 1, 2));
static assert(!__traits(canCall, f, ""));

void g(ref int);
int i;

static assert(!__traits(canCall, g, 1));
static assert(__traits(canCall, g, i));

struct S
{
    void f(int);
}

static assert(!__traits(canCall, S.f));
static assert(__traits(canCall, S.f, 1));
