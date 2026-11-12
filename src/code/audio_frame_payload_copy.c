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
extern u8 *D_80073434;
extern AlternateAudioFrameRecord *D_80073438;
extern u16 func_80028A58(u16 index);

void audio_frame_payload_copy(u16 index, AudioFramePayload *destination)
{
    AudioFramePayload *source;

    if (D_8008AF9C == 0) {
        source = (AudioFramePayload *)(D_80073434 + index * sizeof(AudioFrameRecord));
        source = (AudioFramePayload *)((u8 *)source + 107);
    } else {
        source = &D_80073438[func_80028A58(index)].payload;
    }
    *destination = *source;
}
