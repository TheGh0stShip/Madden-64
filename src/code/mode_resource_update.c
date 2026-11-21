#include "types.h"

typedef struct {
    void *callback;
    s32 key;
    s32 previous;
    char *buffer;
    s16 value;
} TransitionCommand;

typedef struct {
    char name[8][11];
    u8 unk58[0x30];
    s16 id[8];
} PlaybookNames;

typedef struct {
    char name[14][17];
    s16 unkEE[14];
    u16 unk10A[14];
    u8 unk126[14];
} ModeResources;

typedef struct {
    u16 slot[55];
    u8 unk6E[0x214C - 0x6E];
} RosterTeam;

typedef struct {
    u8 unk00;
    u8 unk01[0x214B];
} RosterTeamHeader;

typedef struct {
    char text[4];
} Str4;

extern s16 D_8006BA22;
extern u16 D_80088AE4;
extern u16 D_800857B2;
extern u16 D_80085280;
extern PlaybookNames *D_800885E4;
extern ModeResources *D_800895B8;
extern u8 D_800ACF28[];
extern RosterTeam D_80080CFC[];
extern RosterTeamHeader D_80080C90[];
extern Str4 D_80001198;
extern char D_80001190[];

void func_800DD6EC(void);
u32 memory_pool_range_take(s32 pool, u32 size);
void func_800AE924(TransitionCommand *command);
void func_8002E65C(char *dst, char *src);
s32 func_800370B0(void *source, s32 arg1);

void mode_resource_update(s16 index, s16 value, u16 team, u16 slot, u16 flags) {
    TransitionCommand command;
    s16 i;

    if (D_8006BA22 != 0) {
        i = 0;
        if (!(flags & 0xC0)) {
            func_800DD6EC();
            if (team == D_80088AE4) {
                flags = D_800857B2;
            } else {
                flags = D_80085280;
            }
        }
        if ((flags & 0xC0) == 0x40) {
            for (i = 0; i < 8; i++) {
                if (D_800885E4->id[i] == (flags & 0xFF3F)) {
                    break;
                }
            }
            if (i == 8) {
                return;
            }
        }
        if (D_800895B8->unkEE[index] < value) {
            command.callback = D_800ACF28;
            command.key = team + (index << 16);
            command.previous = D_800895B8->unkEE[index];
            command.buffer = (char *)memory_pool_range_take(0, 0x14);
            command.value = 0xAF;
            func_800AE924(&command);
            func_8002E65C(command.buffer, D_800895B8->name[index]);
            D_800895B8->unkEE[index] = value;
            D_800895B8->unk10A[index] = D_80080CFC[team].slot[slot];
            D_800895B8->unk126[index] = D_80080C90[team].unk00;
            if ((flags & 0xC0) == 0x40) {
                func_8002E65C(D_800895B8->name[index], D_800885E4->name[i]);
            } else {
                *(Str4 *)D_800895B8->name[index] = D_80001198;
            }
            func_800370B0(D_80001190, 0);
        }
    }
}
