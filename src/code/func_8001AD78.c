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
    register s32 index __asm__("$19") = D_800692AC;
    register void *saved_source __asm__("$22") = source;
    register Entry **slot __asm__("$20");
    register Entry *entry __asm__("$21");
    register EntryData *data __asm__("$18");
    register u32 size __asm__("$16");
    register u32 original_size __asm__("$17");
    register s32 loop_index __asm__("$23");
    register s32 count __asm__("$2");
    register s32 offset __asm__("$2");
    register Entry **entries __asm__("$3");
    register s32 pool __asm__("$4");

    D_80069298 = saved_source;
    count = index;
    __asm__("" : "=r"(count) : "0"(count));
    if (count != 0) {
        index--;
        entries = D_8007947C;
        __asm__("" : "=r"(entries) : "0"(entries));
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
                __asm__("" : "=r"(pool) : "0"(pool));
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
