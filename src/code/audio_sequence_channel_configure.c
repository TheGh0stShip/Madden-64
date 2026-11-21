#include "types.h"

typedef struct {
    /* 0x00 */ u8 pad_00[0x3C];
    /* 0x3C */ s16 unk_3C;
} Model;

typedef struct {
    /* 0x00 */ u8 pad_00[8];
    /* 0x08 */ u8 unk_08;
    /* 0x09 */ u8 unk_09;
    /* 0x0A */ u8 unk_0A;
    /* 0x0B */ u8 pad_0B;
    /* 0x0C */ s16 unk_0C;
    /* 0x0E */ u8 unk_0E;
    /* 0x0F */ u8 unk_0F;
    /* 0x10 */ u8 unk_10;
    /* 0x11 */ u8 unk_11;
    /* 0x12 */ u8 unk_12;
    /* 0x13 */ u8 unk_13;
    /* 0x14 */ u8 unk_14;
    /* 0x15 */ u8 unk_15;
    /* 0x16 */ u8 unk_16;
    /* 0x17 */ u8 unk_17;
    /* 0x18 */ u8 unk_18;
    /* 0x19 */ u8 unk_19;
    /* 0x1A */ u8 unk_1A;
    /* 0x1B */ u8 unk_1B;
    /* 0x1C */ u8 unk_1C;
    /* 0x1D */ u8 pad_1D[3];
    /* 0x20 */ u8 unk_20;
    /* 0x21 */ u8 pad_21[3];
    /* 0x24 */ Model *model;
} Player;

typedef struct {
    /* 0x00 */ u8 unk_00;
    /* 0x01 */ u8 unk_01;
    /* 0x02 */ u8 unk_02;
    /* 0x03 */ u8 pad_03[0xF];
    /* 0x12 */ u8 unk_12;
    /* 0x13 */ u8 pad_13[0x15];
} Rating;

typedef struct {
    /* 0x0000 */ Rating ratings[69];
    /* 0x0AC8 */ u8 pad_AC8[0x20];
    /* 0x0AE8 */ s16 slots[0xB32];
} TeamRatings;

extern Player *D_80085040[][22];
extern TeamRatings D_80080D78[];
extern u8 D_80074830[];

s32 audio_stream_prepare(Player *player, u16 index, s32 kind);
u16 func_80031A1C(s32 id);
void func_800B96C0(Model *model, u8 *data);
void menu_grid_record_dispatch(u16 team, u16 slot, u16 index);

void audio_sequence_channel_configure(u16 team, u16 slot, u16 index) {
    Player *player;
    s32 value;

    D_80085040[team][slot]->unk_1C = D_80080D78[team].ratings[index].unk_00;
    D_80085040[team][slot]->unk_08 = D_80080D78[team].ratings[index].unk_01;
    D_80085040[team][slot]->model->unk_3C = D_80080D78[team].ratings[index].unk_01 + 70;
    D_80085040[team][slot]->unk_09 = D_80080D78[team].ratings[index].unk_02;
    D_80085040[team][slot]->unk_0A = audio_stream_prepare(D_80085040[team][slot], index, 2);
    D_80085040[team][slot]->unk_0C = audio_stream_prepare(D_80085040[team][slot], index, 3);
    D_80085040[team][slot]->unk_0E = audio_stream_prepare(D_80085040[team][slot], index, 4);
    D_80085040[team][slot]->unk_0F = audio_stream_prepare(D_80085040[team][slot], index, 5);
    D_80085040[team][slot]->unk_10 = audio_stream_prepare(D_80085040[team][slot], index, 6);
    D_80085040[team][slot]->unk_11 = audio_stream_prepare(D_80085040[team][slot], index, 7);
    D_80085040[team][slot]->unk_12 = audio_stream_prepare(D_80085040[team][slot], index, 8);
    D_80085040[team][slot]->unk_13 = audio_stream_prepare(D_80085040[team][slot], index, 14);
    D_80085040[team][slot]->unk_14 = audio_stream_prepare(D_80085040[team][slot], index, 15);
    D_80085040[team][slot]->unk_15 = audio_stream_prepare(D_80085040[team][slot], index, 9);
    D_80085040[team][slot]->unk_16 = audio_stream_prepare(D_80085040[team][slot], index, 10);
    D_80085040[team][slot]->unk_17 = audio_stream_prepare(D_80085040[team][slot], index, 11);
    D_80085040[team][slot]->unk_18 = audio_stream_prepare(D_80085040[team][slot], index, 12);
    D_80085040[team][slot]->unk_19 = audio_stream_prepare(D_80085040[team][slot], index, 13);
    D_80085040[team][slot]->unk_1A = audio_stream_prepare(D_80085040[team][slot], index, 16);
    D_80085040[team][slot]->unk_1B = D_80080D78[team].ratings[index].unk_12;
    D_80080D78[team].slots[slot] = index;
    menu_grid_record_dispatch(team, slot, index);
    player = D_80085040[team][slot];
    value = player->unk_20;
    if (value == player->unk_1C) {
        if (value < 10) {
            if (value >= 5) {
                func_800B96C0(player->model, D_80074830);
            }
        }
    }
    value = D_80085040[team][slot]->unk_14 + func_80031A1C(30) - 15;
    if (value < 0) {
        value = 0;
    }
    if (value > 255) {
        value = 255;
    }
    D_80085040[team][slot]->unk_14 = value;
    value = D_80085040[team][slot]->unk_18 + func_80031A1C(30) - 15;
    if (value < 0) {
        value = 0;
    }
    if (value > 255) {
        value = 255;
    }
    D_80085040[team][slot]->unk_18 = value;
}
