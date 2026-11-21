#include "types.h"

typedef struct {
    u8 unk_00[2];
    u8 unk_02;
    u8 unk_03;
    u8 state;
    s8 unk_05;
} PoolRecord;

typedef struct {
    u8 unk_00[2];
    u16 unk_02;
} PoolState;

typedef struct {
    u8 v[8];
} PoolStep;

extern u16 D_80087A60;
extern PoolStep D_80088D38[];
extern void *D_80086DD8;
extern u8 D_800908B8[];
extern u8 D_80002980[];

s16 audio_channel_find(PoolRecord *record, PoolState *state);
void func_800C7FF8(PoolRecord *record, PoolStep *step);
void func_800370B0(void *source, s32 mode);

void memory_pool_update(PoolRecord *record, PoolState *state) {
    s16 i;
    u32 st;

    if (record->unk_05 != 0) {
        return;
    }
    st = record->state & 0xF;
    if (st == 7 || st == 8) {
        return;
    }
    if ((u8)st == 0) {
        return;
    }
    switch ((u8)st) {
        case 1:
            i = audio_channel_find(record, state);
            D_80087A60 = state->unk_02;
            func_800C7FF8(record, &D_80088D38[i]);
            record->state = (record->state & 0xF0) | 2;
            break;
        case 2:
            i = audio_channel_find(record, state);
            record->unk_02 += D_80088D38[i].v[0];
            record->unk_03 += D_80088D38[i].v[1];
            record->state = (record->state & 0xF0) | 3;
            break;
        case 3:
            i = audio_channel_find(record, state);
            record->unk_02 += D_80088D38[i].v[2];
            record->unk_03 += D_80088D38[i].v[3];
            record->state = (record->state & 0xF0) | 4;
            break;
        case 4:
            i = audio_channel_find(record, state);
            record->unk_02 += D_80088D38[i].v[4];
            record->unk_03 += D_80088D38[i].v[5];
            record->state = (record->state & 0xF0) | 5;
            break;
        case 5:
            i = audio_channel_find(record, state);
            record->unk_02 += D_80088D38[i].v[6];
            record->unk_03 += D_80088D38[i].v[7];
            record->state = (record->state & 0xF0) | 7;
            break;
    }
    if (D_80086DD8 != D_800908B8) {
        func_800370B0(D_80002980, 1);
    }
}
