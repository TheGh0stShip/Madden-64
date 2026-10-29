#include "types.h"

typedef struct {
    s16 type;
    void *unk04;
    s32 unk08;
    s32 unk0C;
    s16 mode;
} LoadRequest;

typedef struct {
    s32 unk00;
    s16 unk04;
    s16 unk06;
    s16 unk08;
    s32 unk0C;
    s32 unk10;
    u8 pad14[0x14];
} ObjConfig;

typedef struct {
    u8 pad00[0x14];
    s32 unk14;
    s32 unk18;
    u8 pad1C[0x28];
    s32 unk44;
    s32 unk48;
} Obj;

typedef struct {
    u8 pad00[0x20];
    s32 unk20;
} Model;

typedef struct {
    u8 pad00[8];
    s16 count;
    u8 pad0A[0x32];
    s32 *list;
    Obj *obj;
    Model *model;
    u8 pad48[8];
} Menu;

typedef struct {
    u8 pad00[0x24];
    Model *model;
    Menu *menu;
    s32 handle;
    s32 ids[31];
    s32 list[11];
} Data;

typedef struct {
    u8 pad00[0x60];
    Data *data;
} Screen;

extern s32 D_80087A64;
extern s32 D_800892E8[2];
extern u8 D_800C0DE8[];
extern Menu D_800C024C;

Obj *func_800DD634(void);
s32 func_8000D8DC(s32, ObjConfig *);
void func_80016FE4(s32);
void func_8003DDF8(void *, s32, s32 *, s32, s32);
Model *func_8000D740(s32, s32, LoadRequest *);
Menu *func_80032E00(s32, s32);
s32 func_800E06C4(s32, Menu *);
void func_800E08A4(s32);

void func_800A76A4(Screen *screen) {
    Data *data = screen->data;
    Obj *obj;
    LoadRequest request;
    ObjConfig config;
    Model *model;
    u32 i;

    obj = func_800DD634();
    config.unk00 = 0x7F;
    config.unk04 = 2;
    config.unk06 = 0;
    config.unk08 = 0;
    config.unk10 = 0;
    config.unk0C = 0;
    obj->unk48 = func_8000D8DC(0, &config);
    func_80016FE4(obj->unk48);
    config.unk00 = 0x80;
    obj->unk44 = func_8000D8DC(0, &config);
    func_80016FE4(obj->unk44);
    obj->unk14 = D_800892E8[0];
    obj->unk18 = D_800892E8[1];
    data->list[0] = 10;
    for (i = 1; i < 11; i++) {
        data->list[i] = 0;
    }
    data->ids[0] = 0x1E;
    func_8003DDF8(D_800C0DE8, 0, data->ids, 0xA8, 0);
    for (i = 1; i < 31; i++) {
        if (data->ids[i] == 0) {
            break;
        }
    }
    request.type = 0x6B0;
    request.unk04 = data->list;
    request.unk08 = 0;
    request.mode = 5;
    model = func_8000D740(D_80087A64, 1, &request);
    data->model = model;
    model->unk20 = 0xF0;
    data->menu = func_80032E00(0, 0x50);
    *data->menu = D_800C024C;
    data->menu->count = i - 1;
    data->menu->model = data->model;
    data->menu->list = data->list;
    data->menu->obj = func_800DD634();
    data->handle = func_800E06C4(1, data->menu);
    func_800E08A4(data->handle);
}
