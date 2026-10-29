#include "types.h"

typedef struct RuntimeCallbackEntry {
    u8 pad0[0xC];
    void (*update)(void* object);
} RuntimeCallbackEntry;
typedef struct RuntimeCallbackTable { RuntimeCallbackEntry* entries; } RuntimeCallbackTable;
typedef struct RuntimeCallbackObject { u8 pad0[8]; u8 type; } RuntimeCallbackObject;

extern RuntimeCallbackTable* D_80072460;

void func_800E0860(RuntimeCallbackObject* object) {
    void (*callback)(void*);

    callback = D_80072460->entries[object->type].update;
    if (callback != 0) {
        callback(object);
    }
}
