#include "types.h"

typedef struct Overlay2ObjectAB810 {
    u8 pad00[0x60];
    void *field60;
    void *field64;
    void *field68;
} Overlay2ObjectAB810;

typedef struct Overlay2RuntimeAB810 {
    u8 pad00[0x14];
    s32 field14;
    s32 field18;
    s32 field1C;
    s32 field20;
    u8 pad24[0x20];
    void *field44;
} Overlay2RuntimeAB810;

extern s16 D_800892B4;
extern s16 D_800BDF0C;
extern u16 D_800C3A1C;
extern s16 D_800C5016;

void func_80032F3C(s32 arena, void *allocation);
Overlay2RuntimeAB810 *func_800DD634(void);
void func_80017C24(void *value);
void func_800D628C(Overlay2ObjectAB810 *object);
void func_80016FC4(u16 value);

void func_800AB810(Overlay2ObjectAB810 *object) {
    Overlay2RuntimeAB810 *runtime;
    void *value;

    D_800892B4 = D_800C5016;
    func_80032F3C(0, *(void * volatile *)&object->field60);
    func_80032F3C(0, object->field64);
    func_80032F3C(0, object->field68);

    runtime = func_800DD634();
    value = runtime->field44;
    runtime->field44 = 0;
    runtime->field14 = 0;
    runtime->field18 = 0;
    runtime->field1C = 0;
    runtime->field20 = 0;
    func_80017C24(value);

    func_800D628C(object);
    func_80016FC4(D_800C3A1C);
    D_800BDF0C = D_800C5016 % 30;
}
