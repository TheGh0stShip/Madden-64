#include "m2c.h"

typedef struct { u16 pad; u16 id; } Entry;
typedef struct { s32 pad[3]; s32 unkC; } Node;
typedef struct { u8 pos; u8 pad[0x27]; } Player;
typedef struct Arg {
    u8 unk_0; u16 unk_2; u8 unk_4; u16 unk_6; u16 unk_8;
    Entry *unk_C; Entry *unk_10; s32 unk_14; s32 unk_18; s32 unk_1C; s32 unk_20;
    Node *unk_24; Node *unk_28;
} Arg;
extern u16 D_80080CFC[];
extern Player D_80080D78[];
extern u16 D_800BDF0A;
void func_800B17EC(Arg *, u16);
void func_80024694(void);
void func_80024E9C(void);
void func_80029E88(u16, u16);
void func_800374F0(u16, u16, u8);
void func_80039ACC(s32);
void func_800DB44C(s32, s32 *, s32 *, s32 *);
void func_800B1D04(Arg *arg0) {
    s32 sp10;
    s32 sp14;
    s32 sp18;
    s32 sp1C;
    u16 first;
    u16 second;
    u16 swap;


    func_800DB44C(arg0->unk_28->unkC, &sp10, &sp14, &sp18);
    func_800DB44C(arg0->unk_24->unkC, &sp10, &sp1C, &sp18);
    first = arg0->unk_10[sp14].id;
    second = arg0->unk_C[sp1C].id;
    func_80029E88(D_80080CFC[first], D_80080CFC[second]);
    swap = D_80080D78[first].pos;
    func_800374F0(arg0->unk_2, D_80080CFC[first], D_80080D78[second].pos);
    func_800374F0(arg0->unk_2, D_80080CFC[second], swap);
    swap = D_80080CFC[first];
    D_80080CFC[first] = D_80080CFC[second];
    D_80080CFC[second] = swap;
    func_80039ACC(0);
    func_80024E9C();
    func_80024694();
    func_800B17EC(arg0, arg0->unk_2);
    D_800BDF0A = arg0->unk_2;
}
