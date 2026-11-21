#include "types.h"

typedef struct CommandSlot {
    u8 type;
    u8 state;
    u8 pad02[9];
} CommandSlot;

typedef struct CommandTables {
    s16 a[8];
    s16 b[8];
    s16 c[8];
    s16 d[8];
    u8 pad40[0x40];
    s16 e[8][8];
    s16 f[8][8];
    s16 g[8][8];
    s16 h[8][8];
    s16 k[8][8];
} CommandTables;

typedef struct CommandPair {
    s16 first;
    s16 second;
} CommandPair;

extern CommandSlot D_80088118[];
extern CommandTables D_80088170;
extern CommandPair D_800881B0[];
extern CommandPair D_800881D0[];
extern void *D_800857D8;
extern s16 D_8008B3C8;
extern char D_800015B8[];
extern char D_800015C0[];
extern char D_800015C8[];
extern char D_800015D0[];
extern char D_800015D8[];
extern char D_800015E0[];
extern char D_800015E8[];
extern char D_800015F0[];

extern void *memory_pool_range_take(s32 pool, u32 size);
extern void memory_pool_block_resize(s32 pool, void *block);
extern void func_800E12A0(char *name, void *buffer);
extern void func_800E1FCC(s32 id, s32 flag);
extern void func_800E2278(char *name, s32 size, s32 flag);
extern void func_80028B08(void);
extern void func_800962F0(void);
extern void func_80096604(void);
extern void func_8009652C(void);

void runtime_command_update(void)
{
    s16 i;
    s16 j;

    for (i = 0; i < 8; i++) {
        D_80088118[i].type = 0x20;
        D_80088118[i].state = 0;
        D_80088170.a[i] = 0;
        D_80088170.b[i] = 0;
        D_80088170.c[i] = 0;
        D_80088170.d[i] = -1;
        D_800881B0[i].first = 0;
        D_800881B0[i].second = 0;
        D_800881D0[i].first = 0;
        D_800881D0[i].second = 0;
        for (j = 0; j < 8; j++) {
            D_80088170.e[i][j] = 0;
            D_80088170.f[i][j] = 0;
            D_80088170.g[i][j] = 0;
            D_80088170.h[i][j] = 0;
            D_80088170.k[i][j] = 0;
        }
    }
    D_800857D8 = memory_pool_range_take(0, 0xD);
    func_800E12A0(D_800015B8, D_800857D8);
    memory_pool_block_resize(0, D_800857D8);
    func_800E1FCC(0x86D0, 1);
    func_800E1FCC(0x86D0, 0);
    D_8008B3C8 = 0;
    func_800E2278(D_800015C0, 0x358, 0);
    func_800E2278(D_800015C8, 0x134, 0);
    func_800E2278(D_800015D0, 0x1458, 0);
    func_800E2278(D_800015D8, 0x3C0, 0);
    func_80028B08();
    func_800962F0();
    func_80096604();
    func_8009652C();
    func_800E2278(D_800015E0, 0xBA0, 1);
    func_800E2278(D_800015E8, 0x5C08, 1);
    func_800E2278(D_800015D0, 0x1458, 1);
    func_800E2278(D_800015D8, 0x3C0, 1);
    func_800E2278(D_800015F0, 0x1E4, 1);
}
