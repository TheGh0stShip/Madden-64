#include "types.h"

typedef struct ItemCB434 {
    u8 pad00[0x1C];
    s32 unk_1C;
    s32 unk_20;
} ItemCB434;

typedef struct WorkCB434 {
    u16 unk_00[3];
    u16 unk_06[3];
    u16 unk_0C[3];
    u16 unk_12[6];
    u16 unk_1E[3];
    u16 *unk_24;
    u8 pad28[0xC];
    s32 unk_34;
    u8 pad38[4];
    ItemCB434 *unk_3C;
    ItemCB434 *unk_40;
    ItemCB434 *unk_44;
    s32 unk_48;
    u8 unk_4C;
    s16 unk_4E;
    u16 unk_50;
} WorkCB434;

typedef struct SubCB434 {
    s32 unk_00;
    void *unk_04;
} SubCB434;

typedef struct ObjCB434 {
    u8 pad00[0x60];
    s32 unk_60;
    WorkCB434 *unk_64;
    s32 unk_68;
    u8 pad6C[8];
    SubCB434 unk_74;
} ObjCB434;

typedef struct RuntimeCB434 {
    u8 pad00[8];
    s32 unk_08[18];
    s32 unk_50[3];
} RuntimeCB434;

extern u16 D_8006B548[];
extern u16 D_8006B558[];
extern u16 *D_8006B634[];
extern u16 *D_8006B6C4[];
extern s32 D_80072048;
extern s32 D_80072060;
extern s32 D_80085BF0[];
extern u8 **D_8008AF8C;
extern s8 D_8008B210;
extern s32 D_800E5E18;

s32 func_80016FE4(void *);
s32 func_80016FF4(void *);
void func_8001EC20(s32, s32);
u32 func_80030B54(s16);
s32 func_800393E0(u8 value);
void func_8003E460(void);
void func_800A82E8(void);
void func_800A9F48(void);
void func_800A9F70(void);
void func_800CBE8C(u16, u16, s32, s32, s32);
void func_800CBF78(u16, u16, u16, u16, s32, s32);
void func_800CC2D4(u16 *, u16 *, u32);
void func_800D6424(s32, s32, s32, s32);
void func_800D67EC(void *, s32);
void func_800DD4B8(void);
RuntimeCB434 *func_800DD634(void);

void func_800CB434(ObjCB434 *arg0, s32 arg1, s16 arg2) {
    ObjCB434 *obj;
    WorkCB434 *work;
    RuntimeCB434 *rt;
    SubCB434 *sub;
    s16 done;
    u16 column;
    u16 mode;
    u16 redraw;
    u16 first;
    u16 second;
    s16 row;
    u16 extra;
    u32 buttons;
    s32 i;
    u16 pick;

    done = 0;
    obj = arg0;
    work = obj->unk_64;
    rt = func_800DD634();
    sub = &obj->unk_74;
    switch (arg2) {
        case 0xD:
            func_80016FE4(work->unk_44);
            break;
        case 0x19:
            if (obj->unk_68 == 0) {
                obj->unk_68 = 1;
            } else if (obj->unk_68 == 1) {
                func_80016FF4(work->unk_3C);
                func_80016FF4(work->unk_40);
                func_80016FF4(work->unk_44);
                func_800DD4B8();
            }
            return;
        default:
            return;
    }

    mode = 0;
    column = 0;
    redraw = 0;
    second = 0;
    first = 0;
    row = 0;
    extra = 0;
    while (done == 0) {
        work->unk_3C->unk_20 = 0xA3;
        work->unk_40->unk_20 = 0xA3;
        work->unk_44->unk_1C = column * 0x61 + 0xF;
        func_800A82E8();
        if (redraw == 1) {
            switch (work->unk_50) {
                case 0:
                    if (work->unk_4E == 0) {
                        work->unk_24 = D_8006B558;
                    } else {
                        work->unk_24 = D_8006B548;
                    }
                case 1:
                    func_800CC2D4(&work->unk_24[row * 3 + 1], work->unk_00, work->unk_4C);
                    break;
                case 2:
                    func_800CC2D4(&work->unk_24[row * 3 + 1], work->unk_12, 0);
                    if (work->unk_4E == 0) {
                        for (i = 0; (u16)i < 3; i++) {
                            work->unk_00[(u16)i] = *D_8008AF8C[work->unk_12[(u16)i]];
                        }
                    } else {
                        for (i = 0; (u16)i < 3; i++) {
                            work->unk_00[(u16)i] = second;
                        }
                    }
                    break;
            }
            for (i = 0; (u16)i < 3; i++) {
                func_800CBF78(work->unk_12[(u16)i], work->unk_00[(u16)i], work->unk_4E, work->unk_50,
                              rt->unk_08[(u16)i], D_80085BF0[0] + (u16)i * 0x900);
            }
            func_800CBE8C(work->unk_4E, work->unk_50, work->unk_34, rt->unk_08[0], work->unk_48);
            redraw = 0;
        }
        if (extra == 1) {
            for (i = 0; (u16)i < 3; i++) {
                func_800CBF78(work->unk_12[(u16)i + 6], work->unk_0C[(u16)i], work->unk_4E, 2,
                              rt->unk_50[(u16)i], D_80085BF0[1] + (u16)i * 0x900);
            }
            extra = 0;
        }
        func_8003E460();
        buttons = func_80030B54(D_8008B210);
        if ((buttons & 8) && work->unk_4E != 0) {
            work->unk_4C ^= 0x2000;
            redraw = 1;
            if (work->unk_50 == 2) {
                if ((s16)func_800393E0(second) != 0) {
                    second ^= 0x2000;
                    func_800A9F70();
                }
            }
        }
        if (buttons & 0x200) {
            if (mode == 0) {
                if (column != 0) {
                    column--;
                    func_800A9F48();
                }
            }
        }
        if (buttons & 0x100) {
            if (mode == 0) {
                if (column < 2) {
                    column++;
                    func_800A9F48();
                }
            }
        }
        if (buttons & 0x400) {
            if (mode == 1) {
                func_800A9F48();
                redraw = 1;
                if (row < (s16)work->unk_24[0] - 1) {
                    row++;
                } else {
                    row = 0;
                }
            }
        }
        if (buttons & 0x800) {
            if (mode == 1) {
                func_800A9F48();
                redraw = 1;
                if (row != 0) {
                    row--;
                } else {
                    row = work->unk_24[0] - 1;
                }
            }
        }
        if (buttons & 0xC004) {
            if (mode == 0) {
                if (buttons & 0x8000) {
                    mode = 1;
                    func_800A9F70();
                    func_80016FE4(work->unk_3C);
                    func_80016FE4(work->unk_40);
                    sub->unk_04 = &D_80072060;
                    func_8001EC20(obj->unk_60, 1);
                }
            } else {
                func_800A9F70();
                pick = 0;
                if (buttons & 0x8000) {
                    pick = 1;
                } else if (buttons & 4) {
                    pick = 2;
                }
                switch (work->unk_50) {
                    case 0:
                        redraw = 1;
                        if (work->unk_4E == 0) {
                            s32 r = row;
                            u16 *tbl = work->unk_24;

                            work->unk_50 = 2;
                            first = tbl[pick + r * 3 + 1];
                            work->unk_24 = D_8006B634[first];
                            second = first;
                        } else {
                            s32 r = row;
                            u16 *tbl = work->unk_24;

                            work->unk_50 = 1;
                            first = tbl[pick + r * 3 + 1];
                            work->unk_24 = D_8006B6C4[first];
                            if ((s16)func_800393E0(first) != 0) {
                                first |= work->unk_4C;
                            }
                        }
                        row = 0;
                        break;
                    case 1: {
                        s32 r = row;
                            u16 *tbl = work->unk_24;

                        second = tbl[pick + r * 3 + 1];
                        row = 0;
                        redraw = 1;
                        work->unk_24 = D_8006B634[second];
                        work->unk_50 = 2;
                        if ((s16)func_800393E0(first) != 0) {
                            second |= work->unk_4C;
                        }
                        break;
                    }
                    case 2: {
                        s32 c;
                        s32 r;
                        u16 *tbl;

                        if (work->unk_4E == 0) {
                            work->unk_0C[column] = work->unk_06[pick];
                        } else {
                            work->unk_0C[column] = second;
                        }
                        c = column;
                        r = row;
                        tbl = work->unk_24;
                        work->unk_12[c + 6] = tbl[pick + r * 3 + 1];
                        if ((s16)func_800393E0(first) != 0) {
                            work->unk_12[column + 6] |= work->unk_4C;
                        }
                        row = 0;
                        mode = 0;
                        work->unk_50 = 0;
                        func_80016FF4(work->unk_3C);
                        redraw = 1;
                        extra = 1;
                        func_80016FF4(work->unk_40);
                        break;
                    }
                }
            }
        }
        if (buttons & 2) {
            func_800D67EC(&D_800E5E18, 1);
        }
        if (buttons & 0x1000) {
            func_800A9F70();
            if (mode == 0) {
                done = 1;
            } else if (work->unk_50 == 0) {
                mode = 0;
                func_80016FF4(work->unk_3C);
                func_80016FF4(work->unk_40);
                sub->unk_04 = &D_80072048;
                func_8001EC20(obj->unk_60, 1);
            } else {
                if (work->unk_4E == 0 || work->unk_50 == 1) {
                    work->unk_50 = 0;
                } else {
                    work->unk_50 = 1;
                    work->unk_24 = D_8006B6C4[first & 0xDFFF];
                }
                row = 0;
                redraw = 1;
            }
        }
    }
    func_800D6424(obj->unk_60, 0x194, 2, 0xA);
}
