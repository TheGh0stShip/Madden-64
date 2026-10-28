#include "types.h"

extern s32 STATE;
extern s16 INDEX;
s16 TARGET_CALL(void);

s16 overlay5_state_reset_dispatch(void) {
    STATE = 2;
    INDEX = -1;
    return TARGET_CALL();
}
