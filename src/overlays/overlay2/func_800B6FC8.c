#include "types.h"

typedef struct {
    u8 pad[0x60];
    u8 unk_60;
    u8 unk_61;
} Unk8003A7B8;

typedef struct {
    s32 unk_000[200];
    s16 unk_320;
} Unk800C3A90;

extern s16 D_800C5016;
extern s8 D_800C509C;
extern Unk800C3A90 *D_800C3A90[][3][22];
extern char D_8008C25C[];
extern char D_8008C260[];
extern char D_8008C264[];
extern char D_8008C268[];
Unk8003A7B8 *func_8003A7B8(u16);
void func_800167FC(s32, char *);
void func_8002E688(char *, char *);
void func_8002E65C(char *, char *);

void func_800B6FC8(u16 arg0, char *arg1) {
    Unk8003A7B8 *p;
    Unk800C3A90 *s;
    s8 i;
    char buf[8];

    p = func_8003A7B8(D_800C5016);
    s = D_800C3A90[p->unk_60][p->unk_61][arg0];
    for (i = 0; i < s->unk_320; i++) {
        if (D_800C5016 == s->unk_000[i]) {
            break;
        }
    }
    if (D_800C509C != 0) {
        i++;
    } else {
        i = 1;
    }
    if (i < 10 || i > 20) {
        func_800167FC(i, buf);
        switch (i % 10) {
        case 1:
            func_8002E688(buf, D_8008C25C);
            break;
        case 2:
            func_8002E688(buf, D_8008C260);
            break;
        case 3:
            func_8002E688(buf, D_8008C264);
            break;
        default:
            func_8002E688(buf, D_8008C268);
            break;
        }
    } else {
        func_800167FC(i, buf);
        func_8002E688(buf, D_8008C268);
    }
    func_8002E65C(arg1, buf);
}
