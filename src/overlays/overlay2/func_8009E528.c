#include "types.h"

typedef struct { u8 pad00[0x14]; s32 flags; } Sprite;
typedef struct { u8 pad00[0xC]; void *panel; } Group;
typedef struct {
    u8 pad00[0x24];
    Group *group;
    u8 pad28[0x10];
    Sprite *x38;
} Obj;

extern char D_800026A4[];
extern s8 D_800724F8;
extern s32 D_80072500;
extern s32 D_80072558;
void func_8009E70C(Sprite *, s32, Obj *);
void func_800DF72C(void);
void func_8009E7CC(Obj *);
s16 func_8009DFE0(char *);
void func_800DD514(s32 *);
void func_800DE84C(s32 *);
void func_800DB478(void *);
u16 func_80028224(void);
void func_80024F5C(void);
void func_8003A600(s32, s32);
void func_800DD4B8(void);
void func_800D63B4(Obj *);

void func_8009E528(Obj *obj, s32 arg1, s16 event) {
    void *panel = obj->group->panel;

    switch (event) {
    case 13:
        func_8009E70C(obj->x38, 0, obj);
        obj->x38->flags |= 1;
        break;
    case 8:
        func_800DF72C();
        func_8009E7CC(obj);
        func_800DF72C();
        break;
    case 28:
        func_800DF72C();
        if (func_8009DFE0(D_800026A4) == 1) {
            D_800724F8 = 1;
            func_800DD514(&D_80072558);
            func_800DE84C(&D_80072500);
        } else {
            D_800724F8 = 0;
            func_800DB478(panel);
        }
        break;
    case 17:
        func_800DF72C();
        if (func_80028224() != 3) {
            func_80024F5C();
        }
        func_8003A600(0, 1);
        func_800DD4B8();
        break;
    case 12:
        func_800D63B4(obj);
        break;
    }
}
