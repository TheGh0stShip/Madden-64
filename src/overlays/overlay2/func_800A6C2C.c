#include "types.h"

typedef struct {
    s16 kind;
    s16 pad02;
    void *list;
    s32 x08;
    s32 pad0C;
    s16 x10;
    s16 pad12;
} Spec;

typedef struct {
    s32 id;
    s16 x04;
    s16 x06;
    s16 x08;
    s16 pad0A;
    s32 x0C;
    s32 x10;
    s32 pad14[5];
} Request;

typedef struct {
    s32 *title;
    s32 pad04[2];
    s32 *text;
    s32 *yes;
    s32 *no;
    s32 mode;
    s32 pad1C;
} Dialog;

typedef struct {
    s32 v[6];
} Kinds;

typedef struct {
    s16 x;
    s16 y;
} Pos;

typedef struct {
    u8 pad00[0x1C];
    s32 x1C;
    s32 x20;
} Sprite;

typedef struct {
    u8 done;
    u8 mode;
    u8 pad02[6];
    Sprite *sprites[6];
} State;

typedef struct {
    u8 pad00[0x48];
    s32 x48;
    s32 pad4C;
    s32 x50;
    s32 x54;
    s32 x58;
} Menu;

typedef struct {
    u8 pad00[0x60];
    State *state;
    u8 pad64[0x10];
    u8 x74[1];
} Obj;

extern s32 D_80087AA8;
extern Kinds D_8008BB5C;
extern Kinds D_8008BB74;
extern Pos D_800BDFD4[];
extern s32 *D_800BF1B4[];
extern s32 D_800C0D88;
extern s32 D_800C0DA0;
extern s32 D_800C0DB4;
extern s32 D_800C0DC4;
extern s32 D_800C129C;
extern s32 D_800C12E8;
Sprite *func_8000D740(s32, s32, Spec *);
s32 func_8000D8DC(s32, Request *);
u16 func_80016FD4(void);
void func_80016FE4(s32);
void func_8003647C(u16, s32);
s32 func_80036540(s32);
void func_80092B98(void);
void func_800A7014(Obj *);
void func_800A73FC(Obj *, s32);
void func_800A7634(Obj *);
void func_800A76A4(Obj *);
s16 func_800D6454(Dialog *);
void func_800D67B8(Dialog *);
Menu *func_800DD634(void);

s32 func_800A6C2C(Obj *obj) {
    Spec spec;
    Request request;
    Kinds second;
    Kinds first;
    Dialog dialog;
    void *list;
    s32 *kinds;
    s32 count;
    State *state;
    Menu *menu;
    s32 result;
    u32 i;

    second = D_8008BB5C;
    first = D_8008BB74;
    kinds = 0;
    list = obj->x74;
    state = obj->state;
    count = 0;
    menu = func_800DD634();
    func_800D67B8(&dialog);
    dialog.title = &D_800C0D88;
    dialog.text = &D_800C0DA0;
    dialog.yes = &D_800C0DB4;
    dialog.no = &D_800C0DC4;
    dialog.mode = 0;
    result = func_800D6454(&dialog);
    D_800BF1B4[0] = &D_800C129C;
    if (result == 0) {
        state->mode = 1;
        kinds = first.v;
        count = 0x20;
    } else if (result == 1) {
        state->mode = 0;
        kinds = second.v;
        count = 0x47;
    } else if (result == 2) {
        state->mode = 2;
        D_800BF1B4[0] = &D_800C12E8;
    }
    if (result != -1) {
        if (result != 2) {
            spec.x08 = 0;
            spec.x10 = 8;
            spec.list = list;
            for (i = 0; i < 6; i++) {
                spec.x10 = 8;
                spec.kind = kinds[i];
                if (kinds[i] == 0xF0 || kinds[i] == 0xD0) {
                    spec.x10 = 5;
                }
                state->sprites[i] = func_8000D740(D_80087AA8, 1, &spec);
                state->sprites[i]->x1C = D_800BDFD4[i].x;
                state->sprites[i]->x20 = D_800BDFD4[i].y;
            }
            request.x0C = 0;
            request.x06 = 0;
            request.x08 = 0;
            request.x04 = 4;
            request.x10 = 0;
            func_8003647C(func_80016FD4(), count);
            while (func_80036540(1)) {
                func_80092B98();
            }
            request.id = count;
            menu->x54 = func_8000D8DC(0, &request);
            func_80016FE4(menu->x54);
            menu->x48 = 0;
            menu->x50 = 0;
            menu->x58 = menu->x54;
            func_800A7014(obj);
            func_800A73FC(obj, 1);
        } else {
            func_800A76A4(obj);
            func_800A7634(obj);
        }
    }
    if (result == -1) {
        state->done = 1;
    }
    return result;
}
