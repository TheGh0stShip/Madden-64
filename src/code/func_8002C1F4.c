#include "types.h"

typedef struct {
    u8 id;
    u8 kind;
    u16 val;
} Rule2C1F4;

extern Rule2C1F4 D_8006BAC8[];

u16 func_8002C1F4(u16 arg0, s16 arg1) {
    s16 val;
    u8 done;
    Rule2C1F4 *p;

    val = 0;
    p = D_8006BAC8;
    done = 0;
    while (!done) {
        if (p->kind == 5) {
            break;
        }
        if (arg0 == p->id) {
            val = p->val;
            break;
        }
        p++;
    }
    switch (arg0) {
    case 10:
    case 14:
    case 34:
    case 37:
    case 40:
        if (val != 0) {
            val = (arg1 - val) * 200 / val + 100;
        }
        break;
    case 20:
        val = 100;
        break;
    case 21:
        val = 25;
        break;
    case 1:
    case 8:
    case 17:
        val = 50;
        break;
    case 22:
    case 25:
    case 28:
    case 32:
    case 50:
        val = 99;
        break;
    default:
        val = 0;
        break;
    }
    if (val < 0) {
        val = 0;
    }
    return val;
}
