#ifndef MADDEN64_CONTROLLER_H
#define MADDEN64_CONTROLLER_H

#include "os_internal.h"

#define CONT_CMD_READ_BUTTON 1
#define CONT_CMD_REQUEST_STATUS_TX 1
#define CONT_CMD_REQUEST_STATUS_RX 3
#define CONT_CMD_READ_BUTTON_TX 1
#define CONT_CMD_READ_BUTTON_RX 4
#define CONT_CMD_EXE 1
#define CONT_CMD_END 0xFE
#define CONT_CMD_NOP 0xFF
#define CHNL_ERR(format) (((format).rxsize & 0xC0) >> 4)

typedef struct OSPifRam {
    u32 ramarray[15];
    u32 pifstatus;
} OSPifRam;

typedef struct OSContReadFormat {
    u8 dummy;
    u8 txsize;
    u8 rxsize;
    u8 cmd;
    u16 button;
    s8 stick_x;
    s8 stick_y;
} OSContReadFormat;

typedef struct OSContRequestFormat {
    u8 dummy;
    u8 txsize;
    u8 rxsize;
    u8 cmd;
    u8 typeh;
    u8 typel;
    u8 status;
    u8 dummy1;
} OSContRequestFormat;

typedef struct OSContStatus {
    u16 type;
    u8 status;
    u8 errno;
} OSContStatus;

typedef struct OSContPad {
    u16 button;
    s8 stick_x;
    s8 stick_y;
    u8 errno;
} OSContPad;

extern OSPifRam D_8007E5C8;
extern OSPifRam D_8007BFC8;
extern u8 D_8007E608;
extern u8 D_8007E609;
extern s32 D_80075CF0;
extern u64 D_80074DB0;
extern OSMesgQueue D_8007E630;
extern OSMesg D_8007E648;

extern void __osSiGetAccess(void);
extern void __osSiRelAccess(void);
extern s32 __osSiRawStartDma(s32 direction, void* dramAddr);
extern s32 osRecvMesg(OSMesgQueue* queue, OSMesg* message, s32 flag);
extern OSTime osGetTime(void);
extern s32 osSetTimer(OSTimer* timer, OSTime countdown, OSTime interval,
                      OSMesgQueue* queue, OSMesg message);
extern void __osSiCreateAccessQueue(void);
extern void __osPackRequestData(u8 command);
extern void __osContGetInitData(u8* pattern, OSContStatus* data);
extern void __osPfsRequestData(u8 command);
extern void __osPfsGetInitData(u8* pattern, OSContStatus* data);

#endif
