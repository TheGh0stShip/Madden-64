#include "types.h"

typedef struct {
    void *a;
    void *b;
    void *c;
    u8 pad0C[0x14];
} Request;

extern u8 D_800C3214[];
extern u8 D_800C322C[];
extern u8 D_800C3244[];

void func_800D67B8(Request *);
void func_800D6454(Request *);

void func_800AF23C(void) {
    Request req;

    func_800D67B8(&req);
    req.a = D_800C3214;
    req.b = D_800C322C;
    req.c = D_800C3244;
    func_800D6454(&req);
}
