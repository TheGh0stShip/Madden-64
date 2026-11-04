#include "types.h"

extern void func_80022C58(s16);
extern s8 func_8003C6B4(u16, s32);
extern void func_8003B9C0(s32, s32, u8);
extern u8 D_80074808;
extern s8 D_80081602[][3];
extern s8 D_8008374E[][3];
extern u8 D_80082DC0[][0x214C];
extern void *D_80085040[][22];

typedef struct RosterData {
    u8 rows[55][11];
    u8 pad[0x214C - (55 * 11)];
} RosterData;

extern RosterData D_800816A7[];

void func_80022354(s16 arg0) {
    s32 count;
    s32 clear_index;
    u16 index;
    u16 table_id;
    s32 team;
    u8 value;

    if (D_80074808 == 0) {
        count = 0;
        do {
            clear_index = (u16)count;
            count++;
            D_80081602[clear_index][0] = 0;
            D_8008374E[clear_index][0] = 0;
        } while ((u16)count < 0x37);
    }

    func_80022C58(arg0);
    count = 0;
    table_id = *(u16 *)D_80082DC0[(u16)arg0];
    team = (u16)arg0;
    for (; (u16)count < 11; count++) {
        index = count;
        ((s8 *)D_80085040[team][index])[0x20] = func_8003C6B4(table_id, index);
        value = D_800816A7[team].rows[table_id][index];
        func_8003B9C0(team, index, value);
    }
}
