#include "types.h"

/* gameplay_interface_update: add a delta record to a packed player attribute block. Unsigned bitfields
 * saturate at their maximum; the two signed fields (16 and 14 bits) saturate in both directions. */
typedef struct PackedStats {
    u32 pad0 : 2;
    u32 stat_i : 7;
    u32 stat_e : 7;
    s32 stat_c : 16;
    u32 stat_b : 11;
    u32 stat_a : 12;
    u32 stat_g : 9;
    u32 stat_d : 10;
    u32 stat_f : 8;
    s32 stat_h : 14;
} PackedStats;

typedef struct StatDelta {
    u8 pad0[6];
    s16 a;
    s16 b;
    s16 c;
    s16 d;
    s16 e;
    s16 f;
    s16 g;
    s16 h;
    s16 i;
} StatDelta;

void gameplay_interface_update(PackedStats *arg0, StatDelta *delta)
{
    PackedStats *stats = arg0;
    s32 v;
    s32 w;

    v = stats->stat_a + delta->a;
    stats->stat_a = v;
    if ((v & 0xFFF) != v) {
        stats->stat_a = 0xFFF;
    }
    v = stats->stat_b + delta->b;
    stats->stat_b = v;
    if ((v & 0x7FF) != v) {
        stats->stat_b = 0x7FF;
    }
    w = stats->stat_c + delta->c;
    if ((stats->stat_c += delta->c) != w) {
        stats->stat_c = (w < 0) ? -0x8000 : 0x7FFF;
    }
    v = stats->stat_d + delta->d;
    stats->stat_d = v;
    if ((v & 0x3FF) != v) {
        stats->stat_d = 0x3FF;
    }
    v = stats->stat_e + delta->e;
    stats->stat_e = v;
    if ((v & 0x7F) != v) {
        stats->stat_e = 0x7F;
    }
    v = stats->stat_f + delta->f;
    stats->stat_f = v;
    if ((v & 0xFF) != v) {
        stats->stat_f = 0xFF;
    }
    v = stats->stat_g + delta->g;
    stats->stat_g = v;
    if ((v & 0x1FF) != v) {
        stats->stat_g = 0x1FF;
    }
    w = stats->stat_h + delta->h;
    if ((stats->stat_h += delta->h) != w) {
        if (w < 0) {
            stats->stat_h = -0x2000;
        } else {
            stats->stat_h = 0x1FFF;
        }
    }
    v = stats->stat_i + delta->i;
    stats->stat_i = v;
    if ((v & 0x7F) != v) {
        stats->stat_i = 0x7F;
    }
}
