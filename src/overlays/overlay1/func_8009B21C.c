#include "types.h"

extern char D_80000748[];

void func_8002CA88(char *, ...);

/* Reads the next 4-bit code from the packed word stream. */
/* STMT uses NIBBLE, the next 4-bit code; then the code is shifted out and the word refilled. */
#define NIBBLE (bits >> 28)
#define NEXT_NIBBLE(stmt)             \
    count--;                          \
    stmt;                             \
    bits <<= 4;                       \
    if (count == 0) {                 \
        bits = *src++;                \
        count = 8;                    \
    }

s32 func_8009B21C(u8 *start, u8 *packed) {
    u8 *dst;
    u32 *src;
    u32 bits;
    s32 count;
    u32 high;
    u32 code;
    u32 value;
    u32 n;
    u32 align;
    u8 *p;

    high = 0;
    dst = start;
    src = (u32 *)packed;
    count = (u32)src & 3;
    src = (u32 *)((u8 *)src - count);
    bits = *src++;
    if (count & 2) {
        bits <<= 16;
    }
    if (count & 1) {
        bits <<= 8;
    }
    count = 4 - count;
    count *= 2;
    for (;;) {
        NEXT_NIBBLE(code = NIBBLE << 4);
        NEXT_NIBBLE(code |= NIBBLE);
        if (!(code & 0x80)) {
            *dst++ = code;
            continue;
        }
        if (!(code & 0x40)) {
            n = code & 0x1F;
            if (code & 0x20) {
                NEXT_NIBBLE(high = NIBBLE << 4);
            }
            while (n != 0) {
                n--;
                NEXT_NIBBLE(code = NIBBLE);
                *dst++ = high | code;
            }
            continue;
        }
        if (!(code & 0x20)) {
            n = code & 0x3F;
            if (n == 0) {
                break;
            }
            align = (u32)dst & 3;
            if (align != 0) {
                align = 4 - align;
            }
            while (n != 0 && align != 0) {
                align--;
                n--;
                *dst++ = 0;
            }
            p = dst;
            while (n >= 4) {
                n -= 4;
                dst += 4;
                *(u32 *)p = 0;
                p += 4;
            }
            while (n != 0) {
                n--;
                *dst++ = 0;
            }
            continue;
        }
        if (!(code & 0x10)) {
            n = (code & 7) + 3;
            value = high;
            if (code & 8) {
                NEXT_NIBBLE(value = NIBBLE << 4);
            }
            NEXT_NIBBLE(value |= NIBBLE);
            while (n != 0) {
                n--;
                *dst++ = value;
            }
            continue;
        }
        func_8002CA88(D_80000748, code);
    }
    return dst - start;
}
