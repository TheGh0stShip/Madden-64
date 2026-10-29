#include "types.h"

typedef struct {
    u16 *slots;
} SlotList;

typedef struct {
    u8 mode;
    u8 pad1[7];
    SlotList *list;
} Context;

typedef struct {
    u8 pad0[0x60];
    Context *context;
} Widget;

typedef struct {
    u16 slot[55];
} TeamSlots;

extern TeamSlots D_80080CFC;
extern char D_8006BFA0[];
extern char D_800C32D8[];

u16 func_8003A1D0(void);
char *func_8003AA28(u16);
u16 func_800AF1D4(s32);
void func_8002E65C(char *, char *);

void func_800B48E4(u16 index, char *buf, Widget *widget) {
    Context *ctx = widget->context;

    switch (ctx->mode) {
        case 0:
            if (func_8003A1D0() != 0) {
                if (index < func_8003A1D0()) {
                    func_8002E65C(buf, func_8003AA28(ctx->list->slots[index]));
                } else {
                    func_8002E65C(buf, D_8006BFA0);
                }
            } else if (index != 0) {
                func_8002E65C(buf, D_8006BFA0);
            } else {
                func_8002E65C(buf, D_800C32D8);
            }
            break;
        case 1:
            if (index < func_800AF1D4(0)) {
                func_8002E65C(buf, func_8003AA28(D_80080CFC.slot[index]));
            } else {
                func_8002E65C(buf, D_8006BFA0);
            }
            break;
    }
}
