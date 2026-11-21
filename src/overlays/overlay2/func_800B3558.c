#include "types.h"

typedef struct {
    u8 pad0[0x8];
    s32 unk_8;
    u8 padC[0x68];
    s32 unk_74[1];
} Panel;

extern u8 D_800BDEDC[];
extern u8 D_800BDEE4[];
extern char D_8008C10C[];
u8 func_8003CBB8(void);
void func_8003CB98(u8 a);
void func_8001ECAC(s32 a, u8 b, s32 c);
void func_800167FC(s32 a, s32 b);
void func_8002E688(s32 a, char *b);
void func_8001EC20(s32 a, u8 b);

void func_800B3558(u8 cmd, u8 value, void *arg2, u8 slot) {
    Panel *panel;
    u8 sound;
    u8 index;
    s32 play;
    s32 update;

    update = 0;
    play = 0;
    panel = arg2;
    sound = func_8003CBB8();
    index = D_800BDEDC[sound];
    switch (cmd) {
    case 0:
        play = 1;
        update = 1;
        if (index < 5) {
            index++;
        } else {
            index = 0;
        }
        sound = D_800BDEE4[index];
        break;
    case 1:
        play = 1;
        update = 1;
        if (index != 0) {
            index--;
        } else {
            index = 5;
        }
        sound = D_800BDEE4[index];
        break;
    case 2:
        play = 1;
        index = value;
        sound = D_800BDEE4[index];
        break;
    case 3:
        update = 1;
        break;
    case 4:
        *(s32 *)panel = index;
        break;
    case 5:
        func_8001ECAC(panel->unk_8, slot, 6);
        break;
    case 6:
        func_8001ECAC(panel->unk_8, slot, 0);
        break;
    }
    if (play == 1) {
        func_8003CB98(sound);
    }
    if (update == 1) {
        s32 *entry; s32 *list = panel->unk_74; s32 off = slot * 4; entry = (s32 *)(off + (s32)list);
        func_800167FC(index * 20, *entry);
        func_8002E688(*entry, D_8008C10C);
        func_8001EC20(panel->unk_8, slot);
    }
}
