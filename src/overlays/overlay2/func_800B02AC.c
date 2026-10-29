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

char *func_80092EC4(s32);
s32 func_8008DBEC(s16);
void func_8002E65C(char *, char *);

void func_800B02AC(u16 index, char *dst) {
    if (index >= D_800C5094->count) {
        func_8002E65C(dst, D_8006BFA0);
    } else {
        func_8002E65C(dst, func_80092EC4(func_8008DBEC((D_800C5094->entries + index)->id)));
    }
}
