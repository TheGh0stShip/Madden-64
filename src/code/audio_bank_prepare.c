#include "types.h"

typedef struct {
    u16 id;
    u8 unk_2;
    u8 unk_3;
} AudioSlot;

typedef struct {
    u8 bank;
    u8 pad1[0x20F4 - 0x1];
    AudioSlot slots[4];
    u8 pad2104[0x214C - 0x2104];
} AudioTeam;

typedef struct AudioRecord {
    u16 id;
    u8 unused;
    u8 mode;
} AudioRecord;

typedef struct {
    u16 count;
    AudioRecord records[1];
} AudioTable;

extern AudioTable *D_800740C4;
extern s16 D_800740C8;
extern AudioTeam D_80080C90[2];

void gameplay_state_update(void);
s32 func_80024B90(u16 id);
void func_80024E9C(void);
s16 func_8003FE94(s32 team);
void func_8003FF14(AudioRecord *record, AudioSlot *slot);

void audio_bank_prepare(void)
{
    u16 i;
    u8 bank;
    s16 slot;

    for (i = 0; i < 4; i++) {
        D_80080C90[0].slots[i].id = 0xFFFF;
        D_80080C90[1].slots[i].id = 0xFFFF;
    }
    if (D_800740C8 == 1) {
        gameplay_state_update();
        for (i = 0; i < D_800740C4->count; i++) {
            bank = func_80024B90(D_800740C4->records[i].id);
            if (bank == D_80080C90[0].bank) {
                slot = func_8003FE94(0);
                if (slot != -1) {
                    func_8003FF14(&D_800740C4->records[i], &D_80080C90[0].slots[slot]);
                }
            } else if (bank == D_80080C90[1].bank) {
                slot = func_8003FE94(1);
                if (slot != -1) {
                    func_8003FF14(&D_800740C4->records[i], &D_80080C90[1].slots[slot]);
                }
            }
        }
        func_80024E9C();
    }
}
