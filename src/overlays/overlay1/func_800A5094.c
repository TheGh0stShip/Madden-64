#include "types.h"

typedef struct {
    u8 type;
    u8 unk1;
    s16 x;
    s16 y;
    s16 pad6;
    s32 unk8;
    void *unkC;
} StatusMessage;

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
} Ball;

typedef struct {
    s16 unk0;
    u8 pad2[6];
    u16 unk8;
} Marker;

typedef struct {
    u8 pad00[0x14];
    s32 flags;
    u8 pad18[0x48 - 0x18];
    Marker *unk48;
} Actor;

typedef struct {
    u8 pad00[0x24];
    Actor *unk24;
    u8 pad28[0x2D - 0x28];
    u8 unk2D;
    u8 pad2E[0x34 - 0x2E];
    u16 unk34;
} Carrier;

extern Ball *D_80086178;
extern s32 D_80084F34;
extern u32 D_80080C10;
extern StatusMessage D_80087AB0;
extern Carrier *D_8008A058;
extern s16 D_800876F6;
extern s16 D_80084F6E;
extern s32 D_80084F50;
extern s32 D_800857F4;
extern u16 D_8008A5B2;
extern s16 D_80087AF0;
extern s32 D_80080C2C;

void func_800C5F80(void);
void func_800BC98C(void);
void func_800A365C(s32);
void func_8009CCD4(void);
s16 func_800C157C(Carrier *);
void func_8001FA68(s32, s32, s32, s32);
void func_8009CA5C(s32, s32);
void status_overlay_disable(s32);

void func_800A5094(void) {
    s32 distance;

    if (D_80084F34 < D_80086178->y && !(D_80080C10 & 0x10000008)) {
        D_80087AB0.type = 0x1A;
        D_80087AB0.x = D_80086178->x >> 16;
        D_80087AB0.y = D_80086178->y >> 16;
        D_80080C10 |= 8;
        D_80087AB0.unkC = D_8008A058;
        func_800C5F80();
        if (D_80080C10 & 0x10) {
            func_800BC98C();
        }
        if (D_8008A058 != 0) {
            func_800A365C(4);
        }
        D_80080C10 &= ~0x140;
    }
    distance = D_80086178->x;
    if (distance < 0) {
        distance = -distance;
    }
    if (D_8008A058 != 0) {
        if ((u8)(D_8008A058->unk2D - 0x1D) >= 2 || !(D_8008A058->unk24->flags & 0x20000)) {
            distance += (D_8008A058->unk24->unk48->unk8 - 3 + D_8008A058->unk24->unk48->unk0) << 16;
        } else {
            distance += (D_8008A058->unk24->unk48->unk0 - D_8008A058->unk24->unk48->unk8) << 16;
        }
    }
    if (distance > 0x18FFFFF) {
        D_80087AB0.type = 0x18;
        D_80087AB0.x = D_80086178->x >> 16;
        D_80087AB0.y = D_80086178->y >> 16;
        if (D_8008A058 != 0) {
            if (D_800876F6 != 0) {
                if (D_80084F6E != 6) {
                    func_8009CCD4();
                }
                D_800876F6 = 0;
            }
            if (D_80086178->y < D_80084F50 && D_80084F50 != (s32)0x80000000) {
                D_80087AB0.y = D_80084F50 >> 16;
                D_80087AB0.unk1 = 0x25;
                D_80087AB0.unk8 = D_800857F4;
            } else {
                D_80087AB0.unk1 = D_8008A058->unk34;
                D_80087AB0.unk8 = func_800C157C(D_8008A058);
            }
        } else if ((u16)(D_8008A5B2 - 4) < 2) {
            if (D_8008A5B2 == 4) {
                D_80087AB0.type = 0xC;
                D_80087AB0.x = D_80086178->x >> 16;
                D_80087AB0.y = D_80086178->y >> 16;
                D_80087AB0.unkC = 0;
                func_800C5F80();
                if (D_80087AB0.y >= -800) {
                    func_8001FA68(0x12, D_80080C2C, D_80086178->y, D_80086178->y);
                }
            }
            D_80087AF0 = 60;
        }
        D_80087AB0.unkC = D_8008A058;
        func_800C5F80();
        func_8009CA5C(0x2D, 0xD2);
        status_overlay_disable(3);
    }
    if (D_80086178->y <= (s32)0xFCE00000) {
        D_80080C10 |= 0x8000;
        if (D_80086178->y <= (s32)0xFC480000) {
            if (D_8008A058 != 0) {
                if (D_800876F6 != 0) {
                    if (D_80084F6E != 6) {
                        func_8009CCD4();
                    }
                    D_800876F6 = 0;
                }
                D_80087AB0.unk1 = D_8008A058->unk34;
                D_80087AB0.unk8 = func_800C157C(D_8008A058);
            } else if ((u16)(D_8008A5B2 - 4) < 2) {
                if (D_8008A5B2 == 4) {
                    D_80087AB0.type = 0xC;
                    D_80087AB0.x = D_80086178->x >> 16;
                    D_80087AB0.y = D_80086178->y >> 16;
                    D_80087AB0.unkC = 0;
                    func_800C5F80();
                }
                D_80087AF0 = 60;
            }
            D_80087AB0.type = 0x18;
            D_80087AB0.x = D_80086178->x >> 16;
            D_80087AB0.y = D_80086178->y >> 16;
            D_80087AB0.unkC = D_8008A058;
            func_800C5F80();
            func_8009CA5C(0x2D, 0xD2);
            status_overlay_disable(3);
        }
    }
    if (D_80086178->y > 0x31FFFFF) {
        if (D_80086178->y > 0x3BFFFFF) {
            if (D_8008A058 != 0) {
                if (D_800876F6 != 0) {
                    if (D_80084F6E != 6) {
                        func_8009CCD4();
                    }
                    D_800876F6 = 0;
                }
                D_80087AB0.unk1 = D_8008A058->unk34;
                D_80087AB0.unk8 = func_800C157C(D_8008A058);
            }
            D_80087AB0.type = 0x18;
            D_80087AB0.x = D_80086178->x >> 16;
            D_80087AB0.y = D_80086178->y >> 16;
            D_80087AB0.unkC = D_8008A058;
            func_800C5F80();
            func_8009CA5C(0x2D, 0xD2);
            status_overlay_disable(3);
        } else if (D_8008A058 != 0) {
            if (D_800876F6 == 0) {
                D_80087AB0.type = 0x19;
                D_80087AB0.x = D_80086178->x >> 16;
                D_80087AB0.y = D_80086178->y >> 16;
                D_80087AB0.unkC = D_8008A058;
                func_800C5F80();
                func_8009CA5C(0x2D, 0xD2);
                status_overlay_disable(3);
            } else {
                D_80080C10 |= 0x2000000;
            }
        }
    }
}
