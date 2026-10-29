#include "types.h"

typedef struct {
    u8 id;
    u8 link;
    u8 unk2;
    u8 unk3;
    u8 flags;
    s8 state;
} Slot;

extern Slot D_800C50DA[][15];

Slot *func_8008DC10(s16 group, s16 index) {
    return &D_800C50DA[group][index];
}
