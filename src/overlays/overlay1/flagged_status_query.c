#include "types.h"

typedef struct FlaggedObject {
    u8 pad00[0x28];
    u16 flags;
} FlaggedObject;

extern u16 func_800BB438(void);

u16 flagged_status_query(FlaggedObject *object)
{
    if (object->flags & 8) {
        return 0;
    }
    return func_800BB438();
}
