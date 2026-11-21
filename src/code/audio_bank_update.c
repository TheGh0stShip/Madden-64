#include "types.h"

typedef struct Team {
    u8 unk0;
    u8 pad1[0x6C - 1];
    u8 unk6C[0xDA - 0x6C];
    u8 unkDA[0x2104 - 0xDA];
    s16 unk2104;
    s16 unk2106;
    u8 pad2108[0x2120 - 0x2108];
    s16 unk2120;
    u8 pad2122[0x214C - 0x2122];
} Team;

extern u16 D_8006B9E0;
extern u16 D_8006B9E4[31];
extern Team D_80080C90[];
extern u8 D_80082DDC;

void audio_frame_storage_mode(s32, s32);
void gameplay_state_update(void);
void audio_frame_header_copy(u8, Team *);
void audio_frame_payload_copy(u8, void *);
void audio_frame_collision_resolve(void *, void *);
void func_80024E9C(void);
void audio_bank_prepare(void);

void audio_bank_update(u8 home, u8 away) {
    u16 saved[31];
    u16 saved_mode;
    u32 i;
    u16 t;
    u8 flag;

    saved_mode = D_8006B9E0;
    D_8006B9E0 = 0x1E;
    for (i = 0; i < 31; i++) {
        saved[i] = D_8006B9E4[i];
        D_8006B9E4[i] = i;
    }
    D_80080C90[0].unk0 = home;
    D_80082DDC = away;
    for (t = 0; t < 2; t++) {
        flag = 0;
        if (D_80080C90[t].unk0 < 0x1E) {
            flag = 1;
            audio_frame_storage_mode(1, 0);
            gameplay_state_update();
        }
        audio_frame_header_copy(D_80080C90[t].unk0, &D_80080C90[t]);
        audio_frame_payload_copy(D_80080C90[t].unk0, D_80080C90[t].unk6C);
        audio_frame_collision_resolve(D_80080C90[t].unk6C, D_80080C90[t].unkDA);
        D_80080C90[t].unk2106 = 3;
        D_80080C90[t].unk2104 = 0;
        D_80080C90[t].unk2120 = 0;
        if (flag == 1) {
            audio_frame_storage_mode(0, 0);
            func_80024E9C();
        }
    }
    audio_bank_prepare();
    D_8006B9E0 = saved_mode;
    for (i = 0; i < 31; i++) {
        D_8006B9E4[i] = saved[i];
    }
}
