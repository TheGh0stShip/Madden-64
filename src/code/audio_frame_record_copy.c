#include "types.h"

typedef struct {
    u8 bytes[40];
} AudioFrameSmallRecord;

extern AudioFrameSmallRecord *D_80073430;
extern void *D_80073438;
extern AudioFrameSmallRecord *D_8007343C;
extern void func_800372B4(u16 index, u8 *destination);

void audio_frame_record_copy(u16 index, AudioFrameSmallRecord *destination) {
    AudioFrameSmallRecord *source;

    if (index != 0xFFFF) {
        if (index & 0x8000) {
            source = &D_8007343C[index & ~0x8000];
        } else {
            source = &D_80073430[index];
        }
        *destination = *source;
        if (D_80073438 != 0) {
            func_800372B4(index, &destination->bytes[14]);
        }
    } else {
        destination->bytes[13] = 0xFF;
        destination->bytes[14] = 0xFF;
    }
}
