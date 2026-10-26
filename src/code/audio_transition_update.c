#include "types.h"

extern s32 D_800712C8;
extern s32 D_800734F8;
extern s32 D_80086DE0;
extern void *D_800876C0;
extern u16 D_8008A5B4;
extern void func_8003D464(void *value);
extern void func_8002FFEC(void *callback);

void audio_transition_update(void)
{
    s32 state = D_800712C8;

    if (state == 1) {
        goto active;
    }
    if (state == 0) {
        goto callback;
    }
    if (state == 2) {
        goto idle;
    }
    goto done;
active:
    D_80086DE0 -= D_8008A5B4;
    if (D_80086DE0 >= 0) {
        goto done;
    }
    func_8003D464(D_800876C0);
    D_800712C8 = 2;
    goto done;
idle:
    if (D_800734F8 != -1) {
        goto done;
    }
    D_800712C8 = 0;
callback:
    func_8002FFEC(audio_transition_update);
done:
    return;
}
