#include "types.h"

typedef struct {
    u16 unk_00;
    u16 unk_02;
} Struct_800A9C5C_Entry;

typedef struct {
    Struct_800A9C5C_Entry unk_000[200];
    s16 unk_320;
} Struct_800A9C5C_List;

typedef struct {
    u32 unk_00;
    u8 unk_04[4];
} Struct_800A9C5C_Name;

char *func_80022A3C(u16, u16);
char *func_8002E65C(char *, char *);
char *func_8003AA28(u16);
char *func_800D39FC(s16, u8 *, s32, char *, s32);
extern char D_8006BE64[];
extern char D_8006BFA0[];
extern s16 D_800BDFA8;
extern s16 D_800C502A;
extern u8 *D_800C505C;
extern Struct_800A9C5C_List *D_800C5094;
extern s16 D_800C5D30;

void func_800A9C5C(u32 arg0, u32 arg1, char *arg2) {
    char *name;

    if (arg1 == 0) {
        if (D_800C5094->unk_320 == 0) {
            if (arg0 == 0) {
                func_8002E65C(arg2, D_8006BE64);
            } else {
                goto bad;
            }
        } else if (arg0 < D_800C5094->unk_320) {
            if (D_800C5D30 == 0) {
                name = func_8003AA28((arg0 + D_800C5094->unk_000)->unk_02);
            } else {
                name = func_80022A3C(0, (arg0 + D_800C5094->unk_000)->unk_02);
            }
            func_8002E65C(arg2, name);
        } else {
            goto bad;
        }
    } else if (arg0 >= D_800C5094->unk_320 || D_800C502A < arg1) {
    bad:
        func_8002E65C(arg2, D_8006BFA0);
    } else {
        if (D_800C5D30 == 0) {
            func_800D39FC((arg0 + D_800C5094->unk_000)->unk_02, &D_800C505C[(D_800BDFA8 + arg1) * 8 + 4], 0, arg2, 4);
        } else {
            func_800D39FC((arg0 + D_800C5094->unk_000)->unk_02, &D_800C505C[(D_800BDFA8 + arg1) * 8 + 4], 0, arg2, 0);
        }
    }
}
