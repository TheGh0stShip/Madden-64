#include "types.h"

typedef struct StateDC978 {
    void *field00;
    void *config;
    u8 pad08[4];
    void *buffer0C;
    u8 enabled10;
    u8 pad11;
    s8 field12;
    u8 field13;
    void *field14;
    u8 pad18[0x48];
    u8 count60;
    u8 pad61[3];
    s32 *array64;
    void *field68;
    void *field6C;
    void *owner70;
    void *field74;
    void *field78;
    void *field7C;
    void *field80;
    void *field84;
    void *field88;
    void *field8C;
    void *field90;
    void *field94;
    s32 field98;
    u8 pad9C[4];
    s32 fieldA0;
} StateDC978;

extern StateDC978 *D_80072380;

extern void func_8003190C(u32 value);
extern void *func_80032E00(s32 pool, s32 size);
extern void *func_800E0188(void);
extern void func_800E0B68(void);
extern void *func_8000C8A0(void *owner);
extern void *func_8000D5BC(s32, s32, s32);
extern void *func_8000B6F8(s32, s32);
extern void func_8000C940(void *object, s32, s32);
extern void func_8000C964(void *object, s32 width, s32 height);
extern void func_8000C8AC(void *object);
extern void func_8000C898(void *object, void *other);
extern void func_800DD5E8(void *buffer, s32 size);
extern void func_8002E58C(void *destination, s32 value, s32 size);
extern void *func_8001AEA8(void *array);

void func_800DC978(void *owner, u8 *config, s32 extra) {
    StateDC978 *settings;

    func_8003190C(0xD00F);
    D_80072380 = func_80032E00(0, 0xA4);
    D_80072380->field14 = func_800E0188();
    func_800E0B68();
    D_80072380->field00 = func_80032E00(0, 0x28);
    D_80072380->buffer0C = func_80032E00(0, 0x800);
    D_80072380->config = config;
    D_80072380->enabled10 = 1;
    D_80072380->field12 = -1;
    D_80072380->field78 = 0;
    D_80072380->field7C = 0;
    D_80072380->field80 = 0;
    D_80072380->field84 = 0;
    D_80072380->field90 = 0;
    D_80072380->field88 = 0;
    D_80072380->field8C = 0;
    D_80072380->field94 = 0;
    D_80072380->field13 = config[0x1A];
    settings = D_80072380;
    settings->count60 = 0x10;
    settings->field98 = 0;
    settings->fieldA0 = 0;
    D_80072380->array64 = 0;
    D_80072380->owner70 = func_8000C8A0(owner);
    D_80072380->field74 = func_8000D5BC(0, 0, 0);
    D_80072380->field6C = func_8000B6F8(0xE, 4);
    func_8000C940(D_80072380->field6C, 0, 0);
    func_8000C964(D_80072380->field6C, 0x140, 0xF0);
    func_8000C8AC(D_80072380->field6C);
    func_8000C898(D_80072380->field6C, D_80072380->field74);
    func_800DD5E8(D_80072380->buffer0C, 0x800);
    D_80072380->count60 += extra;
    D_80072380->array64 = func_80032E00(0, (D_80072380->count60 + 2) * 4);
    func_8002E58C(D_80072380->array64, 0, (D_80072380->count60 + 2) * 4);
    D_80072380->array64[0] = D_80072380->count60 + 1;
    D_80072380->field68 = func_8001AEA8(D_80072380->array64);
}
