#include "types.h"

typedef struct OSMesgQueue OSMesgQueue;

extern u32 D_80074DD0;
extern OSMesgQueue* D_80074DD8;

OSMesgQueue* osPiGetCmdQueue(void) {
    if (D_80074DD0 == 0) {
        return 0;
    }
    return D_80074DD8;
}
