#include "types.h"

typedef struct {
    s16 pad;
    s16 id;
} Entry;

typedef struct {
    Entry entries[200];
    s16 count;
} Table;

extern char D_8006BFA0[];
extern Table *D_800C5094;

char *func_8008DF68(s16);
void func_8002E65C(char *, char *);

void func_800AFFF8(u16 index, char *dst) {
    if (index >= D_800C5094->count) {
        func_8002E65C(dst, D_8006BFA0);
    } else {
        func_8002E65C(dst, func_8008DF68((D_800C5094->entries + index)->id));
    }
}
