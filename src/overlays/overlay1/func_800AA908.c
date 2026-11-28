#include "types.h"

typedef struct {
    u8 pad00[0x1C];
    s32 pos[3];
    u8 pad28[4];
    s32 posTarget[3];
    u8 pad38[4];
    s32 posSpeed[3];
    u8 pad48[4];
    s16 posLimitShift[3];
    u8 pad52[2];
    s16 posAccelShift[3];
    s16 pad5A;
    s16 rot[3];
    s16 pad62;
    s16 rotTarget[3];
    s16 pad6A;
    s16 rotSpeed[3];
    s16 pad72;
    s16 rotLimitShift[3];
    s16 pad7A;
    s16 rotAccelShift[3];
    s16 pad82;
    u16 flags;
    u8 pad86[0x2A];
    s32 xMin;
    s32 xMax;
    s32 yMin;
    s32 yMax;
} Camera;

/* Eases the camera position and rotation toward their targets; clears the moving flags once all six arrive. */
void func_800AA908(Camera *cam) {
    s16 arrived;
    s32 i;
    s32 diff;
    s32 after;
    s32 limit;
    s32 neg;
    s32 more;
    s32 *target;
    s32 *pos;
    s32 *speed;
    s16 *limitShift;
    s16 *accelShift;
    s16 *rspeed;
    s16 *rot;
    s16 *rtarget;
    s16 *rlimitShift;
    s16 *raccelShift;

    arrived = 0;
    if (cam->posTarget[0] < cam->xMin) {
        cam->posTarget[0] = cam->xMin;
        cam->posSpeed[0] = 0;
    }
    if (cam->posTarget[0] > cam->xMax) {
        cam->posTarget[0] = cam->xMax;
        cam->posSpeed[0] = 0;
    }
    if (cam->posTarget[1] < cam->yMin) {
        cam->posTarget[1] = cam->yMin;
        cam->posSpeed[1] = 0;
    }
    if (cam->posTarget[1] > cam->yMax) {
        cam->posTarget[1] = cam->yMax;
        cam->posSpeed[1] = 0;
    }
    if (cam->posTarget[2] < 0x140000) {
        cam->posTarget[2] = 0x140000;
        cam->posSpeed[2] = 0;
    }
    i = 2;
    target = &cam->posTarget[2];
    pos = &cam->pos[2];
    speed = &cam->posSpeed[2];
    limitShift = &cam->posLimitShift[2];
    accelShift = &cam->posAccelShift[2];
    do {
        diff = *target - *pos;
        *speed += diff >> *accelShift;
        if (diff < 0) {
            neg = -diff;
            limit = neg >> *limitShift;
            if (-*speed >= limit) {
                *speed = ~limit;
            }
        } else {
            limit = diff >> *limitShift;
            if (*speed >= limit) {
                *speed = limit + 1;
            }
        }
        *pos += *speed;
        more = i;
        if ((diff ^ (*target - *pos)) <= 0) {
            arrived++;
            *pos = *target;
            *speed = 0;
        }
        target--;
        pos--;
        speed--;
        limitShift--;
        accelShift--;
        i--;
    } while (more != 0);
    i = 2;
    rspeed = &cam->rotSpeed[2];
    rot = &cam->rot[2];
    rtarget = &cam->rotTarget[2];
    rlimitShift = &cam->rotLimitShift[2];
    raccelShift = &cam->rotAccelShift[2];
    do {
        *rtarget &= 0xFFF;
        diff = *rtarget - *rot;
        if (diff >= 0x800) {
            diff -= 0x1000;
        } else if (diff < -0x7FF) {
            diff += 0x1000;
        }
        if (diff < 0) {
            neg = -diff;
            *rspeed = (s16)(*rspeed - 1) - (neg >> *raccelShift);
            limit = neg >> *rlimitShift;
            if (-*rspeed >= limit) {
                *rspeed = ~limit;
            }
        } else {
            *rspeed = (s16)(*rspeed + 1) + (diff >> *raccelShift);
            limit = diff >> *rlimitShift;
            if (*rspeed >= limit) {
                *rspeed = limit + 1;
            }
        }
        *rot = (*rot + *rspeed) & 0xFFF;
        after = *rtarget - *rot;
        if (after >= 0x800) {
            after -= 0x1000;
        } else if (after < -0x7FF) {
            after += 0x1000;
        }
        if ((diff ^ after) <= 0) {
            arrived++;
            *rot = *rtarget;
            *rspeed = 0;
        }
        rspeed--;
        rot--;
        rtarget--;
        rlimitShift--;
        raccelShift--;
    } while (i-- != 0);
    if (arrived == 6) {
        cam->flags &= ~0x28;
    }
}
