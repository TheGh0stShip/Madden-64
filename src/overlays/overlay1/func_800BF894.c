#include "types.h"

typedef struct {
    s8 type;
    u8 value;
} Message;

extern void *D_80072720[];
extern s8 D_8008B2A8[];
extern u8 *D_800880F0[];

#ifndef NULL
#define NULL 0
#endif

s32 func_800A2E4C(s32 *, s32);              /* extern */
s32 func_800BAC0C(void *);                          /* extern */
s32 func_800BBB18(void *);                      /* extern */
s32 func_800BD694(void *);                          /* extern */
s32 func_800BD79C(s32);                         /* extern */
s32 func_800C93D8(void *);                      /* extern */
s32 func_800C9418(void *);                      /* extern */
s32 func_800C9778(void *, s32);             /* extern */
s32 func_800C9F58(void *);                      /* extern */
s32 func_800E1A84(void *, Message *);                /* extern */
extern s32 D_80080C10;
extern void *D_80086178;
extern s32 D_80086CE8;
extern s16 D_80089320;
extern s16 D_80089340;
extern s32 D_80089490;
extern void *D_8008A058;
extern u16 D_8008A5B2;
extern u8 D_8008AFC6;

s32 func_800BF894(void *arg0) {
    Message msg;
    s32 temp_v0;
    void *temp_s2;

    if (D_80080C10 & 0x01000000) {
        (*(u16 *)((u8 *)(arg0) + 0x28)) = (u16) ((*(u16 *)((u8 *)(arg0) + 0x28)) & 0xFFFE);
        return 0;
    }
    temp_s2 = D_80072720[D_8008B2A8[*(u8 *)((u8 *)arg0 + 0x21) & 0xBF]];
    if (arg0 == D_8008A058) {
        return func_800BAC0C(arg0) & 0xFFFF;
    }
    temp_v0 = func_800BD694(arg0);
    if (temp_v0 & (*(s32 *)((u8 *)(temp_s2) + 8))) {
        if (D_8008AFC6 == 0) {
            func_800BD79C((*(u8 *)((u8 *)(arg0) + 0x21)) & 0xBF);
            return 0;
        }
        if (((D_80080C10 & 0x48) == 0x40) && (D_8008A058 != NULL) && !((*(u16 *)((u8 *)(D_8008A058) + 0x28)) & 0x10) && !((*(s32 *)((u8 *)((*(void **)((u8 *)(D_8008A058) + 0x24))) + 0x14)) & 0x10000) && ((u8) (*(u8 *)((u8 *)(arg0) + 0x1F)) < 6U)) {
            msg.type = 0xE;
            msg.value = (*(u8 *)((u8 *)(arg0) + 0x1F));
            func_800E1A84(D_8008A058, &msg);
            return 0;
        }
        if ((D_80089320 == -1) || (D_80089340 == 3) || (D_8008A5B2 == 3)) {
            func_800BD79C((*(u8 *)((u8 *)(arg0) + 0x21)) & 0xBF);
            func_800A2E4C(&D_80086CE8, *(s32 *)(D_800880F0[D_80089490] + 0x24));
            return 0;
        }
    }
    if ((D_80080C10 & 0x4000) && !((*(u16 *)((u8 *)(arg0) + 0x28)) & 0x10)) {
        func_800BBB18(arg0);
        if (temp_v0 & (*(s32 *)((u8 *)(temp_s2) + 0xC))) {
            if ((*(u8 *)((u8 *)(arg0) + 0x64)) == 8 && D_8008A5B2 == 5) {
                if ((*(s32 *)((u8 *)(D_80086178) + 0x24)) > 0x400000) {
                    func_800C9F58(arg0);
                    return 0;
                }
            } else {
                func_800C9778(arg0, 1);
                return 0;
            }
        }
        if (temp_v0 & (*(s32 *)((u8 *)(temp_s2) + 4))) {
            func_800C93D8(arg0);
            return 0;
        }
        if ((((*(s32 *)((u8 *)((*(void **)((u8 *)(arg0) + 0x24))) + 0x20)) - (*(s32 *)((u8 *)(D_80086178) + 0x20))) <= 0xBFFFFF) && (temp_v0 & (*(s32 *)((u8 *)(temp_s2) + 0)))) {
            func_800C9418(arg0);
        }
        return 0;
    }
    return 0;
}
