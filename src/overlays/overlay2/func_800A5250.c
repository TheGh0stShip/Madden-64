#include "types.h"

typedef struct {
    s32 v[8];
} Kinds;

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
    s32 x00;
    s16 x04;
    s16 x06;
    s16 x08;
    s16 pad0A;
    s32 x0C;
} Text;

typedef struct {
    u8 pad00[8];
    s16 *x08;
} Font;

typedef struct {
    u8 pad00[8];
    Font *x08;
    u8 pad0C[0x10];
    s32 x1C;
    s32 x20;
} Sprite;

typedef struct {
    s32 count;
    s32 entries[0xB5];
} List;

typedef struct {
    u8 pad00[0x3C];
    Sprite *x3C;
    u8 pad40[0x20];
    Sprite **x60;
    Sprite **x64;
    u8 pad68[0xC];
    List list;
} Obj;

extern s16 D_800721FA;
extern Text D_80087A38;
extern s32 D_80087AA8;
extern s32 D_80088090;
extern s16 *D_8008870C;
extern s16 D_80088DB8[4];
extern s32 D_80089490[];
extern Kinds D_8008BACC;
extern s32 D_800BF28C[];
extern Font *D_800C5068;
extern Sprite *D_800C5CC8[4];
s32 func_8000C8A0(s32);
Sprite *func_8000D740(s32, s32, void *);
void func_80016FE4(Sprite *);
void func_80017010(Sprite *, s32);
void func_8002E17C(s16 *, s16 *, s32);
Sprite **func_80032E00(s32, s32);
void func_800D6424(Sprite *, s32, s32, s32);
void func_800DD694(s32, s32, s32);

void func_800A5250(Obj *obj) {
    Kinds kinds;
    Spec spec;
    Sprite **first;
    Sprite **second;
    Sprite *title;
    List *list;
    u16 i;

    kinds = D_8008BACC;
    first = func_80032E00(0, 0x20);
    second = func_80032E00(0, 0x20);
    obj->x60 = first;
    obj->x64 = second;
    list = &obj->list;
    obj->list.count = 0xB5;
    for (i = 0; i < 0xB4; i++) {
        list->entries[i] = 0;
    }
    list->entries[i] = 0;
    spec.kind = 0x188;
    spec.list = &obj->list;
    spec.x08 = 0;
    spec.x10 = 7;
    title = func_8000D740(D_80087AA8, 1, &spec);
    obj->x3C = title;
    spec.list = 0;
    spec.x08 = 0;
    spec.x10 = 5;
    for (i = 0; i < 8; i++) {
        spec.kind = kinds.v[i];
        first[i] = func_8000D740(func_8000C8A0(D_80088090), 1, &spec);
        spec.kind = D_800BF28C[i];
        second[i] = func_8000D740(func_8000C8A0(D_80088090), 1, &spec);
    }
    func_800DD694(0x48, 0x10, 8);
    D_80087A38.x00 = 0x91;
    D_80087A38.x0C = 0;
    D_80087A38.x04 = 0xA;
    if (D_80088DB8[0] != -1) {
        D_80087A38.x06 = 0x5A;
        D_80087A38.x08 = 0x49;
        D_800C5CC8[0] = func_8000D740(func_8000C8A0(D_80088090), 0, &D_80087A38);
        func_80017010(D_800C5CC8[0], 0xA);
        func_80016FE4(D_800C5CC8[0]);
        D_800C5068 = D_800C5CC8[0]->x08;
        D_800721FA = D_80088DB8[0] * 16 + 0x11;
        D_8008870C = D_800C5068->x08;
        func_8002E17C(D_8008870C + 1, D_8008870C + D_800721FA, 0x1E);
    }
    if (D_80088DB8[1] != -1) {
        D_80087A38.x06 = 0x43;
        D_80087A38.x08 = 0x49;
        D_800C5CC8[1] = func_8000D740(func_8000C8A0(D_80088090), 0, &D_80087A38);
        func_80017010(D_800C5CC8[1], 0xA);
        func_80016FE4(D_800C5CC8[1]);
        D_800C5068 = D_800C5CC8[1]->x08;
        D_800721FA = D_80088DB8[1] * 16 + 0x11;
        D_8008870C = D_800C5068->x08;
        func_8002E17C(D_8008870C + 1, D_8008870C + D_800721FA, 0x1E);
    }
    if (D_80088DB8[2] != -1) {
        D_80087A38.x06 = 0x2C;
        D_80087A38.x08 = 0x49;
        D_800C5CC8[2] = func_8000D740(func_8000C8A0(D_80088090), 0, &D_80087A38);
        func_80017010(D_800C5CC8[2], 0xA);
        func_80016FE4(D_800C5CC8[2]);
        D_800C5068 = D_800C5CC8[2]->x08;
        D_800721FA = D_80088DB8[2] * 16 + 0x11;
        D_8008870C = D_800C5068->x08;
        func_8002E17C(D_8008870C + 1, D_8008870C + D_800721FA, 0x1E);
    }
    if (D_80088DB8[3] != -1) {
        D_80087A38.x06 = 0x15;
        D_80087A38.x08 = 0x49;
        D_800C5CC8[3] = func_8000D740(func_8000C8A0(D_80088090), 0, &D_80087A38);
        func_80017010(D_800C5CC8[3], 0xA);
        func_80016FE4(D_800C5CC8[3]);
        D_800C5068 = D_800C5CC8[3]->x08;
        D_800721FA = D_80088DB8[3] * 16 + 0x11;
        D_8008870C = D_800C5068->x08;
        func_8002E17C(D_8008870C + 1, D_8008870C + D_800721FA, 0x1E);
    }
    for (i = 0; i < 4; i++) {
        if (D_80088DB8[i] != -1) {
            D_800C5CC8[i]->x1C = 0x14A;
            D_800C5CC8[i]->x20 = 0;
            func_800D6424(D_800C5CC8[i], 0, 1, 0xA);
        }
    }
    title->x1C = 0;
    title->x20 = 0x14A;
    func_800D6424(title, 0, 3, 0xA);
    for (i = 0; i < 8; i++) {
        first[i]->x1C = 0x14A;
        first[i]->x20 = 0x34;
        second[i]->x1C = 0x7A;
        second[i]->x20 = 0xFA;
    }
    i = 0;
    while (D_80089490[i] != -1) {
        func_800D6424(first[D_80089490[i]], 6, 1, 0xA);
        i++;
    }
}
