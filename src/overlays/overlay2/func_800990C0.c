#include "types.h"

typedef struct { void *sprite; s16 x04; s8 x06; s8 x07; } Anim;
typedef struct {
    u8 pad00[0x3C]; void *x3C; void *x40; u8 pad44[0x1C];
    s32 x60; u8 pad64[0xC]; s32 x70; u8 pad74[0x44]; s32 xB8[8]; void *xD8;
} Obj;

extern s8 D_8007A288;
extern u8 *D_8007A28C;
extern void *D_8007A290;
extern void *D_8007A294;
extern s32 D_80087938;
extern u8 D_800BFEC8[];
extern s8 D_800BFF25;
extern s8 D_800BFF2D;
extern s32 D_800C010C[];
extern s8 D_800C4AD2;
typedef struct { u8 names[8][13]; s8 taken[8]; u8 picks[8]; } Picks;
extern Picks D_800C4AD4;
extern s16 D_800C507C;
extern s8 D_800C5CE8;

void *func_800DD634(void);
s32 func_80030DF0(void);
void func_800A3FD4(s32, s32);
void func_800997A4(Obj *, s32);
void func_800DF72C(void);
void func_800DF6EC(void);
void func_800DD514(void *);
void *func_80032E00(s32, s32);
void func_80033308(s32, void *, s32, s32);
void func_800DD7E8(Anim *);
void func_8001EC20(void *, s32);
s32 func_80099720(s32);
s32 func_80099764(s32);
void func_80098C10(s32);

void func_800990C0(void *arg0, s32 arg1, s16 event) {
    Obj *obj = arg0;
    Anim anim;
    void *sprite;
    void *other;
    s32 pad;
    u32 i;

    func_800DD634();
    sprite = obj->x3C;
    other = obj->x40;
    pad = func_80030DF0();
    func_800A3FD4(0, D_80087938);
    if (event == 0xD) {
        func_800997A4(obj, 0);
        obj->x70 = 0;
    }
    if (obj->x70 == 1 || event == 0xC) {
        return;
    }
    if (D_800C4AD4.taken[obj->x60] == 0) {
        func_800DF72C();
        if (obj->x60 == 7) {
            func_800DD514(D_800BFEC8);
            D_800BFF25 = 0;
            D_800BFF2D = 0;
            D_800C5CE8 = 0;
            D_800C507C = 0;
            D_8007A28C = func_80032E00(0, 0x17E5);
            D_8007A290 = func_80032E00(0, D_800C4AD2 * 0x58);
            D_8007A294 = func_80032E00(0, 0x84);
            D_8007A288 = 0;
            func_80033308(0, D_8007A294, 0x84, 0);
            for (i = 0; i < 0x17E5; i++) {
                D_8007A28C[i] = 0;
            }
            anim.x04 = 0xF0;
            anim.x06 = 2;
            anim.x07 = 0xA;
            anim.sprite = sprite;
            func_800DD7E8(&anim);
            anim.sprite = other;
            func_800DD7E8(&anim);
        } else {
            obj->x60++;
            obj->xD8 = D_800C4AD4.names[obj->x60];
            func_8001EC20(sprite, 0x19);
            D_800C4AD4.picks[obj->x60] = func_80099720(0) + 0x7D;
            obj->xB8[obj->x60] = D_800C010C[D_800C4AD4.picks[obj->x60]];
            func_8001EC20(sprite, obj->x60 + 0x11);
            func_80098C10(D_800C4AD4.picks[obj->x60]);
            func_800997A4(obj, obj->x60);
        }
    } else if (pad & 0x9000) {
        func_800DF72C();
        if (obj->x60 == 7) {
            func_800DD514(D_800BFEC8);
            D_800C5CE8 = 0;
            D_800C507C = 0;
            D_800BFF25 = 0;
            D_800BFF2D = 0;
            D_8007A28C = func_80032E00(0, 0x17E5);
            D_8007A290 = func_80032E00(0, D_800C4AD2 * 0x58);
            D_8007A294 = func_80032E00(0, 0x84);
            D_8007A288 = 0;
            func_80033308(0, D_8007A294, 0x84, 0);
            for (i = 0; i < 0x17E5; i++) {
                D_8007A28C[i] = 0;
            }
            anim.x04 = 0xF0;
            anim.x06 = 2;
            anim.x07 = 0xA;
            anim.sprite = sprite;
            func_800DD7E8(&anim);
            anim.sprite = other;
            func_800DD7E8(&anim);
        } else {
            obj->x60++;
            obj->xD8 = D_800C4AD4.names[obj->x60];
            func_8001EC20(sprite, 0x19);
            D_800C4AD4.picks[obj->x60] = func_80099720(0) + 0x7D;
            obj->xB8[obj->x60] = D_800C010C[D_800C4AD4.picks[obj->x60]];
            func_8001EC20(sprite, obj->x60 + 0x11);
            func_80098C10(D_800C4AD4.picks[obj->x60]);
            func_800997A4(obj, obj->x60);
        }
    }
    if (pad & 0x200) {
        func_800DF6EC();
        D_800C4AD4.picks[obj->x60] = func_80099764(D_800C4AD4.picks[obj->x60] - 0x7D) + 0x7D;
        obj->xB8[obj->x60] = D_800C010C[D_800C4AD4.picks[obj->x60]];
        func_8001EC20(sprite, obj->x60 + 0x11);
        func_80098C10(D_800C4AD4.picks[obj->x60]);
    }
    if (pad & 0x100) {
        func_800DF6EC();
        D_800C4AD4.picks[obj->x60] = func_80099720(D_800C4AD4.picks[obj->x60] - 0x7D) + 0x7D;
        obj->xB8[obj->x60] = D_800C010C[D_800C4AD4.picks[obj->x60]];
        func_8001EC20(sprite, obj->x60 + 0x11);
        func_80098C10(D_800C4AD4.picks[obj->x60]);
    }
    if (event == 0x11) {
        anim.x04 = 0xF0;
        anim.x06 = 2;
        anim.x07 = 0xA;
        anim.sprite = sprite;
        func_800DD7E8(&anim);
        anim.sprite = other;
        func_800DD7E8(&anim);
    }
}
