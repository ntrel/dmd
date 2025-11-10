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
    string b, d;
    double e, h;

    (int a, b) = tuple(1, "2");
    assert(a == 1);
    assert(b == "2");

    (int c, (d, e)) = tuple(1, tuple("2", 3.0));
    (int f, (auto g, h)) = tuple(1, tuple("2", 3.0));
    assert(c == 1 && f == c);
    assert(d == "2" && g == d);
    assert(e == 3.0 && h == e);
}
