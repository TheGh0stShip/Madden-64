#include "types.h"

typedef struct {
    u8 pad00[8];
    s16 x08;
} Record;

typedef struct {
    u8 pad00[0xC];
    Record *record;
} Holder;

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Sprite;

typedef struct {
    u8 pad00[0x24];
    Holder *holder;
    u8 pad28[0x10];
    Sprite *x38;
    s32 x3C;
    u8 pad40[0x18];
    s32 x58;
} Obj;

extern u16 D_8006B9E4[];
extern s32 D_800E6C34;

u16 func_80028A58(u32 identifier);
void overlay5_resource_coordinate_initialize(Sprite *, s32, Obj *);
void overlay5_record_extents_get(Record *, s32 *, s32 *, s32 *);
void func_800DA6B4(u16, Obj *);
void overlay5_resource_mode_notify(void);
void func_800DB0AC(Record *, s32, s32);
s16 func_800DA848(Obj *);
void func_800DB478(Record *);
void func_800D63B4(Obj *);
void overlay5_packed_event_dispatch(s32, s32, s32, s32);
void func_800DF72C(void);
void overlay5_runtime_stack_advance(void);

void func_800DA3AC(Obj *obj, s32 arg1, s16 event) {
    Record *record = obj->holder->record;
    s32 x;
    s32 y;
    s32 z;
    u16 index;

    switch (event) {
    case 13:
        overlay5_resource_coordinate_initialize(obj->x38, 0, obj);
        obj->x38->flags |= 1;
        break;
    case 19:
    case 20:
        overlay5_record_extents_get(record, &x, &y, &z);
        func_800DA6B4(y, obj);
        break;
    case 2:
        overlay5_resource_mode_notify();
        if (D_800E6C34 == 1) {
            index = func_80028A58((u16)obj->x58);
            if (index == 0) {
                index = 29;
            } else {
                index--;
            }
            obj->x58 = D_8006B9E4[index];
        } else {
            obj->x58 ^= 1;
        }
        func_800DB0AC(record, 0, 0);
        record->x08 = func_800DA848(obj);
        overlay5_record_extents_get(record, &x, &y, &z);
        func_800DA6B4(y, obj);
        func_800DB478(record);
        break;
    case 3:
        overlay5_resource_mode_notify();
        if (D_800E6C34 == 1) {
            index = func_80028A58((u16)obj->x58);
            if (index >= 29) {
                index = 0;
            } else {
                index++;
            }
            obj->x58 = D_8006B9E4[index];
        } else {
            obj->x58 ^= 1;
        }
        func_800DB0AC(record, 0, 0);
        record->x08 = func_800DA848(obj);
        overlay5_record_extents_get(record, &x, &y, &z);
        func_800DA6B4(y, obj);
        func_800DB478(record);
        break;
    case 12:
        func_800D63B4(obj);
        overlay5_packed_event_dispatch(obj->x3C, 0x14A, 0, 10);
        break;
    case 8:
    case 28:
        func_800DF72C();
        overlay5_runtime_stack_advance();
        break;
    }
}
