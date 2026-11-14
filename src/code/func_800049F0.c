#include "types.h"

typedef struct {
    u8 pad00[0x20];
} AudioVoice;

typedef struct {
    s32 rate;
    s32 used;
    s32 frames;
    void *bufferA;
    void *bufferB;
    AudioVoice *voices;
} AudioContext;

extern AudioContext *D_80064A00;
extern u8 D_80086A30[];
extern u8 D_800869C8[];

extern void func_80008CBC(void);
extern void *func_80032E00(s32 pool, s32 size);
extern void *func_800337CC(s32 pool, s32 size, s32 align);
extern void func_80008C94(AudioVoice *voice);
extern void func_80004D34(AudioContext *ctx);
extern void func_80045B98(u8 *thread, s32 id, void (*entry)(void), s32 arg, u8 *stack, s32 priority);
extern void func_8004DE18(u8 *thread);

void func_800049F0(s32 rate) {
    AudioContext *ctx;
    s32 frames;
    s32 i;

    ctx = func_80032E00(0, 0x18);
    ctx->rate = rate;
    D_80064A00 = ctx;
    ctx->used = 0;
    frames = (rate / 50 + 15) & -16;
    ctx->frames = frames;
    frames <<= 2;
    D_80064A00->bufferA = func_800337CC(0, frames, 16);
    D_80064A00->bufferB = func_800337CC(0, frames, 16);
    i = 7;
    D_80064A00->voices = func_80032E00(0, 0x100);
    do {
        func_80008C94(&D_80064A00->voices[i]);
    } while (i-- != 0);
    func_80004D34(D_80064A00);
    func_80004D34(D_80064A00);
    func_80045B98(D_80086A30, 0x56, func_80008CBC, 0, D_800869C8, 0x80);
    func_8004DE18(D_80086A30);
}
