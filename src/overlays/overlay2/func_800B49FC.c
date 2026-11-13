#include "types.h"

typedef struct {
    u16* slots;
} SlotList;

typedef struct {
    u8 mode;
    u8 pad1[7];
    SlotList* list;
} Context;

typedef struct {
    u8 pad0[0x60];
    Context* context;
} Widget;

typedef struct {
    u16 slot[55];
} TeamSlots;

extern TeamSlots D_80080CFC;
extern void* D_800E6B78[];
extern char D_8006BFA0[];

extern u16 func_8003A1D0(void);
extern u8* func_8003AA28(u16);
extern u16 func_800AF1D4(s32);
extern void func_8002E65C(void*, void*);

void func_800B49FC(u16 index, void* buf, Widget* widget) {
    Context* ctx = widget->context;
    u8* source;

    switch (ctx->mode) {
        case 0:
            if (index < func_8003A1D0()) {
                source = func_8003AA28(ctx->list->slots[index]);
                func_8002E65C(buf, D_800E6B78[source[0xE] & 0x3F]);
            } else {
                func_8002E65C(buf, D_8006BFA0);
            }
            break;
        case 1:
            if (index < func_800AF1D4(0)) {
                source = func_8003AA28(D_80080CFC.slot[index]);
                func_8002E65C(buf, D_800E6B78[source[0xE] & 0x3F]);
            } else {
                func_8002E65C(buf, D_8006BFA0);
            }
            break;
    }
}
