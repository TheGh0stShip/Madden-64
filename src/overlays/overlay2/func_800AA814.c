#include "types.h"

typedef struct {
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
    u8 unk_03;
    u8 unk_04;
    s8 unk_05;
} Struct_800AA814;

void func_800167FC(s32, char *);
char *func_8002E65C(char *, char *);
s8 *func_8008DBEC(u8);
Struct_800AA814 *func_8008DC10(s16, s16);
char *func_8008DC54(s16, s16);
char *func_8008DDB8(s16, s16);
char *func_8008DF68(u8);
s16 func_800AAD00(u8, s16);
s16 func_800AAE04(u8, s16);
s16 func_800AAF08(u8, s16);
extern char D_8006BFA0[];
extern s32 D_800C3A10;
extern s16 D_800C502C;
extern s32 D_800C504C;
extern s8 D_800C509C;

void func_800AA814(s32 arg0, u32 arg1, char *arg2) {
    Struct_800AA814 *p;
    s8 *t;

    p = func_8008DC10(D_800C502C, arg0);
    if (p->unk_00 == 0xFF && arg1 != 4 && arg1 != 5 && arg1 != 6 && arg1 != 10) {
        func_8002E65C(arg2, D_8006BFA0);
        return;
    }
    switch (arg1) {
        case 0:
            func_8002E65C(arg2, func_8008DF68(p->unk_01));
            break;
        case 1:
            if (p->unk_01 >= 30) {
                func_8002E65C(arg2, D_8006BFA0);
                break;
            }
            t = func_8008DBEC(p->unk_01);
            if (D_800C509C < D_800C502C && (u8) (D_800C509C - 1) < 16) {
                func_800167FC(t[0], arg2);
            } else {
                func_800167FC(func_800AAD00(p->unk_01, D_800C502C), arg2);
            }
            break;
        case 2:
            if (p->unk_01 >= 30) {
                func_8002E65C(arg2, D_8006BFA0);
                break;
            }
            t = func_8008DBEC(p->unk_01);
            if (D_800C509C < D_800C502C && (u8) (D_800C509C - 1) < 16) {
                func_800167FC(t[1], arg2);
            } else {
                func_800167FC(func_800AAE04(p->unk_01, D_800C502C), arg2);
            }
            break;
        case 3:
            if (p->unk_01 >= 30) {
                func_8002E65C(arg2, D_8006BFA0);
                break;
            }
            t = func_8008DBEC(p->unk_01);
            if (D_800C509C < D_800C502C && (u8) (D_800C509C - 1) < 16) {
                func_800167FC(t[2], arg2);
            } else {
                func_800167FC(func_800AAF08(p->unk_01, D_800C502C), arg2);
            }
            break;
        case 4:
            if (!(p->unk_04 & 0xF)) {
                func_8002E65C(arg2, func_8008DC54(D_800C502C, arg0));
            } else {
                func_800167FC(p->unk_03, arg2);
            }
            break;
        case 5:
            if (!(p->unk_04 & 0xF)) {
                func_8002E65C(arg2, func_8008DDB8(D_800C502C, arg0));
            } else {
                func_800167FC(p->unk_02, arg2);
            }
            break;
        case 6:
            func_8002E65C(arg2, func_8008DF68(p->unk_00));
            break;
        case 7:
            if (p->unk_00 >= 30) {
                func_8002E65C(arg2, D_8006BFA0);
                break;
            }
            t = func_8008DBEC(p->unk_00);
            if (D_800C509C < D_800C502C && (u8) (D_800C509C - 1) < 16) {
                func_800167FC(t[0], arg2);
            } else {
                func_800167FC(func_800AAD00(p->unk_00, D_800C502C), arg2);
            }
            break;
        case 8:
            if (p->unk_00 >= 30) {
                func_8002E65C(arg2, D_8006BFA0);
                break;
            }
            t = func_8008DBEC(p->unk_00);
            if (D_800C509C < D_800C502C && (u8) (D_800C509C - 1) < 16) {
                func_800167FC(t[1], arg2);
            } else {
                func_800167FC(func_800AAE04(p->unk_00, D_800C502C), arg2);
            }
            break;
        case 9:
            if (p->unk_00 >= 30) {
                func_8002E65C(arg2, D_8006BFA0);
                break;
            }
            t = func_8008DBEC(p->unk_00);
            if (D_800C509C < D_800C502C && (u8) (D_800C509C - 1) < 16) {
                func_800167FC(t[2], arg2);
            } else {
                func_800167FC(func_800AAF08(p->unk_00, D_800C502C), arg2);
            }
            break;
        case 10:
            if (p->unk_04 & 0xF) {
                *(s32 *) arg2 = 0;
            } else if (D_800C502C != D_800C509C) {
                *(s32 *) arg2 = 0;
            } else if (p->unk_05 == 1) {
                *(s32 *) arg2 = D_800C3A10;
            } else {
                *(s32 *) arg2 = D_800C504C;
            }
            break;
        case 11:
        case 12:
        case 13:
        case 14:
            if (D_800C502C == 21) {
                func_8002E65C(arg2, D_8006BFA0);
            } else {
                arg2[0] = '-';
                arg2[1] = '\0';
            }
            break;
    }
}
