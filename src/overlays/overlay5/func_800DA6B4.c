#include "types.h"

typedef struct {
    char name[0xD];
    u8 unk0D;
    u8 pad0E[0x16];
    u8 unk24;
    u8 unk25;
} DA6B4Record;

typedef struct {
    s32 unk00;
    char *unk04;
    char *unk08;
} DA6B4Text;

typedef struct {
    u8 pad00[0x3C];
    s32 unk3C;
    u8 pad40[0x1A];
    u16 unk5A;
    s32 unk5C;
    u8 pad60[0xC];
    char *unk6C;
    u8 pad70[4];
    DA6B4Text unk74;
} DA6B4State;

extern char D_8006BFA0[];
extern s32 D_800E6C34;
extern s16 D_800E7A90;

void func_800167FC(s16, char *);
void func_8001EC20(s32, s32);
void func_8001F5A4(s32, DA6B4Record *, s32);
void func_8001F754(s32);
void func_8002E65C(char *, char *);
DA6B4Record *func_8003AA28(u16);
DA6B4Record *func_8003ACA0(u16, u16);
s32 func_8003FA40(u16, u16, s32);
void func_800DD634(void);
void overlay5_indexed_assignment_update(s16, s32);

void func_800DA6B4(u16 arg0, DA6B4State *state) {
    char *buf;
    DA6B4Text *text;
    u16 team;
    s32 value;
    DA6B4Record *record;

    func_8001F754(0);
    buf = state->unk6C;
    text = &state->unk74;
    func_800DD634();
    team = state->unk5A;
    if (state->unk5C == 0) {
        D_800E7A90 = 0;
        overlay5_indexed_assignment_update(0, 0);
        state->unk74.unk04 = D_8006BFA0;
        state->unk74.unk08 = D_8006BFA0;
    } else {
        if (D_800E6C34 == 2) {
            value = func_8003FA40(team, arg0, 0);
            record = func_8003ACA0(team, func_8003FA40(team, arg0, 2));
        } else {
            value = func_8003FA40(team, arg0, 0);
            record = func_8003AA28(func_8003FA40(team, arg0, 2));
        }
        D_800E7A90 = record->unk25 | (record->unk24 << 8);
        if (D_800E6C34 == 2) {
            func_8001F5A4(0, record, value);
        } else {
            func_8001F5A4(0, record, value);
        }
        overlay5_indexed_assignment_update(D_800E7A90, 0);
        func_800167FC(record->unk0D, buf);
        text->unk04 = buf;
        func_8002E65C(buf + 0x14, record->name);
        text->unk08 = buf + 0x14;
    }
    func_8001EC20(state->unk3C, 1);
    func_8001EC20(state->unk3C, 2);
}
