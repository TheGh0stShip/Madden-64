#include "types.h"

typedef struct {
    u8 pad00[4];
    void *table;
} Names;

typedef struct {
    u8 kind;
    u8 pad01[7];
    Names *names;
} Info;

typedef struct {
    u8 pad00[0x60];
    Info *info;
} Item;

extern char D_8006BFA0[];
extern u8 D_80080D6A[];

void func_8002E65C(char *, char *);
s32 func_8003A1D0(void);
s32 func_800AF1D4(s32);
void func_800AFA50(void *, u16, char *, s32);

void func_800B5600(u16 index, char *buf, Item *item) {
    Info *info = item->info;

    switch (info->kind) {
        case 0:
            if (index < (u16)func_8003A1D0()) {
                func_800AFA50(info->names->table, index, buf, 0xF);
            } else {
                func_8002E65C(buf, D_8006BFA0);
            }
            break;
        case 1:
            if (index < (u16)func_800AF1D4(0)) {
                func_800AFA50(D_80080D6A, index, buf, 0xF);
            } else {
                func_8002E65C(buf, D_8006BFA0);
            }
            break;
    }
}
