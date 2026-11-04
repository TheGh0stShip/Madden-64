#include "types.h"

s32 packed_command_measure(u8 *src, u8 *dst) {
    s32 header;
    s32 value;
    s32 in_pos;
    s32 out_pos;
    s32 run_len;
    s32 back_pos;
    s32 format;
    s32 small;
    s32 zero;

    header = src[0];
    run_len = 0;
    value = header;
    back_pos = 0;

    switch (value) {
    case 0:
        out_pos = 0;
        in_pos = 1;
        break;
    case 1:
        out_pos = 0;
        in_pos = 4;
        break;
    }

    value = src[in_pos++];
    if (value != 0) {
        format = header;
        small = format < 2;
        zero = 0;
        do {
            s16 i;

            if (value & 0x80) {
                s32 masked;

                if (!small) {
                    goto literal_ready;
                }
                masked = value & 0x7F;
                if (format < 0) {
                    goto literal_ready;
                }
                run_len = (u8)masked;
literal_ready:
                value = run_len;
                i = 0;
                if (zero < value) {
                    s32 count;

                    count = value;
                    do {
                        dst[out_pos++] = src[in_pos++];
                        i++;
                    } while (i < count);
                }
            } else {
                if (!small) {
                    goto backref_ready;
                }
                if (format < 0) {
                    goto backref_ready;
                }
                run_len = (u8)value;
                back_pos = src[in_pos] + (src[in_pos + 1] << 8);
                back_pos = out_pos - back_pos;
                in_pos += 2;
backref_ready:
                value = run_len;
                i = 0;
                if (zero < value) {
                    s32 count;

                    count = value;
                    do {
                        dst[out_pos++] = dst[back_pos + i];
                        i++;
                    } while (i < count);
                }
            }
            value = src[in_pos++];
        } while (value != 0);
    }
    return out_pos;
}
