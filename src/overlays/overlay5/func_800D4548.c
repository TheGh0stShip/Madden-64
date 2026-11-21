#include "types.h"

typedef struct {
    s32 ids[100];
    s32 vals[100];
    s16 count;
} Ranking;

void *func_80032E00(s32 arena, s32 size);
s16 func_8002B5EC(void);
void func_80092B98(void);
s16 func_80024D28(u16 id);
s16 func_800D4E68(s16 team, s16 id, s32 flags, s32 arg3, s32 arg4, s32 arg5);
s32 func_80022AD8(u16 team, u16 id);
s32 func_800D3DD4(s16 id, s8 *info, s32 team, s32 flags);

Ranking *func_800D4548(s32 flags, s16 max, s8 *info, s32 team, s32 arg4, s32 arg5, s32 arg6) {
    Ranking *rank;
    s16 desc;
    s32 init;
    s16 i;
    s16 k;
    s16 j;
    s16 id;
    s16 tick;
    s32 total;
    s32 val;

    rank = func_80032E00(0, sizeof(Ranking));
    rank->count = 0;
    if (flags & 0x40000) {
        desc = 1;
    } else {
        desc = info[3];
    }
    init = 0x7FFFFFFF;
    if (desc == 0) {
        init = 0x80000001;
    }
    for (i = 0; i < max; i++) {
        rank->vals[i] = init;
    }
    tick = 0;
    if (func_8002B5EC() == 1) {
        total = (flags & 4) ? 0x370 : 0x37;
    } else {
        total = (flags & 4) ? 0x6F2 : 0x37;
    }
    id = -1;
    for (i = 0; i < total; i++) {
        if (++tick == 150) {
            tick = 0;
            func_80092B98();
        }
        if (flags & 4) {
            id = func_80024D28(id);
        } else {
            id = i;
        }
        if (id == -1) {
            break;
        }
        if (func_800D4E68(team, id, flags, arg4, arg5, arg6) != 0) {
            if (rank->count < max) {
                rank->count++;
            }
            if (flags & 0x40000) {
                val = func_80022AD8(team, id) & 0x3F;
            } else {
                val = func_800D3DD4(id, info, team, flags);
                if ((flags & 0x20004) == 0x20004 && info[0] == 2 && (val & 0x80008000)) {
                    if (val & 0xFFFF) {
                        val -= 0x10001;
                    } else {
                        val -= 1;
                    }
                }
            }
            if (desc == 0) {
                for (k = 0; k < max; k++) {
                    if (rank->vals[k] < val) {
                        for (j = rank->count - 1; k < j; j--) {
                            rank->vals[j] = rank->vals[j - 1];
                            rank->ids[j] = rank->ids[j - 1];
                        }
                        rank->vals[k] = val;
                        rank->ids[k] = id;
                        break;
                    }
                }
            } else {
                for (k = 0; k < max; k++) {
                    if (val < rank->vals[k]) {
                        for (j = max - 1; k - 1 < j; j--) {
                            rank->vals[j] = rank->vals[j - 1];
                            rank->ids[j] = rank->ids[j - 1];
                        }
                        rank->vals[k] = val;
                        rank->ids[k] = id;
                        break;
                    }
                }
            }
        }
    }
    return rank;
}
