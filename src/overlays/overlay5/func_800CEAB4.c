#include "types.h"

typedef struct {
    s32 entries[200];
    s16 count;
} EntryList;

typedef struct {
    u8 pad_00[8];
    u16 count;
    s16 sel;
    u8 pad_0C;
    s8 unk_0D;
    u8 pad_0E[0x20];
    u8 flags;
    u8 pad_2F[0x29];
} Menu;

extern u8 D_8007A388;
extern u8 D_8007A38C;
extern EntryList *D_8007A390;
extern EntryList *D_8007A394;
extern s32 D_8007A398;
extern s32 D_8007A39C;
extern s16 D_8007A3A0;
extern s16 D_8007A3A4;
extern s16 D_8007A3A8;
extern s16 D_8007A3AC;
extern s8 D_80084FA8;
extern s8 D_800892B0;
extern u8 D_800869D8[];
extern u8 D_800869F0[];
extern u8 D_8006BC44[];
extern void *D_80087784[4][6];
extern Menu D_800E7580;
extern Menu D_800E75D8;

void func_800B7C80(void);
s32 *func_800DD634(void);
void func_800DB220(u8 *, s16);
void func_800DF72C(void);
void overlay5_runtime_stack_advance(void);
void func_800CF578(s32, s32);
void func_80032F3C(s32, EntryList *);
u16 func_80022AD8(u16, u16);
EntryList *overlay5_flagged_operation_dispatch(s32, s32, s32, s8, s32);
void func_800DB478(Menu *);
void func_800227F8(u16, u16, u16);
void func_80022918(u16, u16, u16);

void func_800CEAB4(s32 arg0, s32 arg1, s32 arg2) {
    s32 changed;
    s32 *disp;
    s16 key;
    s32 i;

    func_800B7C80();
    changed = 0;
    disp = func_800DD634();
    key = arg2;
    if ((s16)arg2 == 2 || (s16)arg2 == 3) {
        func_800DB220(D_800869D8, arg2);
        func_800DB220(D_800869F0, arg2);
    }
    switch (D_8007A388) {
        case 1:
            if (key == 0x11) {
                func_800DF72C();
                overlay5_runtime_stack_advance();
            }
            if (key == 0) {
                if (D_8007A3A0 > 0) {
                    D_8007A3A0--;
                    changed = 1;
                }
            }
            if (key == 1) {
                if (D_8007A3A0 + 1 < D_8007A390->count) {
                    D_8007A3A0++;
                    changed = 1;
                }
            }
            if (changed) {
                func_800DB220(D_800869D8, key);
                func_800CF578(D_8007A390->entries[D_8007A3A0], D_8007A394->entries[D_8007A3A4]);
                func_80032F3C(0, D_8007A394);
                D_8007A394 = overlay5_flagged_operation_dispatch(0x640002, 0x37, 0, D_80084FA8,
                    func_80022AD8(D_80084FA8, D_8007A390->entries[D_8007A3A0]) & 0x3F);
                D_800E75D8.sel = 0;
                D_800E75D8.unk_0D = 0;
                D_800E75D8.count = D_8007A394->count;
                func_800DB478(&D_800E75D8);
                D_8007A3A4 = 0;
                if (D_8007A394->count > 0) {
                    func_800CF578(D_8007A390->entries[D_8007A3A0], D_8007A394->entries[0]);
                } else {
                    for (i = 0; i < D_8007A38C; i++) {
                        D_80087784[0][i] = D_8006BC44;
                        D_80087784[1][i] = 0;
                        D_80087784[2][i] = 0;
                        D_80087784[3][i] = 0;
                    }
                    for (i = 20; i < 38; i++) {
                        disp[i] = 0;
                    }
                }
            }
            if (key == 8 && D_8007A394->count > 0) {
                D_8007A388 = 2;
                func_800DF72C();
                D_800E7580.flags |= 1;
                func_800DB478(&D_800E7580);
                D_800E75D8.flags &= ~1;
                func_800DB478(&D_800E75D8);
            }
            break;
        case 2:
            if (key == 0x11) {
                D_8007A388 = 1;
                func_800DF72C();
                D_800E7580.flags &= ~1;
                func_800DB478(&D_800E7580);
                D_800E75D8.flags |= 1;
                func_800DB478(&D_800E75D8);
            }
            if (key == 0) {
                if (D_8007A3A4 > 0) {
                    D_8007A3A4--;
                    func_800DB220(D_800869F0, 0);
                    func_800CF578(D_8007A390->entries[D_8007A3A0], D_8007A394->entries[D_8007A3A4]);
                }
            }
            if (key == 1) {
                if (D_8007A3A4 + 1 < D_8007A394->count) {
                    D_8007A3A4++;
                    func_800DB220(D_800869F0, 1);
                    func_800CF578(D_8007A390->entries[D_8007A3A0], D_8007A394->entries[D_8007A3A4]);
                }
            }
            if (key == 8 && D_8007A390->entries[D_8007A3A0] != D_8007A394->entries[D_8007A3A4]) {
                func_800DF72C();
                if (D_800892B0 == 0) {
                    func_800227F8(D_80084FA8, D_8007A394->entries[D_8007A3A4], D_8007A390->entries[D_8007A3A0]);
                } else {
                    func_80022918(D_80084FA8, D_8007A394->entries[D_8007A3A4], D_8007A390->entries[D_8007A3A0]);
                }
                D_8007A388 = 1;
                D_8007A3AC = D_8007A394->entries[D_8007A3A4];
                D_8007A3A8 = D_8007A390->entries[D_8007A3A0];
                func_80032F3C(0, D_8007A390);
                func_80032F3C(0, D_8007A394);
                D_8007A390 = overlay5_flagged_operation_dispatch(D_8007A398, 0x37, 0, D_80084FA8, D_8007A39C);
                D_8007A3A0 = 0;
                for (i = 0; i < D_8007A390->count; i++) {
                    if (D_8007A390->entries[i] == D_8007A3AC) {
                        D_8007A3A0 = i;
                        break;
                    }
                }
                D_8007A394 = overlay5_flagged_operation_dispatch(0x640002, 0x37, 0, D_80084FA8,
                    func_80022AD8(D_80084FA8, D_8007A390->entries[D_8007A3A0]) & 0x3F);
                D_8007A3A4 = 0;
                D_800E7580.sel = D_8007A3A0;
                D_800E7580.count = D_8007A390->count;
                D_800E7580.flags &= ~1;
                func_800DB478(&D_800E7580);
                D_800E75D8.sel = 0;
                D_800E75D8.unk_0D = 0;
                D_800E75D8.count = D_8007A394->count;
                D_800E75D8.flags |= 1;
                func_800DB478(&D_800E75D8);
                func_800CF578(D_8007A390->entries[D_8007A3A0], D_8007A394->entries[D_8007A3A4]);
            }
            break;
    }
}
