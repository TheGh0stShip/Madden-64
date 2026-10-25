#include "types.h"

typedef struct SourceValues {
    s32 words[3];
    s32 shorts[3];
} SourceValues;

typedef struct ShortValues {
    s16 values[3];
} ShortValues;

typedef struct WordValues {
    s32 values[3];
} WordValues;

extern void func_8000C9AC(void* object, ShortValues* values);
extern void func_8000CA20(void* object, WordValues* values);

void func_800408C8(void* object, SourceValues* source) {
    ShortValues short_values;
    WordValues word_values;

    word_values.values[0] = source->words[0];
    word_values.values[1] = source->words[1];
    word_values.values[2] = source->words[2];
    short_values.values[0] = source->shorts[0];
    short_values.values[1] = source->shorts[1];
    short_values.values[2] = source->shorts[2];
    func_8000C9AC(object, &short_values);
    func_8000CA20(object, &word_values);
}
