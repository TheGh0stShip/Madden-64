#include "types.h"

typedef struct {
    u8 unk00[0x21];
    u8 slot;
    u8 unk22[6];
    u16 flags;
} Actor;

extern s32 D_80080C10;
extern s16 D_800857B4;
extern Actor *D_8008A058;
extern s16 D_8008AF82;
extern s8 D_8008B2A8[];
extern s32 *D_80072720[];

s16 func_800BABB8(Actor *);
s32 func_800BAE7C(Actor *);
void func_800BB7E4(Actor *);
s16 func_800BBB18(Actor *);
s32 func_800BD694(Actor *);
void func_800C93D8(Actor *);
void func_800C9418(Actor *);
void func_800C945C(Actor *);
void func_800C9484(Actor *);
s32 func_800C94C8(Actor *);
void func_800C9724(Actor *, s32);

s32 func_800BF330(Actor *actor) {
    s32 *map;
    u16 flags;
    s32 buttons;

    if (D_80080C10 & 0x01000000) {
        actor->flags &= ~1;
        return 0;
    }
    map = D_80072720[D_8008B2A8[actor->slot & 0xBF]];
    if ((D_80080C10 & 0xC0) == 0x40 && func_800BABB8(actor) != 0 && D_8008A058 == actor) {
        return func_800BAE7C(actor) & 0xFFFF;
    }
    buttons = func_800BD694(actor);
    flags = actor->flags;
    if (flags & 0x10) {
        return 0;
    }
    if ((D_80080C10 & 0x88) == 0x80 && D_800857B4 >= 0) {
        actor->flags = flags & ~1;
        return 0;
    }
    if ((buttons != 0) | (~func_800BBB18(actor) != 0)) {
        D_8008AF82 = 0x3C;
        if (buttons & map[0]) {
            func_800C9418(actor);
        } else if (buttons & map[1]) {
            func_800C93D8(actor);
        } else if (buttons & map[3]) {
            if (actor != D_8008A058 || func_800C94C8(actor) == 0) {
                func_800C945C(actor);
            }
        } else if (actor == D_8008A058) {
            if (buttons & map[2]) {
                func_800C9484(actor);
            } else if (buttons & 0x2020) {
                func_800C9724(actor, 1);
            } else if (buttons & 0x10) {
                func_800C9724(actor, 2);
            } else if (buttons & map[4]) {
                func_800BB7E4(actor);
            }
        }
    }
    return 0;
}
