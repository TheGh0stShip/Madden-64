typedef signed char s8; typedef unsigned char u8; typedef signed short s16; typedef unsigned short u16;
typedef signed int s32; typedef unsigned int u32;

typedef struct Query {
    s8 kind;
    u8 first;
    u8 second;
    u8 third;
    char *name;
} Query;

typedef struct Text2 {
    char c[2];
} Text2;

extern Text2 D_80002040;
extern char D_8006D2A0[];

u16 func_80028224(void);
s32 func_800D3B48(Query *, s16);
s32 func_800D4D18(s16, s32, Query *);
void func_800167FC(s16, char *);

/*
 * func_800D3214: format the value of statistic `query` for entry `value` as text in dest.
 * The raw value comes from func_800D3B48 or, when func_80028224 says so, func_800D4D18.
 * Kinds 0/1 print the number, 2 prints 16.16 fixed point as "whole.frac" (with a "-" when
 * the whole part is 0 and the value negative), 3 prints seconds as "m:ss", and 6 prints a
 * percentage, inverted (100 - value) when the companion query (0x12, "DEF REDZONE TD.")
 * is non-zero.  Kinds 4 and 5 write nothing.
 */
void func_800D3214(Query *query, s32 value, char *dest) {
    Query percent = { 0, 0x12, 0, 0, D_8006D2A0 };
    s32 base;
    s32 minutes;
    s32 found;
    s16 frac;
    u8 *p;
    s16 whole;

    base = value;
    if (func_80028224() == 0) {
        value = func_800D3B48(query, value);
    } else {
        value = func_800D4D18(value, 0x02000000, query);
    }
    switch (query->kind) {
    case 0:
    case 1:
        func_800167FC(value, dest);
        break;
    case 6:
        if (func_80028224() == 0) {
            found = func_800D3B48(&percent, base);
        } else {
            found = func_800D4D18(base, 0x02000000, &percent);
        }
        if (found == 0) {
            func_800167FC(value, dest);
        } else {
            func_800167FC(100 - value, dest);
        }
        break;
    case 3:
        minutes = value / 60;
        value -= minutes * 60;
        func_800167FC(minutes, dest);
        p = (u8 *)dest;
        while (*p != 0) {
            p++;
        }
        *p++ = ':';
        if ((s16)value < 10) {
            *p++ = '0';
        }
        func_800167FC(value, (char *)p);
        break;
    case 2:
        whole = value >> 16;
        if ((value & ~0x7FFF) == 0x8000) {
            *(Text2 *)dest = D_80002040;
            func_800167FC(whole, dest + 1);
        } else {
            func_800167FC(whole, dest);
        }
        p = (u8 *)dest;
        while (*p != 0) {
            p++;
        }
        *p++ = '.';
        frac = value;
        if (frac < 0) {
            frac = -frac;
        }
        func_800167FC(frac, (char *)p);
        break;
    }
}
