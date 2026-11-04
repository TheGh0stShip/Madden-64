#include "types.h"

typedef struct RequestD67EC {
    s16 count;
    u8 pad02[2];
    s32 *values;
    s32 field08;
    u8 pad0C[4];
    s16 field10;
} RequestD67EC;

extern void *D_80087AA8;
extern void *D_8008931C;
extern u8 D_80072470;

extern void func_8003CE88(s32, s32, s32);
extern void func_8003DDF8(void *object, void *data, s32 *values, s32 count, s32 zero);
extern void *func_8000D740(void *owner, s32 count, RequestD67EC *request);
extern void func_80030C74(s32 *status);
extern void func_8003E460(void);
extern void func_80092B98(void);
extern void func_8000D874(void *owner, void *resource);
extern void func_8000D834(void *owner, void *resource);
extern void func_8003E23C(s32 *values);

void func_800D67EC(void *object, s16 mode) {
    s32 values[10];
    RequestD67EC request;
    s32 status;
    void *resource;
    s32 type;
    s32 check;
    s32 one;
    u16 i;

    check = mode;
    one = 1;
    do {
        type = 0x23;
        if (check == one) {
            type = 0x29;
        }
    } while (0);
    func_8003CE88(type, 0x69, 0x10);
    values[0] = 9;
    for (i = 1; i < 10; i++) {
        values[i] = 0;
    }
    func_8003DDF8(object, &D_80072470, values, 0x96, 0);
    request.count = 8;
    request.values = values;
    request.field08 = 0;
    request.field10 = 2;
    resource = func_8000D740(D_80087AA8, 1, &request);
    func_80030C74(&status);
    while (status & 2) {
        if (mode == 1) {
            func_8003E460();
        } else {
            func_80092B98();
        }
        func_80030C74(&status);
    }
    type = 0x23;
    if (mode == 1) {
        type = 0x29;
    }
    func_8003CE88(type, 0x69, 0x10);
    func_8000D874(D_80087AA8, resource);
    func_8000D834(D_8008931C, resource);
    func_8003E23C(values);
}
