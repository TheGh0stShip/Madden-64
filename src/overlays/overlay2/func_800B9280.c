#include "m2c.h"

typedef struct { char a[3][0x28]; char b[3][0x28]; char c[0x14]; char e[0x14]; char g[0x28]; s32 item; s32 d; s32 sub; u8 week; } Data;
extern char D_8006BFA0[];
typedef struct { char c[28]; } Lit28;
typedef struct { char c[5]; } Lit5;
extern Lit28 D_8008C314;
extern Lit5 D_8008C330;
void func_8002E65C(char *, char *);
void func_8002E688(char *, char *);
void func_8001EC20(s32, s32);
void func_800167FC(s32, char *);
void func_800B9280(Data *data) {
    Lit28 title = D_8008C314;
    Lit5 num = D_8008C330;
    u32 i;

    for (i = 0; i < 3; i++) {
        func_8002E65C(data->b[i], D_8006BFA0);
        func_8002E65C(data->a[i], D_8006BFA0);
        func_8001EC20(data->item, i + 2);
        func_8001EC20(data->item, i + 6);
    }
    func_8002E65C(data->g, title.c);
    func_800167FC(data->week + 1, num.c);
    func_8002E688(data->g, num.c);
    func_8001EC20(data->item, 9);
}
