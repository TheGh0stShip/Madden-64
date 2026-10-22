#include "pfs.h"

s32 osPfsFreeBlocks(OSPfs* pfs, s32* bytesNotUsed) {
    int index;
    int pages = 0;
    OSInode inode;
    s32 result = 0;
    u8 bank;
    int offset;

    if ((pfs->status & 1) == 0) {
        return 5;
    }
    if (__osCheckId(pfs) == 2) {
        return 2;
    }
    for (bank = 0; bank < pfs->banks; bank++) {
        result = __osPfsRWInode(pfs, &inode, 0, bank);
        if (result != 0) {
            return result;
        }
        offset = bank > 0 ? 1 : pfs->inode_start_page;
        for (index = offset; index < 128; index++) {
            if (inode.inode_page[index].ipage == 3) {
                pages++;
            }
        }
    }
    *bytesNotUsed = pages * 8 * 32;
    return 0;
}
