#include "types.h"

typedef struct AudioValueRecord {
    u8 bytes[40];
} AudioValueRecord;

u16 func_8003B6AC(AudioValueRecord *input)
{
    register AudioValueRecord *records __asm__("$9") = input;
    register u16 i __asm__("$8") = 0;
    register u32 count __asm__("$7") = 0;
    register u32 sum __asm__("$6") = 0;
    register u32 type22 __asm__("$12") = 22;
    register u32 type21 __asm__("$11") = 21;
    register u32 type63 __asm__("$10") = 63;

    for (; i < 55; i++) {
        register AudioValueRecord *record __asm__("$3") =
            (AudioValueRecord *)((u32)(i * 40U) + (u32)records);
        register u32 raw_type __asm__("$2") = record->bytes[14];
        register s32 type __asm__("$4") = raw_type & 0x3F;

        if (type == type22) goto special;
        if (type < 23) {
            if (type == type21) goto special;
            goto normal;
        }
        if (type == type63) goto next;
        goto normal;

special:
        count++;
        sum += (record->bytes[24] + record->bytes[25]) * 3;
        goto next;

normal:
        {
            register u32 record_offset __asm__("$3") = (u16)i;
            register AudioValueRecord *other __asm__("$5");
            record_offset = (record_offset * 5U) * 8U;
            other = (AudioValueRecord *)(record_offset + (u32)records);
            if ((other->bytes[14] & 0xC0) != 0) {
                register u32 doubled18 __asm__("$4") = other->bytes[18];
                __asm__("" : "=r"(doubled18) : "0"(doubled18));
                count++;
                {
                    register u32 value __asm__("$2") = other->bytes[20];
                    {
                        register u32 doubled21 __asm__("$3") =
                            other->bytes[21];
                        __asm__("" : "=r"(doubled21) : "0"(doubled21));
                        doubled18 *= 2;
                        value += doubled18;
                        doubled18 = other->bytes[26];
                        doubled21 *= 2;
                        value += doubled21;
                        value += doubled18;
                        sum += value;
                    }
                }
            }
        }
next:
        ;
    }

    sum = (sum * 100U) / 253U;
    {
        register u32 count16 __asm__("$3") = (u16)count;
        register u32 quotient __asm__("$2");
        __asm__("" : "=r"(count16) : "0"(count16));
        quotient = sum / (count16 * 6U);
        __asm__("" : "=r"(quotient) : "0"(quotient));
        sum = quotient * 2U - 50U;
    }
    if (sum >= 101U) {
        sum = 100;
    }
    return sum;
}
