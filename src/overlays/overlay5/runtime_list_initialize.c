#include "types.h"

typedef struct Overlay5RuntimeList {
    void *head;
    void *storage;
    u8 count;
} Overlay5RuntimeList;

extern Overlay5RuntimeList *D_80072468;

void *func_80032E00(s32 mode, s32 size);
void *func_80033174(s32 mode, s32 count, s32 element_size);

void overlay5_runtime_list_initialize(void) {
    D_80072468 = func_80032E00(0, 0xC);
    D_80072468->storage = func_80033174(0, 0x14, 0x18);
    D_80072468->head = 0;
    D_80072468->count = 0;
}
