#include "types.h"

typedef struct {
    s32 unk_00[2][3];
} Table;

typedef struct {
    u8 pad0[0x14];
    s32 unk_14;
    s32 unk_18;
    s32 unk_1C;
    s32 unk_20;
    u8 pad24[0x44 - 0x24];
    s32 unk_44;
} Camera;

typedef struct {
    u8 pad0[0x60];
    u8 unk_60;
    u8 unk_61;
} Team;

typedef struct {
    u8 pad0[0x2C];
    s32 unk_2C;
    s32 unk_30;
    s32 unk_34;
    u8 pad38[0x74 - 0x38];
    s32 unk_74[70];
} Obj;

typedef struct {
    s32 unk_00;
    s32 unk_04;
} Entry;

extern Table D_8008C244;
extern s32 D_800892D8[4];
extern u16 D_80084F40;
extern u16 D_800BDF0C;
extern u8 D_800BFDE0[];
extern Entry D_800C07C4[];
extern s16 D_800C3A1C;
extern s32 D_800C3A90[2][3][22];
extern s32 D_800C3CA0[];
extern s32 D_800C48B8[];
extern s16 D_800C5016;
extern u8 D_800C509E[];

Camera *func_800DD634(void);
void func_80016FE4(s32);
s16 func_80016FD4(void);
void func_80016FC4(u16);
Team *func_8003A7B8(u16);
s32 func_800D3FF4(s32, s32, Entry *, s32, s32);
void func_8008DA98(void);
void func_800D6060(s32, u8 *, Obj *);
void func_80017B80(s32);

void func_800B647C(void *arg0) {
    Table table = D_8008C244;
    Camera *cam;
    Team *team;
    s8 i;
    s32 *list;
    Obj *obj;

    cam = func_800DD634();
    obj = arg0;
    cam->unk_14 = D_800892D8[0];
    cam->unk_18 = D_800892D8[1];
    cam->unk_1C = D_800892D8[2];
    cam->unk_20 = D_800892D8[3];
    func_80016FE4(cam->unk_1C);
    func_80016FE4(cam->unk_20);
    list = obj->unk_74;
    D_800C3A1C = func_80016FD4();
    func_80016FC4(D_80084F40);
    D_800C5016 = D_800BDF0C;
    team = func_8003A7B8(D_800C5016);
    for (i = 0; i < 22; i++) {
        D_800C3CA0[i] = func_800D3FF4(0x02000011, 30, &D_800C07C4[i], 0, 0);
        D_800C3A90[0][0][i] = 0;
        D_800C3A90[0][1][i] = 0;
        D_800C3A90[0][2][i] = 0;
        D_800C3A90[1][0][i] = 0;
        D_800C3A90[1][1][i] = 0;
        D_800C3A90[1][2][i] = 0;
        D_800C3A90[team->unk_60][team->unk_61][i] =
            func_800D3FF4(table.unk_00[team->unk_60][team->unk_61] | 0x02000001, 30, &D_800C07C4[i], 0, 0);
    }
    for (i = 1; i < 70; i++) {
        list[i] = 0;
    }
    func_8008DA98();
    list[0] = 70;
    obj->unk_34 = 0x298;
    obj->unk_2C = 0;
    obj->unk_30 = 250;
    func_800D6060(0x450, D_800BFDE0, obj);
    cam->unk_44 = D_800C48B8[D_800C509E[D_800C5016]];
    func_80017B80(cam->unk_44);
    func_80016FE4(cam->unk_44);
}
