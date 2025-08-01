/*
TEST_OUTPUT:
---
fail_compilation/foreach_storage.d(13): Error: cannot declare `enum` loop variables for non-unrolled foreach
fail_compilation/foreach_storage.d(14): Error: cannot declare `alias` loop variables for non-unrolled foreach
fail_compilation/foreach_storage.d(15): Error: cannot declare `enum` loop variables for non-unrolled foreach
fail_compilation/foreach_storage.d(16): Error: cannot declare `alias` loop variables for non-unrolled foreach
---
*/

void main()
{
    foreach (enum e; [1]) {}
    foreach (i, alias a; [1]) {}
    foreach (enum e; 0..1) {}
    foreach (alias a; 0..1) {}
}
