#include "types.h"

typedef struct {
    u8 id0;
    u8 id1;
    u8 unk2[2];
    u8 kind;
    u8 unk5;
} Entry6;

extern Entry6 D_800C5C40[];
extern char D_8006BFA0[];
extern s16 D_800C5016;

char *func_8008DF68(s32);
void func_8002E65C(char *, char *);

void func_800AB9D8(u16 index, char *out) {
    if (D_800C5C40[index].kind == 9) {
        func_8002E65C(out, D_8006BFA0);
    } else {
        s32 id = D_800C5C40[index].id0;
        if ((u8)id == D_800C5016) {
            func_8002E65C(out, func_8008DF68(D_800C5C40[index].id1));
        } else {
            func_8002E65C(out, func_8008DF68(id));
        }
    }
}
