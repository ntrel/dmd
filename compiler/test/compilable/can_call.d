void f(int) @system
{
    void s() @safe
    {
        //FIXME static assert(!__traits(canCall, f, 1));
    }
}
static assert(!__traits(canCall, f));
static assert(__traits(canCall, f, 1));
static assert(!__traits(canCall, f, 1, 2));
static assert(!__traits(canCall, f, ""));

// lvalue argument
void g(ref int);
int i;
static assert(!__traits(canCall, g, 1));
static assert(__traits(canCall, g, i));

// method
struct S
{
    void f(int);
}
static assert(!__traits(canCall, S.f));
static assert(__traits(canCall, S.f, 1));

// IFTI
void h()() {
    //TODO ignore body errors
    //invalid;
};
static assert(__traits(canCall, h));
static assert(!__traits(canCall, h, 1));

void j(T)(T);
static assert(!__traits(canCall, j));
static assert(__traits(canCall, j, 1));
static assert(!__traits(canCall, j!int, ""));

// lambda
alias k = a => 3;
static assert(!__traits(canCall, k));
static assert(__traits(canCall, k, 1));
