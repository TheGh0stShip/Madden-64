#include "types.h"

typedef struct ObjectD192C {
    void* field0;
    void* field4;
    void* field8;
    void* fieldC;
    void* handles[2];
    void* field18;
    u8 pad1C[0x107];
    u8 count;
    u8 pad124[8];
    void* items[1];
} ObjectD192C;

extern void* D_80088090;
extern void* D_80086E44;
extern void* D_80086E48;
extern void* D_80086E64;
extern void* D_80087A64;
extern void* D_8008B36C;
extern u8 D_800A3164[];
extern u8 D_80086CE8[];
extern void func_8000BE80(void);
extern void* func_8000C8A0(void*);
extern void func_8000D998(void*, void*);
extern void func_8001AEA8(void*);
extern void func_80016FF4(void*);
extern void func_8000DA98(void*);
extern void func_8000CB78(void*, void*, void*);
extern void func_800A2DB8(void*);
extern void func_800A2D44(void*);
extern void func_80032F3C(s32, void*);
extern void func_800D1AB4(s32, s32);
extern void func_8000D834(void*, void*);
extern void func_800B49CC(void);

void func_800D192C(ObjectD192C* object) {
    void* context;
    u32 i;
    volatile f64 scratch;

    func_8000BE80();
    context = func_8000C8A0(D_80088090);
    func_8000D998(context, object->field4);
    func_8000D998(context, object->field8);
    func_8000D998(context, object->fieldC);
    func_8001AEA8(object->field18);
    func_80016FF4(D_80086E44);
    func_80016FF4(D_80086E48);
    func_80016FF4(D_80086E64);
    for (i = 0; i < 2; i++) {
        func_8000DA98(object->handles[i]);
    }
    func_8000DA98(D_80086E64);
    i = 0;
    if (object->count != 0) {
        do {
            func_8000D998(D_80087A64, object->items[i]);
            i++;
        } while (i < object->count);
    }
    func_8000CB78(D_80088090, D_800A3164, D_80086CE8);
    func_800A2DB8(object->field0);
    func_800A2D44(D_80086CE8);
    func_80032F3C(0, object->field0);
    func_800D1AB4(1, 1);
    func_8000D834(D_80087A64, D_8008B36C);
    func_800B49CC();
    func_80032F3C(0, object);
}
