#include "types.h"

typedef struct {
    u8 x00;
    u8 pad01[0x27];
} PlayerRecord;

typedef struct {
    u8 frame;
    u8 pad01[0x6B];
    u16 players[55];
    u8 padDA[0xE];
    PlayerRecord records[55];
    u8 pad980[0x17CC];
} RosterTeam;

extern RosterTeam D_80080C90[];
extern u16 *D_80073438;

u16 frame_identifier_find(u32 identifier);
u8 *func_8003A368(void);

void roster_runtime_copy(u16 roster) {
    u16 id = frame_identifier_find(D_80080C90[roster].frame);
    u16 *src = D_80080C90[roster].players;
    u16 *dst = D_80073438 + id * 55;
    u8 *out = func_8003A368() + id * 55;
    u32 i;

    for (i = 0; i < 55; i++) {
        *dst++ = *src++;
        *out++ = D_80080C90[roster].records[i].x00;
    }
}
