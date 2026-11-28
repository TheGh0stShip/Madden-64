#include "types.h"

typedef struct RuntimeEntry {
    u8 bytes[0x68];
} RuntimeEntry;

extern void func_80032A4C(void *, s32);
extern void func_80032A80(void);
extern void func_80032ABC(void);
extern void func_80045B68(void *, void *, s32);
extern s32 func_800481B8(RuntimeEntry *);
extern s32 func_80048608(void *, RuntimeEntry *, s8);

extern s16 D_80086DA8;
extern s8 D_80086DE4[];
extern RuntimeEntry D_80086F60[];
extern u8 D_800895AC[];
extern u8 D_8008B288[];
extern s32 D_8008B660[];

void runtime_callback_update(void)
{
    s32 i;
    s32 retry;
    s32 result;
    s32 state;
    s8 id;

    func_80032A80();
    func_80045B68(D_8008B288, D_800895AC, 1);
    func_80032A4C(D_8008B288, 0);

    for (i = 0; i < D_80086DA8; i++) {
        id = D_80086DE4[i];
        D_8008B660[id] = 0;
        retry = 1;
        do {
            id = D_80086DE4[i];
            result = func_80048608(D_8008B288, &D_80086F60[id], id);
            func_800481B8(&D_80086F60[D_80086DE4[i]]);
            func_800481B8(&D_80086F60[D_80086DE4[i]]);
            state = func_800481B8(&D_80086F60[D_80086DE4[i]]);
            if (result == 0) {
                D_8008B660[D_80086DE4[i]] = 1;
            }
        } while (state != 0 && retry-- != 0);
    }

    for (i = 0; i < D_80086DA8; i++) {
        D_8008B660[D_80086DE4[i]] = 0;
        result = func_80048608(D_8008B288,
                               &D_80086F60[D_80086DE4[i]],
                               D_80086DE4[i]);
        if (result == 0) {
            D_8008B660[D_80086DE4[i]] = 1;
        }
    }
    func_80032ABC();
}
