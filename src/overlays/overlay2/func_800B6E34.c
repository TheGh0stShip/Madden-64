#include "types.h"

typedef struct {
    /* 0x000 */ s32 ids[200];
    /* 0x320 */ s16 count;
} RankList;

extern RankList *D_800C3CA0[];
extern s16 D_800C5016;
extern s8 D_800C509C;
extern char D_8008C25C[];
extern char D_8008C260[];
extern char D_8008C264[];
extern char D_8008C268[];

void func_800167FC(s8 value, char *buf);
void func_8002E688(char *dst, char *src);
void func_8002E65C(char *dst, char *src);

void func_800B6E34(u16 list, char *out)
{
    char buf[8];
    RankList *ranks = D_800C3CA0[list];
    s8 i;

    for (i = 0; i < ranks->count; i++) {
        if (D_800C5016 == ranks->ids[i]) {
            break;
        }
    }
    i++;
    if (D_800C509C == 0) {
        i = 1;
    }
    if ((u8)(i - 10) > 10) {
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
    func_8002E65C(out, buf);
}
