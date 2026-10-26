#include "types.h"

typedef struct DisplayRecord {
    u8 pad00[0x14];
    u32 slot;
    void *resource;
    u8 pad1C[4];
    void *third;
    void *first;
    void *second;
    void *fourth;
} DisplayRecord;

typedef struct DisplayOwner {
    u8 pad00[8];
    DisplayRecord *record;
} DisplayOwner;

extern s32 D_800692AC;
extern DisplayOwner *D_8007947C[];
extern void func_8000D684(void *resource);
extern void func_8001B410(DisplayOwner *owner, DisplayRecord *record);
extern void func_80032F3C(s32 pool, void *allocation);

void display_record_release(DisplayOwner *owner)
{
    register DisplayOwner *saved_owner __asm__("$16") = owner;
    register DisplayRecord *record __asm__("$17") = owner->record;
    s32 last = D_800692AC - 1;
    DisplayOwner *moved;

    D_8007947C[record->slot] = D_8007947C[last];
    moved = D_8007947C[last];
    moved->record->slot = record->slot;
    D_800692AC = last;
    func_8000D684(record->resource);
    func_8001B410(saved_owner, record);
    if (record->first != 0) {
        func_80032F3C(0, record->first);
        func_80032F3C(0, record->second);
    }
    if (record->third != 0) {
        func_80032F3C(0, record->third);
        func_80032F3C(0, record->fourth);
    }
}
