#include "types.h"

typedef struct {
    void *unk00;
    void *unk04;
    void *unk08;
    void *unk0C;
    s32 unk10;
    s32 unk14;
    s32 unk18;
    s32 unk1C;
} RequestAC174;

typedef struct {
    u8 pad0[0x14];
    s32 flags;
} TargetAC174;

typedef struct {
    u8 pad0[0xC];
    s32 unkC;
} InnerAC174;

typedef struct {
    u8 pad0[0xC];
    InnerAC174 *unkC;
    u8 pad10[0x19];
    u8 unk29;
} ScreenAC174;

typedef struct {
    u8 pad0[0xC];
    ScreenAC174 *unkC;
} RootAC174;

typedef struct {
    u8 pad0[0xC];
    void *unkC;
} HolderAC174;

typedef struct {
    RootAC174 *unk0;
    u8 pad4[0x4];
    void *unk8;
    u8 padC[0x4];
    TargetAC174 *unk10;
    u8 pad14[0x10];
    HolderAC174 *unk24;
    u8 pad28[0x10];
    TargetAC174 *unk38;
    u8 pad3C[0x1C];
    u32 unk58;
    s32 unk5C;
    s32 unk60;
    u32 unk64;
    u8 pad68[0x4];
    s32 unk6C;
    s32 unk70;
} OwnerAC174;

extern void func_800311D0(void);
extern s32 func_800318E0(s16);
extern void func_800AC9A8(TargetAC174 *, s32, OwnerAC174 *);
extern void func_800ACA00(OwnerAC174 *, s32);
extern void func_800ACC64(void *);
extern void func_800ACE00(void *);
extern void func_800ACEC0(s16);
extern void func_800AD014(OwnerAC174 *, u32);
extern void func_800AD060(OwnerAC174 *, u32);
extern void func_800AD3E8(OwnerAC174 *, u32);
extern void func_800AD484(OwnerAC174 *, u32);
extern void func_800AD5B0(OwnerAC174 *, s32);
extern void func_800D5E0C(ScreenAC174 *, s32, s32, TargetAC174 *);
extern void func_800D63B4(OwnerAC174 *);
extern void func_800D6424(void *, s32, s32, s32);
extern s16 func_800D6454(RequestAC174 *);
extern void func_800D67B8(RequestAC174 *);
extern void func_800DB44C(void *, s32 *, u32 *, s32 *);
extern void func_800DD4B8(void);
extern void func_800DF72C(void);
extern u32 func_800E0138(void *);
extern void *func_800E09F8(void);
extern s16 func_800E154C(s16);
extern s16 func_800E1588(s16);

extern s16 D_80084F6C;
extern s16 D_80086DA8;
extern u8 D_800BF67C[];
extern u8 D_800BF698[];
extern u8 D_800BF6B4[];
extern u8 D_800BF6B8[];
extern u8 D_800BF6DC[];
extern u8 D_800BF700[];
extern u8 D_800BF724[];
extern u8 D_800C08D8[];
extern u8 D_800C25D8[];
extern u8 D_800C25F4[];
extern u8 D_800C2610[];
extern u8 D_800C2628[];
extern u8 D_800C263C[];
extern u8 D_800C2650[];
extern u8 D_800C29D4[];
extern u8 D_800C5C38;

void func_800AC174(void *arg, s32 unused, s32 mode) {
    OwnerAC174 *owner = arg;
    void *panel;
    RequestAC174 request;
    RequestAC174 notice;
    s32 first;
    u32 row;
    s32 page;
    s32 i;
    u32 count;
    u32 selection;
    s16 result;
    s16 value;

    panel = owner->unk24->unkC;
    if (owner->unk5C == 0) {
        func_800311D0();
        count = 0;
        for (i = 0; i < D_80086DA8; i++) {
            count += func_800318E0(i) != 0;
        }
        if (count != 0) {
            func_800D67B8(&request);
            request.unk00 = D_800BF67C;
            request.unk04 = D_800BF698;
            request.unk08 = D_800BF6B4;
            request.unk0C = D_800C29D4;
            request.unk18 = 0;
            func_800D6454(&request);
            owner->unk58 = count;
            owner->unk5C = 1;
        } else {
            owner->unk5C = 3;
        }
    }

    switch ((s16)mode) {
    case 13:
        func_800D5E0C(owner->unk0->unkC, owner->unk0->unkC->unkC->unkC, owner->unk0->unkC->unk29, owner->unk10);
        owner->unk10->flags |= 1;
        func_800AC9A8(owner->unk38, 0, owner);
        owner->unk38->flags &= ~1;
        break;
    case 25:
        value = owner->unk6C;
        if (--owner->unk70 == -1) {
            value = func_800E1588(D_80084F6C);
            owner->unk70 = 15;
        }
        if (value != (s16)owner->unk6C) {
            func_800ACEC0(D_80084F6C);
            owner->unk6C = func_800E1588(D_80084F6C);
            if (owner->unk6C == 0) {
                owner->unk60 = 1;
            } else {
                owner->unk60 = 0;
            }
            func_800ACC64(arg);
            func_800ACE00(arg);
        }
        break;
    case 18:
        owner->unk38->flags ^= 1;
        if (func_800E09F8() != owner->unk24) {
            func_800ACA00(owner, 0);
        } else {
            func_800ACA00(owner, 6);
        }
        break;
    case 8:
        func_800DB44C(panel, &first, &row, &page);
        selection = func_800E0138(D_800BF724);
        result = func_800E154C(D_80084F6C);
        if (result != 0 && selection != 4) {
            func_800DF72C();
            if (result == 5) {
                func_800D67B8(&notice);
                notice.unk00 = D_800C25D8;
                notice.unk04 = D_800C25F4;
                notice.unk08 = D_800C2610;
                notice.unk0C = D_800C08D8;
                notice.unk18 = 0;
                func_800D6454(&notice);
                func_800D67B8(&notice);
                notice.unk00 = D_800C2628;
                notice.unk04 = D_800C263C;
                notice.unk08 = D_800C2650;
                notice.unk0C = D_800C08D8;
                notice.unk18 = 0;
                func_800D6454(&notice);
            } else {
                func_800ACEC0(D_80084F6C);
                owner->unk6C = func_800E1588(D_80084F6C);
            }
        } else if (selection == 4) {
            func_800DF72C();
            func_800AD5B0(owner, 6);
        } else if (selection == 0) {
            func_800DF72C();
            func_800AD014(owner, row);
            if (D_800C5C38 == 1) {
                func_800DD4B8();
            }
        } else if (func_800E09F8() == owner->unk24) {
            func_800DF72C();
            switch (selection) {
            case 1:
                if (row < owner->unk64) {
                    func_800AD060(owner, row);
                    if (D_800C5C38 == 1) {
                        func_800DD4B8();
                    }
                }
                break;
            case 2:
                if (row < owner->unk64) {
                    func_800AD3E8(owner, row);
                    if (D_800C5C38 == 1) {
                        func_800DD4B8();
                    }
                }
                break;
            case 3:
                if (row < owner->unk64) {
                    func_800AD484(owner, row);
                }
                break;
            }
        }
        break;
    case 12:
        if (owner->unk5C == 1) {
            func_800311D0();
            count = 0;
            for (i = 0; i < D_80086DA8; i++) {
                count += func_800318E0(i) != 0;
            }
            if (count < owner->unk58) {
                func_800D67B8(&request);
                request.unk00 = D_800BF6B8;
                request.unk04 = D_800BF6DC;
                request.unk08 = D_800BF700;
                request.unk0C = D_800C29D4;
                request.unk18 = 0;
                func_800D6454(&request);
            }
        }
        owner->unk5C = 3;
        func_800D63B4(owner);
        func_800D6424(owner->unk8, 0x14A, 0, 0xA);
        func_800D6424(owner->unk10, 0x14A, 0, 0xA);
        break;
    }
}
