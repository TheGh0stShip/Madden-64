#include "types.h"

typedef struct {
    s16 left;
    s16 top;
    s16 right;
    s16 bottom;
} Rect;

typedef struct {
    s32 unk00;
    s32 unk04;
} Point;

typedef struct {
    u8 pad000[0x1FC];
    u16 width;
    u16 height;
} Viewport;

typedef struct {
    u8 pad00[8];
    s32 *state;
} Object;

extern Viewport *D_8008B654;

void func_8000C790(Viewport *);
void func_800984F4(Object *);
void func_80098980(Object *, Point *);
void func_8009951C(Rect *, Point *, s32);
void func_80099BD4(s32 *);

void func_8009DB50(Object *obj) {
    s32 *state = obj->state;
    Rect rect;
    Point point;

    func_8000C790(D_8008B654);
    if (*state != 1) {
        if (*state != 0) {
            if (*state == 2) {
            } else if (*state == 3) {
                rect.left = -((D_8008B654->width >> 1) + 0x10);
                rect.top = -((D_8008B654->height >> 1) + 0x10);
                rect.right = D_8008B654->width + 0x20;
                rect.bottom = D_8008B654->height + 0x20;
                func_8009951C(&rect, &point, 300000);
                func_80098980(obj, &point);
            }
        } else {
            func_800984F4(obj);
        }
    } else {
        func_80099BD4(state);
    }
}
