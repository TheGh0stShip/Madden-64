#include "types.h"

extern u8 *D_8006BAC0;
extern u8 *D_8006BAC4;
extern u16 D_8006B9E0;
extern u16 D_8006B9E4[];
extern u16 D_80086190[];
extern s8 D_800C4EEB;

s32 func_80028224(void);
s16 func_8002B5EC(void);
void *memory_pool_range_take(s32 pool, u32 size);
void func_80033308(s32 arg0, void *dst, s32 size, s32 value);
void audio_frame_payload_copy(u16 id, u16 *out);
u16 func_8003A584(u16 id);
u16 func_8003A21C(u16 index);

void gameplay_state_update(void) {
    u16 slots[56];
    u16 i;
    u16 j;

    if ((u16)func_80028224() == 4) {
        D_8006BAC0 = memory_pool_range_take(0, 0x17E5);
        D_8006BAC4 = memory_pool_range_take(0, 0x17E5);
        func_80033308(0, D_8006BAC0, 0x17E5, 0xFF);
        func_80033308(0, D_8006BAC4, 0x17E5, 0xFF);
        for (i = 0; i < D_8006B9E0; i++) {
            audio_frame_payload_copy(D_8006B9E4[i], slots);
            for (j = 0; j < 55; j++) {
                if (slots[j] != 0xFFFF) {
                    if (!(slots[j] & 0x8000)) {
                        D_8006BAC0[slots[j]] = D_8006B9E4[i];
                        D_8006BAC4[slots[j]] = j;
                    } else {
                        D_8006BAC0[(slots[j] & ~0x8000) + 0x17CD] = D_8006B9E4[i];
                        D_8006BAC4[(slots[j] & ~0x8000) + 0x17CD] = j;
                    }
                }
            }
        }
        i = 0;
        while ((i = func_8003A584(i)) != 0) {
            if (D_8006BAC0[i] == 0xFF) {
                D_8006BAC0[i] = 100;
                D_8006BAC4[i] = 0;
            }
        }
    } else if (func_8002B5EC() == 0) {
        D_8006BAC0 = memory_pool_range_take(0, 0x17E5);
        D_8006BAC4 = memory_pool_range_take(0, 0x17E5);
        func_80033308(0, D_8006BAC0, 0x17E5, 0xFF);
        func_80033308(0, D_8006BAC4, 0x17E5, 0xFF);
        for (i = 0; i < D_8006B9E0; i++) {
            audio_frame_payload_copy(D_8006B9E4[i], slots);
            for (j = 0; j < 55; j++) {
                if (slots[j] != 0xFFFF) {
                    if (!(slots[j] & 0x8000)) {
                        D_8006BAC0[slots[j]] = D_8006B9E4[i];
                        D_8006BAC4[slots[j]] = j;
                    } else {
                        D_8006BAC0[(slots[j] & ~0x8000) + 0x17CD] = D_8006B9E4[i];
                        D_8006BAC4[(slots[j] & ~0x8000) + 0x17CD] = j;
                    }
                }
            }
        }
        for (j = 0; (i = func_8003A21C(j)) != 0xFFFF; j++) {
            if (!(i & 0x8000)) {
                D_8006BAC4[i] = j;
            } else {
                D_8006BAC4[(i & ~0x8000) + 0x17CD] = j;
            }
        }
    } else {
        D_8006BAC0 = memory_pool_range_take(0, 0x17E5);
        D_8006BAC4 = memory_pool_range_take(0, 0x17E5);
        func_80033308(0, D_8006BAC0, 0x17E5, 0xFF);
        func_80033308(0, D_8006BAC4, 0x17E5, 0xFF);
        for (i = 0; i < D_800C4EEB; i++) {
            audio_frame_payload_copy(D_80086190[i], slots);
            for (j = 0; j < 55; j++) {
                if (slots[j] != 0xFFFF) {
                    if (!(slots[j] & 0x8000)) {
                        D_8006BAC0[slots[j]] = D_80086190[i];
                        D_8006BAC4[slots[j]] = j;
                    } else {
                        D_8006BAC0[(slots[j] & ~0x8000) + 0x17CD] = D_80086190[i];
                        D_8006BAC0[(slots[j] & ~0x8000) + 0x17CD] = j;
                    }
                }
            }
        }
    }
}
