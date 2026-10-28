#include "types.h"

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
} Node;

typedef struct {
    u8 pad00[0x24];
    Node *node;
    u8 pad28[0xB0 - 0x28];
} Marker;

typedef struct {
    u8 pad00[6];
    u16 mirrored;
    u8 pad08[4];
    s32 far_y;
    s32 near_y;
} Track;

extern Track *D_800718E8;
extern Marker D_800873F8[4];
extern Node *D_80088480;

void func_80033B20(Node *node, s32 flag);
void func_800C0C8C(Marker *marker, s32 a);
void func_800C16A0(Marker *marker, s32 a);

void func_800BAD34(void) {
    Track *track;
    Node *ball;
    s32 y;

    track = D_800718E8;
    ball = D_80088480;
    y = track->near_y;
    ball->x = 0x1A50000;
    ball->y = y;
    D_800873F8[1].node->y = D_800718E8->near_y;
    D_800873F8[1].node->x = 0x1B00000;
    func_800C0C8C(&D_800873F8[1], 0x200);
    func_80033B20(D_800873F8[1].node, 1);
    func_800C16A0(&D_800873F8[1], 0xC00);
    D_800873F8[0].node->y = D_800718E8->near_y;
    D_800873F8[0].node->x = 0xFE500000;
    func_800C0C8C(&D_800873F8[0], 0x200);
    func_80033B20(D_800873F8[0].node, 1);
    func_800C16A0(&D_800873F8[0], 0x400);
    D_800873F8[2].node->y = D_800718E8->far_y;
    D_800873F8[2].node->x = 0xFE600000;
    func_800C0C8C(&D_800873F8[2], 0x200);
    func_80033B20(D_800873F8[2].node, 1);
    func_800C16A0(&D_800873F8[2], 0x400);
    D_800873F8[3].node->x = 0xFE500000;
    if (D_800718E8->mirrored != 0) {
        D_800873F8[3].node->y = D_800718E8->near_y + 0xA00000;
    } else {
        D_800873F8[3].node->y = D_800718E8->near_y + 0xFF600000;
    }
    func_800C0C8C(&D_800873F8[3], 0x200);
    func_80033B20(D_800873F8[3].node, 1);
    func_800C16A0(&D_800873F8[3], 0x400);
}
