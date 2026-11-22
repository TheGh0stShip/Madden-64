#include "types.h"

typedef struct {
    u8 pad00[0x1C];
    s32 unk1C;
} Obj1C;

typedef struct {
    u8 pad00[0xC];
    s8 unkC;
} ObjC;

extern s16 D_800895D2;
extern u8 D_800C3093[];
extern u8 D_800C3094[];

void func_800DF6EC(void);
u8 *func_8004DFBC(u8 *, s32);
s32 func_8004DF94(u8 *);
void func_8001EC20(s32, s32);
s16 func_80016A24(s16, u8 *);
s8 func_80016B70(s16, s32);

s16 func_800A78F0(u32 flags, s16 cursor, u8 *text, s32 arg3, Obj1C *arg4, s16 arg5, ObjC *arg6, s32 arg7, s16 arg8) {
    u8 buf[40];
    s32 changed = 0;
    s16 pos = cursor;
    u8 c = text[cursor];
    s16 width;
    s16 i;
    u8 *p;
    s32 idx;

    if ((flags >> 9) & 1 & (cursor > 0)) {
        func_800DF6EC();
        pos = cursor - 1;
        c = text[pos];
    }
    if ((flags & 0x100) && pos + 1 < 10) {
        func_800DF6EC();
        pos++;
        c = text[pos];
        if (c == 0) {
            c = text[pos] = ' ';
            text[pos + 1] = 0;
        }
    }
    if (flags & 0x400) {
        func_800DF6EC();
        p = func_8004DFBC(D_800C3094, c);
        if (p == D_800C3094) {
            c = D_800C3093[func_8004DF94(p)];
        } else {
            c = D_800C3093[p - D_800C3094];
        }
        text[pos] = c;
        changed = 1;
    }
    if (flags & 0x800) {
        func_800DF6EC();
        idx = func_8004DFBC(D_800C3094, c)[1];
        c = idx;
        if (idx == 0) {
            c = D_800C3094[0];
        }
        text[pos] = c;
        changed = 1;
    }
    if ((changed != 0) & (arg8 == 1)) {
        func_8001EC20(arg3, arg5 + 1);
    }
    width = 0;
    if (pos != 0) {
        for (i = 0; i < pos; i++) {
            buf[i] = text[i];
        }
        buf[pos] = 0;
        width = func_80016A24(D_800895D2, buf);
    }
    buf[0] = text[pos];
    buf[1] = 0;
    if (arg7 + width != arg4->unk1C) {
        arg4->unk1C = arg7 + width;
    }
    arg6->unkC = func_80016B70(D_800895D2, text[pos]);
    return pos;
}
