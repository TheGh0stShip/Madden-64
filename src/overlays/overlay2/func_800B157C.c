#include "types.h"

typedef struct {
    u16 unk0;
    u16 slot;
} ListEntry;

typedef struct {
    u8 pad0[8];
    u16 count;
    u8 padA[6];
    ListEntry *entries;
} List;

typedef struct {
    u8 pad0[0x60];
    List *list;
} Widget;

extern u8 D_80080D6A[];
extern char D_8006BFA0[];
extern char *D_800E6B78[];

void func_8002E65C(char *, char *);
void func_800AFA50(u8 *, u16, char *, u16);

void func_800B157C(u32 index, s32 field, char *buf, Widget *widget) {
    u32 mode;
    u32 nonzero;
    List *list;
    u16 slot;
    u8 *player;

    list = widget->list;
    if (index < list->count) {
        slot = list->entries[index].slot;
        player = &D_80080D6A[slot * 0x28];
        switch (field) {
            case 0:
                func_8002E65C(buf, D_800E6B78[player[0xE] & 0x3F]);
                return;
            case 1:
                func_8002E65C(buf, (char *)player);
                return;
            default:
                mode = field - 2;
                mode &= 0xFFFF;
                nonzero = mode != 0;
                mode += nonzero;
                func_800AFA50(D_80080D6A, slot, buf, mode);
                return;
        }
    }
    func_8002E65C(buf, D_8006BFA0);
}
