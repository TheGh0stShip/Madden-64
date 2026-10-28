#include "types.h"

typedef struct {
    u8 unk00[6];
    s16 unk06;
    u8 unk08[0xC];
    s32 unk14;
} Record;

extern s16 D_80064A72;
extern s16 D_800718E0;
extern s16 D_800718E4;
extern void *D_800718E8;
extern s32 D_800718F0;
extern s16 D_800718FC;
extern s16 D_800718FE;
extern Record D_8008A5E0;
extern s16 D_8008AF80;
extern s16 D_8008B212;
extern s32 D_8008B340;

void *func_80032E00(s32, s32);
void func_800A2F10(Record *, s16, s16, s16);

void func_800B65BC(void) {
    D_800718E0 = 0;
    D_800718E4 = 0;
    D_80064A72 = 0;
    D_800718F0 = 0;
    D_800718E8 = func_80032E00(0, 0x1A520);
    D_8008AF80 = 0;
    D_8008B212 = 1;
    D_8008B340 = 0;
    D_8008A5E0.unk14 = 0;
    func_800A2F10(&D_8008A5E0, D_800718FC, D_800718FE, D_8008A5E0.unk06);
}
