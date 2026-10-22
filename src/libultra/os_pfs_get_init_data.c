#include "controller.h"

void __osPfsGetInitData(u8* pattern, OSContStatus* data) {
    u8* ptr;
    OSContRequestFormat format;
    int index;
    u8 bits = 0;

    ptr = (u8*)&D_8007BFC8;
    for (index = 0; index < D_8007E609;
         index++, ptr += sizeof(format), data++) {
        format = *(OSContRequestFormat*)ptr;
        data->errno = CHNL_ERR(format);
        if (data->errno == 0) {
            data->type = (format.typel << 8) | format.typeh;
            data->status = format.status;
            bits |= 1 << index;
        }
    }
    *pattern = bits;
}
