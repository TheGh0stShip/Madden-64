#include "types.h"

extern u32 D_80073438;
extern u32 D_80073440;
u32 func_80037258(void);
s32 func_80024B90(u16 value);
s32 frame_identifier_find(u16 value);
void audio_frame_payload_copy(u16 index, u16 *entries);
u8 *func_8003A368(void);
void func_80037290(u32 state);

void func_800372B4(u32 value, u8 *destination) {
    u32 state;
    s32 id;
    u32 row;
    u32 i;
    u16 entries[56];
    u8 *table;

    if (D_80073440 != 0 && D_80073438 != 0) {
        state = func_80037258();
        id = (u8) func_80024B90(value);
        if (id != 0xFF) {
            row = (u16) frame_identifier_find(id);
            audio_frame_payload_copy(id, entries);
            for (i = 0; i < 55; i++) {
                if (entries[i] == value) {
                    table = func_8003A368();
                    table += row * 55;
                    *destination = table[i];
                    break;
                }
            }
        }
        func_80037290(state);
    }
}
