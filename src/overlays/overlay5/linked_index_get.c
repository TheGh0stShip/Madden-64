#include "types.h"

typedef struct Overlay5IndexLink {
    u8 pad00;
    u8 index;
} Overlay5IndexLink;

typedef struct Overlay5IndexOwner {
    u8 pad00[8];
    Overlay5IndexLink *link;
} Overlay5IndexOwner;

u32 overlay5_linked_index_get(Overlay5IndexOwner *owner) {
    u32 result;
    Overlay5IndexLink *link;

    link = owner->link;
    if (link != 0) {
        goto linked;
    }
    result = 0;
    goto done;
linked:
    result = link->index;
done:
    return result;
}
