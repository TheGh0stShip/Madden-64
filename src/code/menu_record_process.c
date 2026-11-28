#include "types.h"
typedef struct { u32 word0; u32 word1; u32 word2; } __attribute__((packed)) MenuRecord;
typedef struct {
    u32 index : 7;
    u32 payload : 25;
} __attribute__((packed)) MenuEntry;
typedef union {
    void *pointer;
    MenuEntry *entry;
} MenuPointer;
extern u16 D_8006B9D8;
extern MenuRecord *D_8006B9DC;
u16 func_8002C304(u16 key);
u16 func_80028A58(u16 key);
void *func_8002C3FC(u16 key, s32 type);
void *func_8002C500(u16 key, s32 type);
void menu_record_process(u16 key, u16 source, u16 index) {
    MenuRecord *record;
    void *destination;
    void *entry;
    u32 base_index;
    if (D_8006B9D8 != 1) return;
    record = D_8006B9DC + func_8002C304(key);
    if (source != 0xFF) base_index = func_80028A58(source) * 0x37;
    else base_index = 0x672;
    {
        destination = (void *)((u8 *)D_8006B9DC +
            (((base_index & 0xFFFF) + index) * 12));
        *(MenuRecord *)destination = *record;
    }
    entry = func_8002C3FC(key, 0x24);
    if (entry != 0) {
        void *current;
        if (source != 0xFF) {
            destination = func_8002C500(source, 0x24);
            if (destination != 0) {
                __builtin_memcpy(destination, entry, 4);
                ((MenuEntry *)destination)->index = index;
            }
            current = entry;
        } else {
            current = entry;
        }
        ((MenuEntry *)current)->index = 0x7F;
    }
    entry = func_8002C3FC(key, 0x21);
    if (entry != 0) {
        void *current;
        if (source != 0xFF) {
            destination = func_8002C500(source, 0x21);
            if (destination != 0) {
                __builtin_memcpy(destination, entry, 4);
                ((MenuEntry *)destination)->index = index;
            }
            current = entry;
        } else {
            current = entry;
        }
        ((MenuEntry *)current)->index = 0x7F;
    }
}
