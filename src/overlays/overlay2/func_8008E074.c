#include "types.h"

typedef struct {
    u8 id;
    u8 pad01[3];
    u8 flags;
    s8 state;
} Slot;

extern Slot *D_8008934C;
extern s8 D_800C509C;

s16 func_8008EF54(s16 team);
Slot *func_8008DC10(s16 team, s16 index);
void func_80036D84(s32 index);
void func_8008E444(void);

s16 func_8008E074(Slot *out) {
    s16 team;
    s16 count;
    s16 i;
    s16 selected;
    u16 total;
    s16 idle;
    s16 level;
    Slot *slot;

    idle = 0;
    total = 0;
    level = 1;
    team = D_800C509C;
    count = func_8008EF54(team);
    for (i = 0; i < count; i++) {
        slot = func_8008DC10(team, i);
        if (slot->id != 0xFF && (slot->flags & 0xF) == 0) {
            total++;
            if (slot->state == 0) {
                idle++;
            }
        }
    }
    if (idle != 0) {
        selected = -1;
        for (i = 0; i < count; i++) {
            slot = func_8008DC10(team, i);
            if (slot->state == 1 && (slot->flags & 0xF) == 0) {
                selected = i;
                level = slot->flags & 0xF0;
                break;
            }
        }
        if (selected != -1) {
            for (i = 0; i < count; i++) {
                if (i != selected) {
                    slot = func_8008DC10(team, i);
                    if (slot->state == 0 && (slot->flags & 0xF) == 0 && (slot->flags & 0xF0) < level) {
                        slot->flags = (slot->flags & 0xF0) | 1;
                        func_80036D84(i);
                        func_80036D84(i);
                        func_80036D84(i);
                        func_80036D84(i);
                        func_80036D84(i);
                        func_8008E444();
                    }
                    if (slot->state == 0 && (slot->flags & 0xF) == 0 && (slot->flags & 0xF0) == level) {
                        slot->flags = (slot->flags & 0xF0) | 1;
                    }
                }
            }
        } else {
            for (i = 0; i < count; i++) {
                slot = func_8008DC10(team, i);
                if ((slot->flags & 0xF) == 0) {
                    slot->flags = (slot->flags & 0xF) | 1;
                    func_80036D84(i);
                    func_80036D84(i);
                    func_80036D84(i);
                    func_80036D84(i);
                    func_80036D84(i);
                }
            }
        }
    }
    for (i = 0; i < count; i++) {
        slot = func_8008DC10(team, i);
        if (slot->state == 1 && (slot->flags & 0xF) == 0) {
            *out = *slot;
            D_8008934C = slot;
            break;
        }
    }
    return total - idle;
}
