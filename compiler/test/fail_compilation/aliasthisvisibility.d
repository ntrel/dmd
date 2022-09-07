// REQUIRED_ARGS: -de
/*
TEST_OUTPUT:
---
fail_compilation/aliasthisvisibility.d(10): Deprecation: alias this cannot have non-public visibility
---
*/
struct S
{
    private alias i this;
    private int i;
}
