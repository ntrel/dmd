/*
REQUIRED_ARGS: -preview=tuples
*/

struct Tuple(T...)
{
    T expand;
    alias this = expand;
}
auto tuple(T...)(T args) => Tuple!T(args);

void main()
{
    string b;
    (int a, b) = tuple(1, "2");
    assert(a == 1);
    assert(b == "2");

    // nested UnpackExp
    string d;
    double e, h;
    (int c, (d, e)) = tuple(1, tuple("4", 3.0));
    (int f, (auto g, h)) = tuple(1, tuple("4", 3.0));
    assert(c == 1 && f == c);
    assert(d == "4" && g == d);
    assert(e == 3.0 && h == e);

    // nested UnpackDeclaration
    int i;
    (auto (j,), i) = tuple(tuple("5"), 1);
    assert(j == "5");
    assert(i == 1);
}
