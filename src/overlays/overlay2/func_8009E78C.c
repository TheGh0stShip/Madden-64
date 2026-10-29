#include "types.h"

extern char D_800C4EEC[][13];

char *func_8002E65C(char *dst, char *src); /* strcpy */

void func_8009E78C(u16 index, char *dst) {
    func_8002E65C(dst, D_800C4EEC[index]);
}
