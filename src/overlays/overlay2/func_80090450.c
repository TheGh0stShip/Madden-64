#include "types.h"

typedef struct {
    u8 unk0[3];
    s8 wins;
    u8 unk4[2];
    s8 ties;
    u8 unk7[3];
    u16 points_for;
    u16 points_against;
} TeamRecord;

TeamRecord *func_8008DBEC(u8 team);
s32 func_80031964(void);

/* Standings tie-break between two teams: wins, then ties, then point differential, then a coin flip. */
u8 *func_80090450(u8 *a, u8 *b) {
    TeamRecord *ra;
    TeamRecord *rb;
    s16 da;
    s16 db;

    ra = func_8008DBEC(*a);
    rb = func_8008DBEC(*b);
    if (ra->wins > rb->wins) {
        return a;
    }
    if (ra->wins < rb->wins) {
        return b;
    }
    if (ra->ties > rb->ties) {
        return a;
    }
    if (ra->ties < rb->ties) {
        return b;
    }
    da = ra->points_for - ra->points_against;
    db = rb->points_for - rb->points_against;
    if (da > db) {
        return a;
    }
    if (da < db) {
        return b;
    }
    if (func_80031964() & 0x400) {
        return b;
    }
    return a;
}
