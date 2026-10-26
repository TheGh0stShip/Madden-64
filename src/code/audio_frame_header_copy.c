#include "types.h"

typedef struct AudioFrameHeader {
    u8 bytes[107];
} AudioFrameHeader;

typedef struct AudioFrameRecord {
    AudioFrameHeader header;
    u8 pad6B[110];
} AudioFrameRecord;

extern AudioFrameRecord *D_80073434;

void audio_frame_header_copy(u16 index, AudioFrameHeader *destination)
{
    register AudioFrameHeader *output __asm__("$7") = destination;
    register u32 work_a0 __asm__("$4") = index;
    register u32 temp_v1 __asm__("$3");
    register u32 temp_v0 __asm__("$2");
    register AudioFrameHeader *source __asm__("$6");

    __asm__("" : "=r"(output) : "0"(output));
    temp_v1 = work_a0 << 3;
    temp_v1 -= work_a0;
    work_a0 = (u32)D_80073434;
    temp_v0 = temp_v1 << 5;
    temp_v0 -= temp_v1;
    source = (AudioFrameHeader *)(work_a0 + temp_v0);
    *output = *source;
}
