#include "types.h"

typedef struct {
    u16 kind;
    u8 unk_02[2];
    void *resource;
    s32 flags;
    u8 unk_0C[4];
    s16 value;
    u8 unk_12[6];
} Spec800D8C58;

typedef struct {
    u8 unk_00[0x10];
    u8 *unk_10;
} Data800D8C58;

typedef struct {
    u8 unk_00[8];
    Data800D8C58 *unk_08;
    u8 unk_0C[8];
    s32 unk_14;
    u8 unk_18[4];
    s32 unk_1C;
    s32 unk_20;
} Sprite800D8C58;

typedef union {
    u8 b[12];
    s32 w[3];
} Bytes800D8C58;

typedef struct {
    char *names[12];
} Names800D8C58;

typedef struct {
    u16 ids[12];
} Ids800D8C58;

typedef struct {
    u16 kinds[8];
} Kinds800D8C58;

typedef struct {
    char name[12][20];
    Bytes800D8C58 unk_F0;
    Sprite800D8C58 *unk_FC[12];
    u16 unk_12C[12];
} Panel800D8C58;

typedef struct {
    s32 count;
    void *items[181];
} List800D8C58;

typedef struct {
    u8 unk_00[0x3C];
    Sprite800D8C58 *unk_3C;
    Sprite800D8C58 *unk_40;
    u8 unk_44[0x1C];
    Panel800D8C58 *unk_60;
    u8 unk_64[0x10];
    List800D8C58 unk_74;
} Obj800D8C58;

typedef struct {
    u8 unk_00[0x1C];
    s32 unk_1C;
    s32 unk_20;
    u8 unk_24[0x1C];
    s32 unk_40[12];
} Cam800D8C58;

extern u8 D_80087974[];
extern s32 D_80087AA8;
typedef struct {
    s32 x;
    s32 z;
} Pos800D8C58;

extern Pos800D8C58 D_800892E0;
extern s32 D_800E6C30;
Sprite800D8C58 *func_8000D740(s32, s32, Spec800D8C58 *);
u16 func_8001FA38(u8);
void func_8001FA50(u16, u8);
void func_8002E65C(char *, char *);
Panel800D8C58 *func_80032E00(s32, s32);
void func_8003E460(void);
void func_80092B98(void);
void func_800D3C0C(u8 *, u16);
Cam800D8C58 *func_800DD634(void);
void func_800DD694(s32, s32, s32);
void overlay5_packed_event_dispatch(Sprite800D8C58 *, s32, s32, s32);

void func_800D8C58(Obj800D8C58 *arg0) {
    Spec800D8C58 spec;
    char *names[12] = {
        "ROUGHING PASSER", "ROUGHING KICKER", "PERSONAL FOUL", "FACE MASKING",
        "DEF. PASS INT.", "OFF. PASS INT.", "FAIR CATCH INT.", "PUNT CATCH INT.",
        "HOLDING", "FALSE START", "CLIPPING", "INT. GROUNDING",
    };
    u8 bytes[12] = { 0, 1, 2, 3, 4, 5, 0x10, 0x11, 6, 7, 8, 9 };
    u16 ids[12] = { 0x4D8, 0x4E0, 0x4E8, 0x4F0, 0x4F8, 0x500, 0x508, 0x510, 0x518, 0x520, 0x528, 0x530 };
    u16 kinds[8] = { 0xBC, 0xCD, 0xDD, 0xED, 0xFD, 0x10D, 0x11D, 0x12C };
    Sprite800D8C58 *first;
    Sprite800D8C58 *second;
    Panel800D8C58 *panel;
    Cam800D8C58 *cam;
    List800D8C58 *list;
    u32 i;

    panel = func_80032E00(0, 0x144);
    arg0->unk_60 = panel;
    panel->unk_F0 = *(Bytes800D8C58 *)bytes;
    if (D_800E6C30 != 2) {
        for (i = 0; i < 19; i++) {
            func_8001FA50(i, D_80087974[i]);
        }
    }
    list = &arg0->unk_74;
    list->count = 0xB5;
    for (i = 0; i < 0xB4; i++) {
        list->items[i] = 0;
    }
    list->items[i] = 0;
    spec.kind = 0x4C8;
    spec.resource = &arg0->unk_74;
    spec.flags = 0;
    spec.value = 7;
    first = func_8000D740(D_80087AA8, 1, &spec);
    arg0->unk_3C = first;
    first->unk_1C = 0;
    first->unk_20 = 0xFA;
    spec.kind = 0x4D0;
    spec.resource = &arg0->unk_74;
    spec.flags = 0;
    spec.value = 7;
    second = func_8000D740(D_80087AA8, 1, &spec);
    arg0->unk_40 = second;
    second->unk_1C = 0;
    second->unk_20 = 0xFA;
    spec.value = 4;
    for (i = 0; i < 12; i++) {
        func_8002E65C(panel->name[i], names[i]);
        list->items[i] = panel->name[i];
        panel->unk_12C[i] = func_8001FA38(panel->unk_F0.b[i]);
        spec.kind = ids[i];
        panel->unk_FC[i] = func_8000D740(D_80087AA8, 1, &spec);
        func_800D3C0C(panel->unk_FC[i]->unk_08->unk_10, kinds[panel->unk_12C[i]]);
        panel->unk_FC[i]->unk_1C = 0;
        panel->unk_FC[i]->unk_20 = 0xFA;
        if (panel->unk_12C[i] == 0) {
            panel->unk_FC[i]->unk_14 &= ~1;
        } else {
            panel->unk_FC[i]->unk_14 |= 1;
        }
        if (D_800E6C30 == 2) {
            func_8003E460();
        } else {
            func_80092B98();
        }
    }
    func_800DD694(2, 0xF, 6);
    cam = func_800DD634();
    for (i = 1; i < 12; i++) {
        cam->unk_40[i] = cam->unk_40[0];
    }
    cam->unk_1C = D_800892E0.x;
    cam->unk_20 = D_800892E0.z;
    overlay5_packed_event_dispatch(first, 0, 3, 10);
    for (i = 0; i < 12; i++) {
        overlay5_packed_event_dispatch(panel->unk_FC[i], 0, 3, 10);
    }
}
