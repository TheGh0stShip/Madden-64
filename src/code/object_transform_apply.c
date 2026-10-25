#include "types.h"

typedef struct TransformObject {
    u8 pad[0x1C];
    s32 position[3];
} TransformObject;

extern void func_8000EC8C(TransformObject* object, s16* values);
extern void func_8000ECE4(TransformObject* object, s32* values);

void func_800409B8(TransformObject* object, s32* source) {
    s16 short_values[3];
    s32 word_values[3];

    object->position[0] = source[0];
    object->position[1] = source[1];
    object->position[2] = source[2];
    short_values[0] = source[3];
    short_values[1] = source[4];
    short_values[2] = source[5];
    func_8000EC8C(object, short_values);
    word_values[0] = source[6];
    word_values[1] = source[7];
    word_values[2] = source[8];
    func_8000ECE4(object, word_values);
}
