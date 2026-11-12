#include "types.h"

typedef struct Entry {
    u8 pad0[8];
    struct EntryData *data;
} Entry;

typedef struct EntryData {
    u8 pad0[0x24];
    void *buffer;
    void *other_buffer;
    void *word_buffer;
} EntryData;

extern s32 D_800692AC;
extern void *D_80069298;
extern Entry *D_8007947C[];
extern void func_80032F3C(s32 pool, void *allocation);
extern void *func_80032E00(s32 pool, u32 size);
extern void func_80033308(s32 pool, void *destination, u32 size, s32 offset);
extern void func_8001B314(Entry *entry);

void func_8001AD78(void *source)
{
    s32 index = D_800692AC;
    void *saved_source = source;
    Entry **slot;
    Entry *entry;
    EntryData *data;
    u32 size;
    u32 original_size;
    s32 loop_index;
    s32 count;
    s32 offset;
    Entry **entries;
    s32 pool;

    D_80069298 = saved_source;
    if (index-- != 0) {
        entries = D_8007947C;
        offset = index * sizeof(*entries);
        slot = (Entry **)(offset + (u32)entries);
        do {
            entry = *slot;
            data = entry->data;
            loop_index = index;
            if (data->buffer != 0) {
                func_80032F3C(0, data->buffer);
                func_80032F3C(0, data->other_buffer);
                data->buffer = 0;
                data->other_buffer = 0;
            }
            if (saved_source != 0) {
                size = *(u32 *)saved_source;
                original_size = size;
                size++;
                data->buffer = func_80032E00(0, size);
                func_80033308(0, data->buffer, size, 0);
                pool = 0;
                size *= 4;
                data->word_buffer = func_80032E00(pool, size);
                func_80033308(0, data->word_buffer, size, 0);
                *(u32 *)data->word_buffer = original_size;
            }
            func_8001B314(entry);
            slot--;
            index--;
        } while (loop_index != 0);
    }
}
