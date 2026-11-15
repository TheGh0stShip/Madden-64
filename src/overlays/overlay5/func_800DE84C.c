#include "types.h"

typedef struct ResourceListDE84C {
    void **items;
    u8 pad04[0xE];
    s8 last_index;
} ResourceListDE84C;

extern ResourceListDE84C *D_80072380;

void func_800DE84C(void *resource) {
    ResourceListDE84C *list;
    ResourceListDE84C *inner_list;
    u8 i;
    u8 j;

    list = D_80072380;
    if (list->last_index >= 0) {
        i = 0;
        do {
            inner_list = list;
            if (list->items[i] == resource) {
                for (j = i; j < inner_list->last_index; j++) {
                    inner_list->items[j] = inner_list->items[j + 1];
                }
                D_80072380->last_index--;
            }
            list = D_80072380;
            i++;
        } while (list->last_index >= i);
    }
}
