#include "types.h"

typedef struct AudioVectorsObject {
    u8 pad00[0x24];
    void *vectors[9];
} AudioVectorsObject;

extern void func_80040A44(void *object, void *source, void *destination);
extern void func_80040C04(void *object, void *source, void *destination);
extern void func_80040D0C(void *object, void *source, void *destination);

void audio_vectors_transform(AudioVectorsObject *object, u8 *destination, u8 *source)
{
    if (object->vectors[0]) func_80040A44(object->vectors[0], source, destination);
    if (object->vectors[1]) func_80040A44(object->vectors[1], source + 4, destination + 4);
    if (object->vectors[2]) func_80040A44(object->vectors[2], source + 8, destination + 8);
    if (object->vectors[3]) func_80040C04(object->vectors[3], source + 12, destination + 12);
    if (object->vectors[4]) func_80040C04(object->vectors[4], source + 16, destination + 16);
    if (object->vectors[5]) func_80040C04(object->vectors[5], source + 20, destination + 20);
    if (object->vectors[6]) func_80040D0C(object->vectors[6], source + 24, destination + 24);
    if (object->vectors[7]) func_80040D0C(object->vectors[7], source + 28, destination + 28);
    if (object->vectors[8]) func_80040D0C(object->vectors[8], source + 32, destination + 32);
}
