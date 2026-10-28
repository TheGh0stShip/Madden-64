#include "types.h"

typedef struct {
    u8 pad00[0x98];
    s32 state;
    u8 pad9C[2];
    s16 pad;
    s32 speed;
} Mover;

extern s32 D_80080C10;
extern volatile u16 D_8008A5B4;

u16 func_80030B54(s16);
void func_800A365C(s32);
void func_800BC5C8(void);
void func_800BC98C(s32);

void func_800AB194(Mover *m, u16 max, u16 accel) {
    s32 speed;

    if (!(D_80080C10 & 0x10)) {
        func_800BC5C8();
    }
    switch (m->state) {
        case 0:
            if (!(func_80030B54(m->pad) & 0x2020)) {
                m->state = 2;
                break;
            }
            m->speed -= D_8008A5B4 * accel;
            if (m->speed < -max) {
                m->speed = -max;
            }
            break;
        case 1:
            if (func_80030B54(m->pad) & 0x10) {
                m->speed += D_8008A5B4 * accel;
                if (m->speed > max) {
                    m->speed = max;
                }
            } else {
                m->state = 2;
            }
            break;
        case 2:
            speed = m->speed;
            if (speed >= 0) {
                if (speed < D_8008A5B4 * accel) {
                    goto stop;
                }
                m->speed = speed - D_8008A5B4 * accel;
            } else {
                if (D_8008A5B4 * -accel < speed) {
                stop:
                    m->speed = 0;
                    if (D_80080C10 & 0x10) {
                        func_800BC98C(speed);
                    }
                    func_800A365C(0);
                    break;
                }
                m->speed = speed + D_8008A5B4 * accel;
            }
            break;
    }
}
