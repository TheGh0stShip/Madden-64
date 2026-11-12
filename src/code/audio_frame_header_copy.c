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
    AudioFrameHeader *source = &D_80073434[index].header;

    *destination = *source;
}
