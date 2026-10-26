#include "types.h"

typedef struct VoiceRecord {
    u32 field00;
    u32 field04;
    u8 pad08[0x10];
    u32 flags;
    u8 pad1C[4];
} VoiceRecord;
typedef struct AudioContext { u8 pad00[0x14]; VoiceRecord *records; } AudioContext;

extern s32 D_80085028;
extern AudioContext *D_80064A00;
extern s8 D_80087B08[];
extern s8 D_80087B10[];
extern s8 D_8008B790[];
extern u8 D_80085C00[];
extern u8 D_80088110[];
extern u8 D_80085E48[];
extern u8 D_80088488[];
extern s32 D_800734F8;
extern s32 D_80086CB8;
extern VoiceRecord *D_80087B6C;
extern s32 D_800880A4;
extern u16 D_8008A5B4;
extern void func_8003D2D4(s32 index, s32 value);

void audio_voice_render(void)
{
    register s32 index __asm__("$4");
    register VoiceRecord *record __asm__("$5");
    register s32 sentinel __asm__("$6");
    register VoiceRecord *base __asm__("$2");
    register s32 previous __asm__("$2");
    register s32 minus_one __asm__("$4");
    s32 state;
    s32 lock;

    if (D_80085028 == 1) {
        if (D_80064A00 != 0) {
            index = 7;
            base = D_80064A00->records;
            sentinel = -1;
            record = &base[7];
loop:
                __asm__("" : "=r"(index) : "0"(index));
                if ((record->flags & 5) == 0) {
                    if (D_80087B08[index] != sentinel) {
                        D_80087B10[D_80087B08[index]] = sentinel;
                        D_80087B08[index] = sentinel;
                        D_8008B790[index] = 0;
                    }
                } else if (D_8008B790[index] != 0) {
                    if (D_80088110[index] < D_80085C00[index]) {
                        D_80085C00[index]--;
                    }
                    if (D_80085C00[index] < D_80088110[index]) {
                        D_80085C00[index]++;
                    }
                    if (D_80088488[index] < D_80085E48[index]) {
                        D_80085E48[index]--;
                    }
                    if (D_80085E48[index] < D_80088488[index]) {
                        D_80085E48[index]++;
                    }
                    record->field00 = D_80085C00[index] >> 4;
                    record->field04 = D_80085E48[index] >> 4;
                    if (D_80088110[index] == D_80085C00[index] &&
                        D_80088488[index] == D_80085E48[index]) {
                        D_8008B790[index] = 0;
                    }
                }
            previous = index;
            index--;
            record--;
            if (previous != 0) {
                goto loop;
            }
        }

        lock = D_800734F8;
        minus_one = -1;
        if (lock == minus_one) goto done;
        state = D_80086CB8;
        if (state < 0) goto done;
        if (state < 2) goto low_state;
        if (state == 2) goto countdown;
        goto done;
low_state:
        if (D_80087B6C->flags & 5) goto done;
        if (state != 0) goto start_countdown;
        D_800734F8 = minus_one;
        goto done;
start_countdown:
        D_800880A4 = 300;
        D_80086CB8 = 2;
        goto done;
countdown:
        D_800880A4 -= D_8008A5B4;
        if (D_800880A4 >= 0) goto done;
        D_800734F8 = minus_one;
        func_8003D2D4(lock, 1);
        D_800734F8 = lock;
    }
done:
    return;
}
