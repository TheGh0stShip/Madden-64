#include "types.h"

typedef struct {
    u8 *unk_00;
    u8 unk_04[0x2148];
} AudioVoiceEntry;

extern AudioVoiceEntry D_80082DBC[];
extern s8 D_80072C1C[];

void audio_voice_process(u16 voice, u16 count, u8 *out) {
    u8 *data = D_80082DBC[voice].unk_00;
    u8 *src;
    u16 i;
    s8 j;
    u8 c;

    if (data[0] & 0x80) {
        src = data + 6;
        for (i = 0; i < count; i++) {
            out[0] = 0;
            while (!(out[0] & 0x80)) {
                c = *src++;
                out[0] = c & 0x7F;
                for (j = 0; j < D_80072C1C[out[0]]; j++) {
                    *(out + j + 1) = *src++;
                }
                out[0] = c;
            }
        }
        c = *src++;
        out[0] = c & 0x7F;
        for (j = 0; j < D_80072C1C[out[0]]; j++) {
            *(out + j + 1) = *src++;
        }
    } else {
        data += 6;
        for (i = 0; i < count; i++) {
            out[0] = 0;
            while (!(out[0] & 0x80)) {
                out[0] = data[0] & 0x7F;
                out[1] = data[1];
                out[2] = data[2];
                out[3] = data[3];
                out[0] = data[0];
                data += 4;
            }
        }
        out[0] = data[0] & 0x7F;
        out[1] = data[1];
        out[2] = data[2];
        out[3] = data[3];
    }
}
