#include "types.h"

typedef struct {
    u8 pad00[0x50];
    u8 parts[5];
} Tally;

typedef struct {
    u8 text[6];
} Label;

extern Tally *D_800895EC;
extern Label D_800E7BE0[];
extern void *D_80087780[];

void func_800167FC(u8, Label *);
void func_8001EC20(s32, u16);

void func_800BA9FC(u16 part, u16 slot, s32 cb) {
    Label *label = &D_800E7BE0[part];

    func_800167FC(D_800895EC->parts[part], label);
    D_80087780[slot] = label;
    if (cb != 0) {
        func_8001EC20(cb, slot);
    }
}
