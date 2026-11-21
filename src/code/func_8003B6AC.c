#include "types.h"

typedef struct AudioValueRecord {
    u8 bytes[40];
} AudioValueRecord;

u16 func_8003B6AC(AudioValueRecord *records) {
    u16 i = 0;
    u16 count = 0;
    u32 sum = 0;

    for (; i < 55; i++) {
        switch (records[i].bytes[14] & 0x3F) {
        case 21:
            count++;
            sum += (records[i].bytes[24] + records[i].bytes[25]) * 3;
            break;
        case 22:
            count++;
            sum += (records[i].bytes[24] + records[i].bytes[25]) * 3;
            break;
        case 63:
            break;
        default:
            if (records[i].bytes[14] & 0xC0) {
                count++;
                sum += records[i].bytes[20] + records[i].bytes[18] * 2 + records[i].bytes[21] * 2 + records[i].bytes[26];
            }
            break;
        }
    }
    sum = sum * 100 / 253;
    sum = sum / (count * 6) * 2 - 50;
    if (sum > 100) {
        sum = 100;
    }
    return sum;
}
