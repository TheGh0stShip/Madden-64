#include "types.h"

typedef struct ModeEntry {
    u8 pad[0x2C];
    s32 mode;
    u8 rest[0x80];
} ModeEntry;

extern u8 D_80087138;

s16 func_80093CB0(void) {
    s16 count = 0;
    s16 index = 0;
    ModeEntry* entries = (ModeEntry*)&D_80087138;

    do {
        s32 mode = entries[index].mode;
        if (mode != 0x41) {
            if (mode != 0x200) {
                count++;
            }
        }
        index++;
    } while (index < 8);
    return count;
}
