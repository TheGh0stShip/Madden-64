#include "types.h"

#define NULL 0

typedef struct {
    u8 pad00[0x34];
    s16 name;
} Item;

typedef struct {
    u8 pad00[0x60];
    s32 unk60;
    s32 count;
} List;

extern char D_8006BFA0[];

Item *func_800E1E04(s16);
void func_800167FC(s16, char *);
void func_8002E65C(char *, char *);

void func_800AC928(s16 index, char *out, List *list) {
    Item *item;

    if (list->count != 0 && list->unk60 != 0 &&
            (u16)index < (u16)list->count) {
        item = func_800E1E04(index);
        if (item != NULL) {
            func_800167FC(item->name, out);
            return;
        }
    }
    func_8002E65C(out, D_8006BFA0);
}
