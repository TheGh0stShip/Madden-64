#include "types.h"

typedef struct Body {
    u8 pad[0x1C];
    s32 x;
    s32 z;
} Body;

typedef struct Obj {
    u8 pad[0x24];
    Body *body;
} Obj;

typedef struct Msg {
    u8 type;
    u8 arg;
} Msg;

typedef struct Vec3i {
    s32 x, y, z;
} Vec3i;

typedef struct Vec3s {
    s16 x, y, z;
} Vec3s;

typedef struct Setup {
    s32 flags;
    s16 home[11][2];
    s16 away[11][2];
    u8 pad5C[0x6C - 0x5C];
    u8 mode;
    u8 x6D;
    u8 team;
    u8 player;
    u16 x70;
    u16 duration;
} Setup;

void func_800448C4(void);
void func_8000C8AC(s32);
void func_8000C8BC(s32);
void func_8000C930(s32 *, s32, s32, s32);
void func_8000BEE8(s32);
void func_8000BF08(void);
void func_8000C9C8(s32, Vec3i *);
void func_8000C990(s32, Vec3s *);
void func_8000C9AC(s32, Vec3s *);
void func_8000CA20(s32, Vec3i *);
void func_8000DC7C(s32);
void func_80030050(void);
void func_80030110(void);
void func_80030910(void);
s32 func_80030DF0(void);
void func_80034388(Body *, s32);
void func_8003456C(s32, u16);
void func_80034D30(s32, s32, s32);
void func_800457F8(s32 *);
void func_8004583C(void);
void func_800458F8(void);
s16 func_800B73A4(s16, s16, u16, u16);
s32 func_800B7420(s32, s32, u16, u16);
s32 func_800C157C(Obj *);
void func_800C16A0(Obj *, s16);
void func_800C61E8(Obj *);
void func_800C6330(s32);
void func_800E0BF0(Obj *, s32);
void func_800E0CFC(void);
u16 func_800E0E24(void);
void func_800E1A84(Obj *, Msg *);

extern s32 D_80072C58[];
extern s32 D_80074C18;
extern Obj *D_80085040[][22];
extern s32 D_80085298;
extern Body *D_80086178;
extern s16 D_80086CE8;
extern s16 D_80086CEA;
extern s16 D_80086CEC;
extern s16 D_80086CF0;
extern Body *D_80086CF4;
extern Body *D_80086CF8;
extern s32 D_80086CFC;
extern s16 D_8008799C;
extern s32 D_80087A64;
extern s16 D_80087A68;
extern s32 D_80088090;
extern s32 D_80088620;
extern u16 D_800894FC;
extern volatile u16 D_8008A5B4;
extern s32 D_8008B3D0;

/*
 * Scripted camera fly-in for a play setup: places both teams' players from
 * the setup's formation tables (when flag bit 0 is set), turns the featured
 * player, kicks off its message/animation, then interpolates the camera from
 * its current rotation/position to an offset target over setup->duration
 * ticks, running the per-frame update calls until the duration elapses or
 * button 0x1000 is pressed. Returns -1 if skipped by the button, else 1.
 */
s32 func_800E786C(s32 arg0, Setup *setup) {
    Msg msg;
    Vec3i spot;
    Vec3s rot;
    Vec3i pos;
    Vec3s rotEnd;
    Vec3i posEnd;
    Vec3s rotCur;
    Vec3i posCur;
    u32 i;
    Obj *p;
    s32 start;
    s32 buttons;
    s32 done;
    s32 pressed;

    func_800448C4();
    func_8000C8AC(D_80088090);
    func_8000C930(&D_8008B3D0, 0, 0, 0);
    func_8000BEE8(2);
    func_8000C9C8(D_80088090, &pos);
    func_8000C990(D_80088090, &rot);
    rotEnd.x = (rot.x + 0x155) & 0xFFF;
    rotEnd.y = rot.y;
    rotEnd.z = (rot.z - 0x333) & 0xFFF;
    posEnd.x = pos.x + 0x200000;
    posEnd.y = pos.y + 0x700000;
    posEnd.z = pos.z + 0x200000;
    switch (D_80087A68) {
    case 1:
        func_8000C930(&D_8008B3D0, 0x20, 0x20, 0x20);
        break;
    case 3:
        func_8000C930(&D_8008B3D0, 0xFF, 0xFF, 0xFF);
        break;
    case 4:
        func_8000C930(&D_8008B3D0, 8, 8, 8);
        break;
    case 2:
    default:
        func_8000C930(&D_8008B3D0, 0x68, 0x80, 0xD8);
        break;
    }
    for (i = 0; i < 11; i++) {
        p = D_80085040[0][i];
        func_80034388(p->body, 0x2E0003);
        if (setup->flags & 1) {
            p->body->x = setup->home[i][0] << 16;
            p->body->z = setup->home[i][1] << 16;
        }
    }
    for (i = 0; i < 11; i++) {
        p = D_80085040[1][i];
        func_80034388(p->body, 0x2E0003);
        if (setup->flags & 1) {
            p->body->x = setup->away[i][0] << 16;
            p->body->z = setup->away[i][1] << 16;
        }
    }
    D_80085040[setup->team ^ 1][0]->body->z += 0x1400000;
    p = D_80085040[setup->team][setup->player];
    func_800C16A0(p, (func_800C157C(p) - 0x3FF) & 0xFFF);
    D_80086CEA = 0;
    D_80086CEC = 0;
    D_80086CE8 = 0;
    D_80086CF0 = 0;
    D_80086CFC = D_80088090;
    D_80086CF4 = D_80086178;
    D_80086CF8 = D_80086178;
    func_8000BEE8(2);
    func_800C6330(0);
    if (setup->mode == 0) {
        func_800C61E8(p);
    }
    spot.x = p->body->x - 0x500000;
    spot.y = p->body->z - 0x500000;
    D_800894FC += 60;
    spot.z = 0xF00000;
    if (setup->mode == 1) {
        func_80034D30(D_80072C58[setup->x6D], 2, 0);
    } else {
        D_8008799C = setup->x6D;
    }
    msg.type = 1;
    msg.arg = setup->x70;
    func_800E1A84(p, &msg);
    if (setup->mode == 0) {
        func_800E0BF0(p, 0);
    }
    D_800894FC += 120;
    start = D_80088620;
    func_800457F8(&D_80074C18);
    done = 0;
    do {
        func_80030910();
        buttons = func_80030DF0();
        func_8000DC7C(D_80087A64);
        func_8003456C(D_80085298, D_8008A5B4);
        func_8000BF08();
        func_8004583C();
        func_80030110();
        func_80030050();
        rotCur.x = func_800B73A4(rot.x, rotEnd.x, D_80088620 - start, setup->duration);
        rotCur.y = func_800B73A4(rot.y, rotEnd.y, D_80088620 - start, setup->duration);
        rotCur.z = func_800B73A4(rot.z, rotEnd.z, D_80088620 - start, setup->duration);
        posCur.x = func_800B7420(pos.x, posEnd.x, D_80088620 - start, setup->duration);
        posCur.y = func_800B7420(pos.y, posEnd.y, D_80088620 - start, setup->duration);
        posCur.z = func_800B7420(pos.z, posEnd.z, D_80088620 - start, setup->duration);
        func_8000C9AC(D_80088090, &rotCur);
        func_8000CA20(D_80088090, &posCur);
        if (setup->duration < (u32)(D_80088620 - start)) {
            done = 1;
        }
        pressed = buttons & 0x1000;
        if (pressed) {
            done = 1;
        }
    } while (!done);
    func_800C6330(0);
    func_800458F8();
    if (func_800E0E24()) {
        func_800E0CFC();
    }
    func_8000BEE8(0);
    func_8000C8BC(D_80088090);
    return pressed ? -1 : 1;
}
