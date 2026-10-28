#include "types.h"

typedef struct {
    u8 pad00[0xAC];
    void (*callback)(void *);
    s32 value;
} Handler;

extern s32 D_80085298;
extern Handler *D_80086A2C;
extern s32 D_80087A64;
extern s32 D_80088090;
extern s32 D_80089490[];
extern volatile u16 D_8008A5B4;

void func_8000BF08(void);
void func_8000DC7C(s32);
s32 func_80030B54(s16);
void func_80030C74(s32 *);
void func_8003456C(s32, u16);
void func_80093ABC(s32);
void func_800B7C80(void);

void func_80097E74(void) {
    s32 status;
    s32 *entry;
    s32 i;
    s32 end;

    func_80030C74(&status);
    i = 0;
    if (!(status & 0xFF3F)) {
        func_8000DC7C(D_80087A64);
        func_8003456C(D_80085298, D_8008A5B4);
        func_8003456C(D_80087A64, D_8008A5B4);
        func_8000BF08();
        func_800B7C80();
        func_80093ABC(D_80088090);
        return;
    }
    if (D_80089490[0] != -1) {
        end = -1;
        entry = D_80089490;
        do {
            if (func_80030B54(((s16 *)entry)[1]) & 0xFF3F) {
                break;
            }
            entry++;
            i++;
        } while (*entry != end);
    }
    D_80086A2C->value = D_80089490[i];
    D_80086A2C->callback(D_80086A2C);
}
