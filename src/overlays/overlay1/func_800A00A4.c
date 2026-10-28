#include "types.h"

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
} Body;

typedef struct {
    Body *body;
    u8 pad04[0xAC];
} Player;

typedef struct {
    s32 x;
    s32 y;
    s32 pad08[2];
} StartPosition;

extern StartPosition D_80080C40[];
extern Player D_8008741C[];

void func_8009BA3C(void);

void func_800A00A4(void) {
    D_8008741C[0].body->x = D_80080C40[0].x;
    D_8008741C[0].body->y = D_80080C40[0].y;
    D_8008741C[1].body->x = D_80080C40[1].x;
    D_8008741C[1].body->y = D_80080C40[1].y;
    D_8008741C[2].body->x = D_80080C40[2].x;
    D_8008741C[2].body->y = D_80080C40[2].y;
    D_8008741C[3].body->x = D_80080C40[3].x;
    D_8008741C[3].body->y = D_80080C40[3].y;
    func_8009BA3C();
}
