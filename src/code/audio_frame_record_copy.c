#include "types.h"

typedef struct AudioFrameSmallRecord {
    u8 bytes[40];
} AudioFrameSmallRecord;

extern AudioFrameSmallRecord *D_80073430;
extern void *D_80073438;
extern AudioFrameSmallRecord *D_8007343C;
extern void func_800372B4(u16 index, u8 *destination);

void audio_frame_record_copy(u32 index, AudioFrameSmallRecord *destination)
{
    AudioFrameSmallRecord *saved_destination = destination;
    u32 saved_index = index;
    u16 masked_index = saved_index;
    AudioFrameSmallRecord *source;

    if (masked_index != 0xFFFF) {
        register u32 original_index __asm__("$4");
        register u32 flag __asm__("$2");

        __asm__("" : "=r"(original_index));
        flag = original_index & 0x8000;
        __asm__("" : : "r"(flag));

        if (flag) {
            register u32 operand __asm__("$5") = masked_index;
            register u32 offset __asm__("$2") = operand & 0x7FFF;

            __asm__("" : "=r"(offset) : "0"(offset), "r"(operand));
            source = &D_8007343C[offset];
        } else {
            source = &D_80073430[masked_index];
        }

        __builtin_memcpy(saved_destination, source, sizeof(*source));

        if (D_80073438 != 0) {
            func_800372B4(saved_index, &saved_destination->bytes[14]);
        }
    } else {
        saved_destination->bytes[13] = 0xFF;
        saved_destination->bytes[14] = 0xFF;
    }
}
