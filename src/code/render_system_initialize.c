#include "types.h"

extern s16 D_8006550C;
extern s16 D_80065502;
extern s16 D_80065500;
extern void *D_80065524;
extern void *D_80065528;
extern void *D_8008B32C;
extern void *D_8008774C;
extern void *D_80085290;
extern void *D_80088620;

extern void func_800114D0(void);
extern void *func_8000D5BC(s32, s32, s32);
extern void *func_8000B6F8(s32, s32);
extern void func_8000C940(void *, s32, s32);
extern void func_8000C964(void *, s32, s32);
extern void func_8000C8AC(void *);
extern void func_8000C898(void *, void *);
extern void *func_80032E00(s32, s32);
extern void *func_8000D740(void *, s32, void *);
extern void func_80032F3C(s32, void *);
extern void func_8000CB78(void *, s32, s32);
extern s32 func_80031A1C(s32);
extern void func_8003CFA0(s32, s32, s16);

void render_system_initialize(void)
{
    s32 one;
    void *temporary;

    if (D_8006550C == 0) {
        if (D_80065502 == 0) {
            func_800114D0();
            one = 1;
            D_80065524 = func_8000D5BC(0, 0, 0);
            D_80065528 = func_8000B6F8(0xFFFE, 3);
            D_80065500 = one;
            func_8000C940(D_80065528, 0, 0);
            func_8000C964(D_80065528, 0x140, 0xF0);
            func_8000C8AC(D_80065528);
            func_8000C898(D_80065528, D_80065524);

            temporary = func_80032E00(0, 8);
            {
                register void *owner __asm__("$4") = D_80065524;
                register s32 kind __asm__("$5") = 0xE;
                register void *call_temporary __asm__("$6") = temporary;

                __asm__ volatile("" : : "r"(owner), "r"(kind),
                                 "r"(call_temporary));
                D_8008B32C = call_temporary;
                *(s16 *)call_temporary = 0x457;
                D_8008774C = func_8000D740(owner, kind, call_temporary);
            }
            func_80032F3C(0, D_8008B32C);
            func_8000CB78(D_80065528, 0, 0);
            D_80065502 = one;

            if (D_80085290 != D_80088620) {
                s32 value = func_80031A1C(8);

                func_8003CFA0(0x24, 0xD, (s16)(value + 0xC));
                D_80085290 = D_80088620;
            }
        }
    } else {
        D_8006550C = 0;
    }
}
