#include "types.h"

typedef struct {
    u16 id;
    u8 unk_02;
    u8 flags;
} AudioSlot;

extern s16 D_8006B9E4[];
extern AudioSlot D_80082D84[];
extern AudioSlot D_80084ED0[];

void func_8003E510(s16, s16, s32, s32);
void audio_slots_release_all(void);

void audio_slot_update(void) {
    s16 i;
    s16 j;
    s16 count;

    for (i = 0; i < 30; i += 2) {
        func_8003E510(D_8006B9E4[i], D_8006B9E4[i + 1], 0, 0);
        for (j = 0; j < 4; j++) {
            if (D_80082D84[j].id != 0xFFFF && (D_80082D84[j].flags & 0xE0) == 0x40) {
                count = (D_80082D84[j].flags & 0x1F) - 1;
                if (count == 0) {
                    D_80082D84[j].flags = 0x80;
                } else {
                    D_80082D84[j].flags = count | 0x40;
                }
            }
            if (D_80084ED0[j].id != 0xFFFF && (D_80084ED0[j].flags & 0xE0) == 0x40) {
                count = (D_80084ED0[j].flags & 0x1F) - 1;
                if (count == 0) {
                    D_80084ED0[j].flags = 0x80;
                } else {
                    D_80084ED0[j].flags = count | 0x40;
                }
            }
        }
        audio_slots_release_all();
    }
}
