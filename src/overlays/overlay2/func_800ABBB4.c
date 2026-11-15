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

s8 *func_8008DBEC(s32, s32);
void func_8002E65C(char *, char *);
void func_800167FC(s8, char *);

void func_800ABBB4(u16 index, char *out) {
    s32 id;

    if (D_800C5C40[index].kind == 9) {
        func_8002E65C(out, D_8006BFA0);
        return;
    }
    id = D_800C5C40[index].id0;
    func_800167FC(func_8008DBEC(((u8)id != D_800C5016) ? id : D_800C5C40[index].id1, id)[2], out);
}
