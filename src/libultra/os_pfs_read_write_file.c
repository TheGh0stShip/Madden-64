#include "pfs.h"

#define PAGE_VALID(pfs, node)                                      \
    ((node).ipage >= (pfs)->inode_start_page &&                    \
     (node).inode.bank < (pfs)->banks && (node).inode.page > 0 &&  \
     (node).inode.page < 128)

extern s32 __osPfsGetNextPage(OSPfs* pfs, u8* bank, OSInode* inode,
                              OSInodeUnit* page);

s32 osPfsReadWriteFile(OSPfs* pfs, s32 fileNo, u8 flag, int offset,
                       int byteCount, u8* data) {
    s32 result;
    OSDir directory;
    OSInode inode;
    OSInodeUnit currentPage;
    int currentBlock;
    int blocksLeft;
    u8* buffer;
    u8 bank;
    u16 block;

    if (fileNo >= pfs->dir_size || fileNo < 0) {
        return 5;
    }
    if (byteCount <= 0 || byteCount % 32 != 0) {
        return 5;
    }
    if (offset < 0 || offset % 32 != 0) {
        return 5;
    }
    if ((pfs->status & 1) == 0) {
        return 5;
    }
    if (__osCheckId(pfs) == 2) {
        return 2;
    }
    if (pfs->activebank != 0) {
        pfs->activebank = 0;
        result = __osPfsSelectBank(pfs);
        if (result != 0) {
            return result;
        }
    }
    result = __osContRamRead(pfs->queue, pfs->channel,
                             pfs->dir_table + fileNo,
                             (u8*)&directory);
    if (result != 0) {
        return result;
    }
    if (!PAGE_VALID(pfs, directory.start_page)) {
        if (directory.start_page.ipage == 1) {
            return 5;
        }
        return 3;
    }
    if (flag == 0 && (directory.status & 2) == 0) {
        return 6;
    }
    bank = 0xFF;
    currentBlock = offset / 32;
    currentPage = directory.start_page;
    while (currentBlock >= 8) {
        result = __osPfsGetNextPage(pfs, &bank, &inode, &currentPage);
        if (result != 0) {
            return result;
        }
        currentBlock -= 8;
    }
    blocksLeft = byteCount / 32;
    buffer = data;
    while (blocksLeft > 0) {
        if (currentBlock == 8) {
            result = __osPfsGetNextPage(pfs, &bank, &inode, &currentPage);
            if (result != 0) {
                return result;
            }
            currentBlock = 0;
        }
        if (pfs->activebank != currentPage.inode.bank) {
            pfs->activebank = currentPage.inode.bank;
            result = __osPfsSelectBank(pfs);
            if (result != 0) {
                return result;
            }
        }
        block = currentPage.inode.page * 8 + currentBlock;
        if (flag == 0) {
            result = __osContRamRead(pfs->queue, pfs->channel,
                                     block, buffer);
        } else {
            result = __osContRamWrite(pfs->queue, pfs->channel,
                                      block, buffer, 0);
        }
        if (result != 0) {
            return result;
        }
        buffer += 32;
        currentBlock++;
        blocksLeft--;
    }
    if (flag == 1 && !(directory.status & 2)) {
        directory.status |= 2;
        pfs->activebank = 0;
        result = __osPfsSelectBank(pfs);
        if (result != 0) {
            return result;
        }
        result = __osContRamWrite(pfs->queue, pfs->channel,
                                  pfs->dir_table + fileNo,
                                  (u8*)&directory, 0);
        if (result != 0) {
            return result;
        }
    }
    return 0;
}
