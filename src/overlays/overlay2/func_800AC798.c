#include "types.h"

typedef struct {
    u8 pad0[0x36];
    u8 name[0x13];
    u8 unk_49[1];
} Entry;

typedef struct {
    u8 pad0[0x60];
    s32 unk_60;
    s32 unk_64;
} List;

extern char D_800C297C[];
extern char D_800C2688[];
extern char D_8006BFA0[];

Entry *func_800E1E04(s16);
char *func_8002E65C(void *, const void *);
u32 func_8004DF94(u8 *);

void func_800AC798(s32 index, char *out, List *list) {
    char invalid[19] = "(INVALID FILENAME)";
    char dots[4] = "...";
    Entry *entry;
    s32 count;

    count = list->unk_64;
    if ((count == 0) & ((u16)index == 0)) {
        if (list->unk_60 == 1) {
            func_8002E65C(out, D_800C297C);
        } else {
            func_8002E65C(out, D_800C2688);
        }
    } else if (list->unk_60 != 0 && (u16)index < (u16)count &&
               (entry = func_800E1E04(index)) != 0) {
        if (entry->name[0] == 0) {
            func_8002E65C(entry->name, invalid);
        }
        if (func_8004DF94(entry->name) >= 25) {
            func_8002E65C(entry->unk_49, dots);
        }
        func_8002E65C(out, entry->name);
    } else {
        func_8002E65C(out, D_8006BFA0);
    }
}
