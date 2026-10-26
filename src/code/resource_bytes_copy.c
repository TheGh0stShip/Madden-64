#include "types.h"

typedef struct ResourceByteReader {
    u8 *data;
    u8 pad04[4];
    u32 offset;
} ResourceByteReader;

void resource_bytes_copy(ResourceByteReader *reader, u8 *destination,
                         u32 count, u32 mode)
{
    u8 *data = reader->data;
    u16 index;
    u16 length = count;

    if (mode == 1) goto four;
    if (mode != 0) goto variable;
    destination[0] = *(u8 *)((u32)data + reader->offset + 1);
    destination[1] = *(u8 *)((u32)data + reader->offset);
    reader->offset += 2;
    return;
four:
    destination[0] = *(u8 *)((u32)data + reader->offset + 3);
    destination[1] = *(u8 *)((u32)data + reader->offset + 2);
    destination[2] = *(u8 *)((u32)data + reader->offset + 1);
    destination[3] = *(u8 *)((u32)data + reader->offset);
    reader->offset += 4;
    return;
variable:
    for (index = 0; index < length; index++) {
        destination[index] = *(u8 *)((u32)data + reader->offset + index);
    }
    reader->offset += length;
}
