#include "types.h"

typedef struct Overlay5RuntimeList {
    void *head;
    void *storage;
    u8 count;
} Overlay5RuntimeList;

extern Overlay5RuntimeList *D_80072468;

void func_80033258(void *storage);
void func_80032F3C(s32 mode, void *allocation);

void overlay5_runtime_list_destroy(void) {
    func_80033258(D_80072468->storage);
    func_80032F3C(0, D_80072468);
    D_80072468 = 0;
}
