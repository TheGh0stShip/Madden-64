#include "types.h"

typedef struct RecordD4994 {
    u8 pad00[0x60];
    u8 enabled;
    u8 mode;
} RecordD4994;

extern RecordD4994 *func_8003A7B8(u16 id);

s32 func_800D4994(u16 id, u32 flags) {
    RecordD4994 *record = func_8003A7B8(id);
    s32 result = (flags >> 4) & 1;

    if (flags & 0xF00) {
        if (record->enabled != 1) {
            result = 0;
        } else {
            switch (record->mode) {
            case 0:
                if (flags & 0x300) result = 1;
                break;
            case 1:
                if (flags & 0x500) result = 1;
                break;
            case 2:
                if (flags & 0x900) result = 1;
                break;
            }
        }
    }

    if (flags & 0xF000) {
        if (record->enabled != 0) {
            result = 0;
        } else {
            switch (record->mode) {
            case 0:
                if (flags & 0x3000) result = 1;
                break;
            case 1:
                if (flags & 0x5000) result = 1;
                break;
            case 2:
                if (flags & 0x9000) result = 1;
                break;
            }
        }
    }
    return result;
}
