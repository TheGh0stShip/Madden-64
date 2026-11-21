#include "types.h"

extern char D_80000760[];
extern char D_8000077C[];

void func_8002CA88(char *, ...);

/* STMT uses BYTE, the next 8-bit code; then the code is shifted out and the word refilled. */
#define BYTE (bits >> 24)
#define NEXT_BYTE(stmt)               \
    stmt;                             \
    count--;                          \
    bits <<= 8;                       \
    if (count == 0) {                 \
        bits = *src++;                \
        count = 4;                    \
    }
/* Appends one byte to the output word, storing the word when it is full. */
#define PUT_BYTE(value, step)         \
    word <<= 8;                       \
    fill--;                           \
    step;                             \
    word |= (value);                  \
    if (fill == 0) {                  \
        *dst++ = word;                \
        fill = 4;                     \
        word = 0;                     \
    }

void func_8009B490(u32 *start, u8 *packed) {
    u32 *dst;
    u32 *src;
    u32 bits;
    s32 count;
    u32 word;
    s32 fill;
    u32 code;
    u32 n;

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
    fill = 4;
    word = 0;
    dst = start;
    for (;;) {
        NEXT_BYTE(code = BYTE);
        if (!(code & 0x80)) {
            PUT_BYTE(code, (void)0);
            continue;
        }
        if (!(code & 0x40)) {
            n = code & 0x3F;
            if (n == 0) {
                break;
            }
            while (n != 0 && fill != 0) {
                fill--;
                n--;
                word <<= 8;
            }
            if (fill == 0) {
                *dst++ = word;
                fill = 4;
                word = 0;
            }
            while (n >= 4) {
                n -= 4;
                *dst++ = 0;
            }
            while (n != 0) {
                n--;
                fill--;
            }
            continue;
        }
        if (!(code & 0x20)) {
            func_8002CA88(D_80000760);
            continue;
        }
        if (!(code & 0x10)) {
            n = code & 0xF;
            NEXT_BYTE(code = BYTE);
            while (n != 0) {
                PUT_BYTE(code, n--);
            }
            continue;
        }
        func_8002CA88(D_8000077C);
        n = code & 0xF;
        while (n != 0) {
            NEXT_BYTE(code = BYTE);
            PUT_BYTE(code, n--);
        }
    }
    if (fill != 4) {
        if (fill != 0) {
            while (fill != 0) {
                fill--;
                word <<= 8;
            }
            *dst = word;
        }
    }
}
