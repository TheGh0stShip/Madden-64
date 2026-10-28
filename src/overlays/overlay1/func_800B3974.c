#include "types.h"

typedef struct {
    s32 data;
    s16 type;
    s16 unk06;
    s16 unk08;
    s32 size;
    u8 pad10[0x18];
} LoadRequest;

extern s8 D_8006EA71;
extern s32 D_80084FB0;
extern u16 D_80088472;
extern s32 D_8008AFA8;

s32 func_8000D8DC(s32, LoadRequest *);
void func_80016FC4(u16);
s32 func_80016FD4(void);
s32 func_80032E00(s32, s32);
void func_800363F4(u16, s32, s32);

void func_800B3974(void) {
    LoadRequest request;
    s32 *buffer;
    s32 saved;

    D_8006EA71 = 1;
    saved = func_80016FD4();
    func_80016FC4(D_80088472);
    request.type = 2;
    request.unk08 = 0;
    request.unk06 = 0;
    request.size = 0x2000;
    buffer = &D_80084FB0;
    *buffer = func_80032E00(0, 0x2000);
    func_800363F4(D_80088472, 1, *buffer);
    request.data = *buffer;
    D_8008AFA8 = func_8000D8DC(0, &request);
    func_80016FC4(saved);
}
