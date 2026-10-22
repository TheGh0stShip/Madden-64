#include "types.h"

typedef struct Vector3u16 {
    u16 x;
    u16 y;
    u16 z;
} Vector3u16;

typedef struct Vector3s32 {
    s32 x;
    s32 y;
    s32 z;
} Vector3s32;

void func_8000EC58(u8* wrapper) {
    u8* object = *(u8**)(wrapper + 8);

    *(u16*)(object + 0xA8) |= 1;
}

void func_8000EC6C(u8* wrapper, Vector3u16* value) {
    u8* object = *(u8**)(wrapper + 8);

    value->x = *(u16*)(object + 0xAA);
    value->y = *(u16*)(object + 0xAC);
    value->z = *(u16*)(object + 0xAE);
}

void func_8000EC8C(u8* wrapper, Vector3u16* value) {
    u8* object = *(u8**)(wrapper + 8);

    *(u16*)(object + 0xAA) = value->x;
    *(u16*)(object + 0xAC) = value->y;
    *(u16*)(object + 0xAE) = value->z;
}

void func_8000ECAC(u8* wrapper, Vector3u16* value) {
    u8* object = *(u8**)(wrapper + 8);

    *(u16*)(object + 0xAA) += value->x;
    *(u16*)(object + 0xAC) += value->y;
    *(u16*)(object + 0xAE) += value->z;
}

void func_8000ECE4(u8* wrapper, Vector3s32* value) {
    u8* object = *(u8**)(wrapper + 8);

    *(s32*)(object + 0xC4) = value->x;
    *(s32*)(object + 0xC8) = value->y;
    *(s32*)(object + 0xCC) = value->z;
}

void func_8000ED04(u8* wrapper, Vector3s32* value) {
    u8* object = *(u8**)(wrapper + 8);

    value->x = *(s32*)(object + 0xC4);
    value->y = *(s32*)(object + 0xC8);
    value->z = *(s32*)(object + 0xCC);
}
