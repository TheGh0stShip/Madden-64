#include "types.h"

typedef struct { s32 ids[200]; s16 count; } Roster;
typedef struct { u8 pad00[8]; s16 x08; u8 pad0A[0x3A]; s32 x44; } Panel;
typedef struct { u8 pad00[0xC]; Panel *panel; } Group;
typedef struct { u8 pad00[0x14]; s32 flags; } Flags;
typedef struct { u8 pad00[0xC]; void *next; } Level2;
typedef struct { u8 pad00[0xC]; Level2 *next; u8 pad10[0x19]; u8 kind; } Level1;
typedef struct { u8 pad00[0xC]; Level1 *next; } Root;
typedef struct {
    Root *root;
    u8 pad04[0xC];
    Flags *runtime;
    u8 pad14[0x10];
    Group *group;
    u8 pad28[0x10];
    Flags *unk_38;
    u8 pad3C[0x3C];
    u8 *unk_78[6];
    void *unk_90;
    void *unk_94;
    u8 pad98[0xBC];
    s32 unk_154;
    void *unk_158;
} Obj;
typedef struct { u8 pad00[0x30]; s32 unk_30; u8 pad34[0x1C]; void *unk_50; } Game;
typedef struct { u8 pad00[0x44]; s32 unk_44; void *unk_48; } State;
typedef struct { s32 unk_0; u8 *text; } Entry;
typedef struct { u8 pad00[0xC]; Entry entries[1]; } Table;

extern u16 D_8006B9E0;
extern u16 D_8006B9E4[];
extern u8 D_80071A28[];
extern u8 D_80080C90[];
extern Game *D_80087938;
extern u16 D_800892B4;
extern s32 D_800BDF10[];
extern void *D_800BDF7C[];
extern s16 D_800BDFA6;
extern s32 D_800BDFAC;
extern s32 D_800BDFB0;
extern s32 D_800BFA6C[];
extern s32 D_800BFA7C[];
extern s8 D_800BFAB4[];
extern void *D_800BFAE8[];
extern void *D_800BFAF0[];
extern u16 D_800C391C[];
extern void *D_800C48B8[];
extern u16 D_800C4EE8;
extern Table *D_800C505C;
extern s16 D_800C507C;
extern Roster *D_800C5094;
extern s16 D_800C5D30;
extern void *D_800E5EB8[];

void func_80017B80(void *);
void func_80017C24(void *);
s32 func_8001EC20(s32, s32);
void func_8001ECAC(s32, s32, s32);
void func_8001F25C(s32, s16, s32);
void func_8001F848(s32, s32, s32);
void func_8001FA0C(void);
void func_80032F3C(s32, Roster *);
u8 *func_8003A7B8(s32);
void func_8003A7DC(s32, void *);
void func_8003A8CC(s32, void *);
void func_8003AE80(void *, void *);
void func_800A9DC8(Flags *, s32, Obj *);
s32 func_800B2E94(u8 *);
Roster *func_800D3FF4(s32, s32, Entry *, s32, s32);
void func_800D5DA0(Obj *);
void func_800D5E0C(Level1 *, void *, u8, Flags *);
void func_800D63B4(Obj *);
void func_800DB0AC(Panel *, s32, s32);
void func_800DB44C(Panel *, s32 *, s32 *, s32 *);
void func_800DB478(Panel *);
void func_800DD4B8(void);
State *func_800DD634(void);
void func_800DE84C(void *);
void func_800DF72C(void);
s32 func_800E0170(Root *);
s32 *func_800E0124(Root *);
s16 func_800E0138(s32 *);

void func_800B26A8(Obj *arg0, s32 arg1, s16 arg2) {
    s32 left;
    s32 value;
    s32 right;
    State *state;
    Obj *obj;
    Panel *panel;
    s32 handle;
    s8 i;
    u8 *text;
    u8 *p;
    s32 *res;
    Level1 *level;
    Level2 *level2;

    state = func_800DD634();
    if (D_800C5094->count == 0) {
        state->unk_44 = 0;
        state->unk_48 = 0;
    }
    obj = arg0;
    panel = obj->group->panel;
    handle = func_800E0170(obj->root);
    func_800DB44C(panel, &left, &value, &right);
    if (value != D_800BDFAC) {
        if (D_800C5094->count > 0) {
            u16 *id = &D_800892B4;

            func_80017C24(D_80087938->unk_50);
            D_80087938->unk_50 = D_800C48B8[D_8006B9E4[D_800C5094->ids[value]]];
            D_80087938->unk_30 = D_800C391C[D_80071A28[D_8006B9E4[D_800C5094->ids[value]]]];
            *id = D_8006B9E4[D_800C5094->ids[value]];
            func_80017B80(D_80087938->unk_50);
            state->unk_48 = D_80087938->unk_50;
            text = func_8003A7B8(D_8006B9E4[D_800C5094->ids[value]]);
            obj->unk_90 = D_800BFAE8[text[0x60]];
            obj->unk_94 = D_800BFAF0[text[0x61]];
            func_8003A7DC(*id, D_80080C90);
            func_8003A8CC(*id, D_80080C90 + 0x6C);
            func_8003AE80(D_80080C90 + 0x6C, D_80080C90 + 0xDA);
            func_8001F25C(0, *id, 0);
            func_8003A7DC(*id, D_80080C90);
            func_8001F848(0, *id, 0);
            func_8001FA0C();
        }
        func_8001EC20(handle, 7);
        func_8001EC20(handle, 8);
        D_800BDFAC = value;
    }
    if (right != D_800BDFB0) {
        for (i = 0; i < 4; i++) {
            obj->unk_78[D_800BFAB4[i]] = D_800C505C->entries[i + right].text;
            p = D_800C505C->entries[i + right].text;
            while (*p++ != 0) {
            }
            *(D_800BFAB4[i] + 1 + obj->unk_78) = p;
            func_8001EC20(panel->x44, D_800BFAB4[i] + 1);
            func_8001EC20(panel->x44, D_800BFAB4[i] + 2);
        }
        D_800BDFB0 = right;
    }
    if (func_800E0124(obj->root) == D_800BFA7C) {
        func_8001ECAC(handle, 0x38, 6);
        func_8001ECAC(handle, 0x39, 0);
    } else {
        func_8001ECAC(handle, 0x39, 6);
        func_8001ECAC(handle, 0x38, 0);
    }
    switch (arg2) {
        case 13:
            level = obj->root->next;
            level2 = level->next;
            func_800D5E0C(level, level2->next, level->kind, obj->runtime);
            obj->runtime->flags &= ~1;
            func_800A9DC8(obj->unk_38, 0, obj);
            obj->unk_38->flags |= 1;
            break;
        case 12:
            func_800D5DA0(obj);
            func_800D63B4(obj);
            break;
        case 26:
            res = func_800E0124(obj->root);
            if (D_800C4EE8 != 0x5AA5 && res == D_800BFA6C) {
                D_800C5D30 = 0;
                D_800BDFA6 = func_800E0138(res);
                obj->unk_158 = D_800BDF7C[D_800BDFA6];
                func_8001EC20(handle, 0x39);
                func_80032F3C(0, D_800C5094);
                D_800C5094 = func_800D3FF4(D_800BDF10[D_800BDFA6] | 0x02000001, (s16)D_8006B9E0, &D_800C505C->entries[D_800C507C], 0, 0);
                func_800DB0AC(panel, 0, 0);
                if (D_800C5094->count == 0) {
                    panel->x08 = 1;
                } else {
                    panel->x08 = D_800C5094->count;
                }
                func_800DB478(panel);
                D_800BDFAC = -1;
            }
            if (res == D_800BFA7C) {
                D_800C507C = func_800E0138(res);
                obj->unk_154 = func_800B2E94(D_800C505C->entries[D_800C507C].text);
                func_8001EC20(handle, 0x38);
                func_80032F3C(0, D_800C5094);
                D_800C5094 = func_800D3FF4(D_800BDF10[D_800BDFA6] | 0x02000001, (s16)D_8006B9E0, &D_800C505C->entries[D_800C507C], 0, 0);
                func_800DB0AC(panel, 0, 0);
                if (D_800C5094->count == 0) {
                    panel->x08 = 1;
                } else {
                    panel->x08 = D_800C5094->count;
                }
                func_800DB478(panel);
                D_800BDFAC = -1;
            }
            break;
        case 18:
            obj->unk_38->flags ^= 1;
            break;
        case 8:
        case 28:
            func_800DF72C();
            func_800DE84C(D_800E5EB8);
            func_800DD4B8();
            break;
    }
}
