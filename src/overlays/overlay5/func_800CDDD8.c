#include "types.h"

typedef struct StateCDDD8 {
    u8 pad00[0x14];
    void *handles[4];
    u8 pad24[0x20];
    s32 field44;
} StateCDDD8;

typedef struct ObjectCDDD8 {
    u8 pad00[0x60];
    void **resources;
} ObjectCDDD8;

extern void *D_80088090;
extern void *D_8008931C;
extern void *D_8007A2D0;
extern void *D_8007A2D4;
extern void *D_8007A2D8;
extern void *D_8007A2DC[11];
extern void *D_800879AC;
extern void *D_800854A0;
extern void *D_80082DC8;
extern void *D_80084F14;
extern u8 D_80086A08;
extern u8 D_800878F0;
extern void *D_80086E84[10];

extern StateCDDD8 *func_800DD634(void);
extern void *func_8000C8A0(void *owner);
extern void func_8000D874(void *owner, void *resource);
extern void func_8000D834(void *owner, void *resource);
extern void func_80016FF4(void *handle);
extern void func_8003E460(void);
extern void func_80016FE4(void *handle);
extern void func_80017010(void *handle, s32 value);
extern void func_800DB1F8(void *object);
extern void func_80032F3C(s32 pool, void *memory);

void func_800CDDD8(ObjectCDDD8 *object) {
    StateCDDD8 *state;
    void **resources;
    void *owner;
    u32 i;

    state = func_800DD634();
    owner = func_8000C8A0(D_80088090);
    func_8000D874(owner, D_8007A2D0);
    owner = func_8000C8A0(D_80088090);
    func_8000D874(owner, D_8007A2D4);
    owner = func_8000C8A0(D_80088090);
    func_8000D874(owner, D_8007A2D8);
    func_8000D834(D_8008931C, D_8007A2D0);
    func_8000D834(D_8008931C, D_8007A2D4);
    func_8000D834(D_8008931C, D_8007A2D8);
    for (i = 0; i < 11; i++) {
        owner = func_8000C8A0(D_80088090);
        func_8000D874(owner, D_8007A2DC[i]);
        func_8000D834(D_8008931C, D_8007A2DC[i]);
    }
    func_80016FF4(state->handles[0]);
    func_80016FF4(state->handles[1]);
    func_80016FF4(state->handles[2]);
    func_80016FF4(state->handles[3]);
    state->handles[0] = 0;
    state->handles[1] = 0;
    state->handles[2] = 0;
    state->handles[3] = 0;
    state->field44 = 0;
    func_8003E460();
    func_80016FE4(D_800879AC);
    func_80016FE4(D_800854A0);
    func_80017010(D_80082DC8, 1);
    func_80017010(D_80084F14, 1);
    func_800DB1F8(&D_80086A08);
    func_800DB1F8(&D_800878F0);
    resources = object->resources;
    for (i = 0; i < 10; i++) {
        func_8000D834(D_8008931C, resources[i]);
        D_80086E84[i] = 0;
    }
    func_80032F3C(0, resources);
}
