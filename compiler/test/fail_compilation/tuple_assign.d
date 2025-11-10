/*
REQUIRED_ARGS: -preview=tuples
TEST_OUTPUT:
---
fail_compilation/tuple_assign.d(23): Error: cannot implicitly convert expression `t.__expand_field_0` of type `string` to `int`
fail_compilation/tuple_assign.d(23): Error: cannot resolve type for b = t.__expand_field_0 , c = t.__expand_field_1
fail_compilation/tuple_assign.d(25): Error: right hand side of unpack statement must resolve to a tuple or expression sequence, not `int`
fail_compilation/tuple_assign.d(27): Error: cannot modify constant `2`
fail_compilation/tuple_assign.d(27): Error: cannot resolve type for (Tuple!int __tup74 = tuple(1);) , 2 = __tup74.__expand_fi...
fail_compilation/tuple_assign.d(28): Error: incompatible number of components for unpack statement (`1` vs. `2`)
fail_compilation/tuple_assign.d(30): Error: cannot implicitly convert expression `0` of type `int` to `string`
fail_compilation/tuple_assign.d(30): Error: cannot resolve type for b = 0 , a = 0
fail_compilation/tuple_assign.d(31): Error: incompatible number of components for unpack statement (`2` vs. `1`)
---
*/

void main()
{
    string a;
    int b, c;
    auto t = ("two", 3);
    (a, b) = t; // OK
    (b, c) = t; // b type error

    (b,) = 1; // wrong RHS
    (b,) = (1,); // OK
    (2,) = (1,); // not lvalue
    (b,) = (1, 2); // too many

    (b, a) = Seq!(0, 0); // a type error
    (b, c) = Seq!1; // too few
}

alias Seq(A...) = A;
