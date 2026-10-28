#include "types.h"

typedef struct {
    u16 count;
    u16 *items;
} ItemList;

extern ItemList **D_80087958;
extern u16 D_8008AFC4;
extern s32 D_8008B06C;

ItemList *func_80033298(s32);
u16 *func_80032E00(s32, s32);

u16 func_8009AF9C(u16 count, u16 *items) {
    ItemList *list;
    u16 *dst;
    u16 i;

    list = func_80033298(D_8008B06C);
    list->count = count;
    dst = list->items = func_80032E00(0, count * 2);
    for (i = 0; i < count; i++) {
        dst[i] = *items++;
    }
    for (i = 0; i < D_8008AFC4; i++) {
        if (D_80087958[i] == 0) {
            D_80087958[i] = list;
            return i;
        }
    }
    return 0;
}
