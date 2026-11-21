#include "types.h"

typedef struct {
    u8 pad00[0x20];
    s32 unk20;
} Actor;

typedef struct {
    u8 pad00[0x60];
    s32 *unk60;
} Screen;

extern s32 D_8007238C;
extern Actor *D_8007A2D0;
extern Actor *D_8007A2D4;
extern s8 D_8007A388;
extern s32 D_8007A390;
extern s32 D_8007A394;
extern s32 D_80082DC8;
extern s32 D_80084F14;
extern s32 D_800854A0;
extern u8 D_800869D8[];
extern u8 D_800869F0[];
extern s32 D_800879AC;
extern s32 D_80088090;
extern s32 D_8008931C;
extern u8 D_800E75D8[];

s32 func_8000C8A0(s32);
void func_8000D834(s32, s32);
void func_8000D874(s32, s32);
void func_80016FE4(s32);
void func_80016FF4(s32);
void func_80017010(s32, s32);
void func_80032F3C(s32, s32);
void func_8003E460(void);
void func_800D3F4C(s32, s32 *, s32, s32);
void func_800DB1F8(void *);
void func_800DB478(void *);
s32 *func_800DD634(void);

void func_800CF2C0(Screen *screen) {
    s32 *state;
    s32 *list;
    u32 i;

    D_8007A388 = 0;
    func_800DB478(D_800E75D8);
    state = func_800DD634();
    while (D_8007A2D0->unk20 < 0xF4) {
        if (D_8007238C == 0) {
            D_8007A2D0->unk20 = 0xF4;
        } else {
            func_800D3F4C(6, &D_8007A2D0->unk20, 0xF4, 0);
        }
        func_8003E460();
    }
    func_8003E460();
    func_80032F3C(0, D_8007A390);
    func_80032F3C(0, D_8007A394);
    func_80017010(D_80082DC8, 1);
    func_80017010(D_80084F14, 1);
    func_8000D874(func_8000C8A0(D_80088090), (s32)D_8007A2D4);
    func_8000D874(func_8000C8A0(D_80088090), (s32)D_8007A2D0);
    func_8000D834(D_8008931C, (s32)D_8007A2D0);
    func_8000D834(D_8008931C, (s32)D_8007A2D4);
    func_8000D834(D_8008931C, state[72]);
    func_8000D834(D_8008931C, state[73]);
    func_80016FF4(state[18]);
    func_8000D834(D_8008931C, state[18]);
    func_80016FF4(state[5]);
    func_80016FF4(state[6]);
    func_80016FF4(state[7]);
    func_80016FF4(state[8]);
    state[5] = 0;
    state[6] = 0;
    state[7] = 0;
    state[8] = 0;
    state[9] = 0;
    state[10] = 0;
    state[11] = 0;
    state[12] = 0;
    for (i = 17; i < 67; i++) {
        state[i] = 0;
    }
    func_8003E460();
    func_80016FE4(D_800879AC);
    func_80016FE4(D_800854A0);
    list = screen->unk60;
    for (i = 0; i < 10; i++) {
        func_8000D834(D_8008931C, list[i]);
        state[67 + i] = 0;
    }
    func_800DB1F8(D_800869F0);
    func_800DB1F8(D_800869D8);
    func_80032F3C(0, (s32)list);
}
