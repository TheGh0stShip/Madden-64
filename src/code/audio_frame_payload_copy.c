#include "types.h"

typedef struct AudioFramePayload {
    u8 bytes[110];
} AudioFramePayload;

typedef struct AudioFrameRecord {
    u8 header[107];
    AudioFramePayload payload;
} AudioFrameRecord;

typedef struct AlternateAudioFrameRecord {
    AudioFramePayload payload;
} AlternateAudioFrameRecord;

extern u16 D_8008AF9C;
extern AudioFrameRecord *D_80073434;
extern AlternateAudioFrameRecord *D_80073438;
extern u16 func_80028A58(u16 index);

void audio_frame_payload_copy(u16 index, AudioFramePayload *destination)
{
    AudioFramePayload *source;

    if (D_8008AF9C == 0) {
        register u32 work_a0 __asm__("$4") = index;
        register u32 temp_v1 __asm__("$3");
        register u32 temp_v0 __asm__("$2");

        temp_v0 = work_a0 & 0xFFFF;
        temp_v1 = temp_v0 << 3;
        temp_v1 -= temp_v0;
        work_a0 = (u32)D_80073434;
        temp_v0 = temp_v1 << 5;
        temp_v0 -= temp_v1;
        temp_v0 = work_a0 + temp_v0;
        source = (AudioFramePayload *)(temp_v0 + 107);
    } else {
        source = &D_80073438[func_80028A58(index)].payload;
    }
    *destination = *source;
}
