#include "types.h"

typedef struct RosterSymbolTeam {
    u8 bytes[8524];
} RosterSymbolTeam;

extern RosterSymbolTeam D_80080D6A[];

u16 roster_symbol_lookup(u16 team, u16 player, u16 symbol)
{
    u8 *team_base = &D_80080D6A[team].bytes[0];
    u8 *record;
    u8 *values;
    u16 result;

    record = team_base + player * 40;
    values = record + 15;

    if (symbol >= 21) {
        result = values[symbol - 21];
    } else {
        result = values[symbol];
    }
    if (symbol == 0) {
        result += 0x91;
    }
    return result;
}
