#include "types.h"

typedef struct {
    u16 id;
    u8 level;
    u8 flags;
} AudioSequenceSlot;

extern AudioSequenceSlot D_80082D84[];
extern AudioSequenceSlot D_80084ED0[];
extern u16 func_80031A1C(s32 range);
extern void func_8003F230(AudioSequenceSlot *slot);

void audio_sequence_configure(void) {
    s16 i;
    s16 flags;

    for (i = 0; i < 4; i++) {
        if (D_80082D84[i].id != 0xFFFF) {
            flags = D_80082D84[i].flags;
            if (flags == 0xE0) {
                if (func_80031A1C(0x50) + 0x2E > D_80082D84[i].level) {
                    func_8003F230(&D_80082D84[i]);
                }
            } else if ((flags & 0xE0) == 0x20) {
                flags = (flags & 0x1F) - 1; if (flags == 0) { D_80082D84[i].id = 0xFFFF; } else { D_80082D84[i].flags = flags | 0x20; }
            }
        }
        if (D_80084ED0[i].id != 0xFFFF) {
            flags = D_80084ED0[i].flags;
            if (flags == 0xE0) {
                if (func_80031A1C(0x50) + 0x2E > D_80084ED0[i].level) {
                    func_8003F230(&D_80084ED0[i]);
                }
            } else if ((flags & 0xE0) == 0x20) {
                flags = (flags & 0x1F) - 1; if (flags == 0) { D_80084ED0[i].id = 0xFFFF; } else { D_80084ED0[i].flags = flags | 0x20; }
            }
        }
    }
}
