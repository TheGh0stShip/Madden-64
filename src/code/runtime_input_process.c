#include "pfs.h"

/*
 * runtime_input_process: the controller/rumble service loop.
 *
 * Waits for each retrace message, bumps the frame counter and runs the frame callback.  When
 * the controller queue is idle it walks the connected ports and drives each Rumble Pak:
 * per-port state bits (1 present, 2 running, 4 start requested, 8 motor on) and a pattern
 * table of {on, off} durations alternate the motor, with a time-out that stops it.  It then
 * re-arms the SI event and starts the next controller read.  The catalogue name is kept.
 */

extern OSMesgQueue D_80080A80;
extern volatile s32 D_80088620;
extern void (*D_80086184)(void);
extern OSMesgQueue *D_8008502C;
extern OSMesgQueue D_80089368;
extern s32 D_80072320;
extern s32 D_80072324;
extern OSMesgQueue D_8008B288;
extern OSMesg D_800895AC;
extern s16 D_80086DA8;
extern s8 D_80086DE4[];
extern s32 D_8008B660[];
extern s8 D_800892D4[];
extern u8 D_80072300[];
extern s8 D_80089298[];
extern s8 D_800895D4[];
extern OSPfs D_80086F60[];

extern s32 osMotorStart(OSPfs *pfs);
extern s32 osMotorStop(OSPfs *pfs);
extern s32 osContStartReadData(OSMesgQueue *queue);

void runtime_input_process(void) {
    s32 i;
    s32 port;
    s32 *state;
    s32 *bits;
    s32 flags;
    s32 result;
    s32 pattern;
    s32 index;

    for (;;) {
        osRecvMesg(&D_80080A80, 0, 1);
        D_80088620++;
        if (D_80086184 != 0) {
            D_80086184();
        }
        if (D_8008502C != &D_80089368) {
            continue;
        }
        if (D_80072320 != 0) {
            continue;
        }
        if (D_80072324 != 0) {
            D_80072320 = 3;
            continue;
        }
        osCreateMesgQueue(&D_8008B288, &D_800895AC, 1);
        osSetEventMesg(5, &D_8008B288, 0);
        i = D_80086DA8;
        while (i-- != 0) {
            port = D_80086DE4[i];
            state = &D_8008B660[port];
            flags = *state;
            if (!(flags & 1)) {
                continue;
            }
            if (flags & 4) {
                *state &= ~4;
                pattern = D_800892D4[port];
                if (pattern != 0) {
                    index = pattern * 2;
                    D_80089298[port] = D_80072300[index];
                    if (*state & 2) {
                        goto running;
                    }
                    *state |= 0xA;
                    if (osMotorStart(&D_80086F60[port]) != 0) {
                        *state = 0;
                    }
                } else if (flags & 8) {
                    OSPfs *pfs;

                    *state &= ~0xE;
                    pfs = &D_80086F60[port];
                    osMotorStop(pfs);
                    osMotorStop(pfs);
                    if (osMotorStop(pfs) != 0) {
                        *state = 0;
                    }
                }
            } else if (flags & 2) {
            running:
                if (D_800895D4[port] >= 0) {
                    if (D_80088620 & 1) {
                        D_800895D4[port]--;
                    }
                    if (D_80089298[port] != 0) {
                        if (--D_80089298[port] == 0) {
                            pattern = D_800892D4[port];
                            if (pattern != 0) {
                                bits = &D_8008B660[port];
                                index = pattern * 2;
                                if (*bits & 8) {
                                    D_80089298[port] = D_80072300[index + 1];
                                    *bits &= ~8;
                                    result = osMotorStop(&D_80086F60[port]);
                                } else {
                                    D_80089298[port] = D_80072300[index];
                                    *bits |= 8;
                                    result = osMotorStart(&D_80086F60[port]);
                                }
                                if (result != 0) {
                                    *bits = 0;
                                }
                            } else {
                                D_800895D4[port] = -1;
                            }
                        }
                    }
                } else {
                    OSPfs *pfs = &D_80086F60[port];

                    osMotorStop(pfs);
                    osMotorStop(pfs);
                    if (osMotorStop(pfs) != 0) {
                        D_8008B660[port] = 0;
                    }
                    D_8008B660[port] &= ~0xE;
                }
            }
        }
        osSetEventMesg(5, &D_80089368, 0);
        D_80072320 = 1;
        osContStartReadData(&D_80089368);
    }
}
