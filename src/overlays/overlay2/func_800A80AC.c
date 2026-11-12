#include "types.h"

typedef struct {
    u8 pad00[0x3C];
    void *unk3C;
    u8 pad40[0x24];
    char text[2];
    u8 pad66[0x12];
    char *text_ptr;
} Object;

void func_8001EC20(void *, s32);

void func_800A80AC(Object *object, s32 unused, s32 letter) {
    object->text_ptr = object->text;
    object->text[0] = letter + 0x41;
    object->text[1] = 0;
    func_8001EC20(object->unk3C, 1);
}
