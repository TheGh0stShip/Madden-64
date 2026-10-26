#include "types.h"

extern u8 D_8008B3D0[];
extern void *D_8008B350;
extern void *D_80084F44;
extern void *D_80064B80;
extern void *D_80064BA0;
extern void *D_80085038;
extern void *D_8008AF98;
extern void *D_8008B60C;

extern void func_8000C914(void *);
extern void func_8000BE80(void);
extern void func_80032F3C(s32, void *);
extern void func_80033258(void *);
extern void func_80008E48(void *);

void display_system_shutdown(void)
{
    register void **first_slot __asm__("$16") = &D_8008B350;

    func_8000C914(D_8008B3D0);
    func_8000BE80();
    if (*first_slot != 0) {
        func_80032F3C(0, *first_slot);
        *first_slot = 0;
    }
    if (D_80084F44 != 0) {
        func_80032F3C(0, D_80084F44);
        D_80084F44 = 0;
        D_80064B80 = 0;
    }
    if (D_80064BA0 != 0) {
        func_80033258(D_80064BA0);
        D_80064BA0 = 0;
    }
    if (D_80085038 != 0) {
        func_80032F3C(0, D_80085038);
        D_80085038 = 0;
        D_8008AF98 = 0;
    }
    if (D_8008B60C != 0) {
        func_80008E48(D_8008B60C);
        D_8008B60C = 0;
    }
}
