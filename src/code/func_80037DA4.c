#include "types.h"

typedef struct TeamRecord {
    u8 pad[0x2130];
    s16 mode;
    u8 tail[0x1A];
} TeamRecord;

extern TeamRecord D_80080C90[];
extern s8 D_800734CC[12];
extern s8 D_800734D8[12];
extern void *D_80085040[];

extern void func_80037D34(void *);
extern void func_800E1CF4(void *, void *);

void func_80037DA4(s16 team)
{
    s8 *pairs;
    void **object_base;
    void **team_objects;
    s32 sentinel;
    s32 team_index;
    register s16 i;

    switch (D_80080C90[team].mode) {
    case 3:
        pairs = D_800734CC;
        i = 0;
        break;
    case 16:
        pairs = D_800734D8;
        i = 0;
        break;
    default:
        return;
    }

    for (i = 0,
         sentinel = -1,
         team_index = (s16)team,
         object_base = D_80085040,
         team_objects = &object_base[team_index * 22];
         i < 12;
         i = i + 2) {
        s8 first;
        s16 second;
        void **first_slot;
        void **second_slot;

        first = pairs[i];
        if (first == sentinel) {
            continue;
        }
        second = pairs[i + 1];
        first_slot = (void **)(first * 4 + (u32)team_objects);
        func_80037D34(*first_slot);
        if (second == sentinel) {
            continue;
        }
        second_slot = (void **)(second * 4 + (u32)team_objects);
        func_80037D34(*second_slot);
        func_800E1CF4(*first_slot, *second_slot);
    }
}
