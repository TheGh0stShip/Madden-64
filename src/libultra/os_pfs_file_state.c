#include "pfs.h"

s32 osPfsFileState(OSPfs* pfs, s32 fileNo, OSPfsState* state) {
    s32 result;
    int pages;
    OSInode inode;
    OSDir directory;
    OSInodeUnit nextPage;
    int index;
    u8 bank;
    u8 startPage;

    if (fileNo >= pfs->dir_size || fileNo < 0) {
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
                             pfs->dir_table + fileNo, (u8*)&directory);
    if (result != 0) {
        return result;
    }
    if (directory.company_code == 0 || directory.game_code == 0) {
        return 5;
    }
    if (directory.start_page.ipage < pfs->inode_start_page) {
        return 3;
    }

    pages = 0;
    startPage = directory.start_page.inode.page;
    bank = directory.start_page.inode.bank;
    while (bank < pfs->banks) {
        result = __osPfsRWInode(pfs, &inode, 0, bank);
        if (result != 0) {
            return result;
        }
        nextPage = inode.inode_page[startPage];
        pages++;
        while (nextPage.ipage >= pfs->inode_start_page) {
            pages++;
            nextPage = inode.inode_page[nextPage.inode.page];
            if (nextPage.inode.bank != bank) {
                bank = nextPage.inode.bank;
                startPage = nextPage.inode.page;
                break;
            }
        }
        if (nextPage.ipage == 1) {
            break;
        }
    }
    if (nextPage.ipage != 1) {
        return 3;
    }

    state->file_size = pages * 256;
    state->company_code = directory.company_code;
    state->game_code = directory.game_code;
    for (index = 0; index < 16; index++) {
        state->game_name[index] = directory.game_name[index];
    }
    for (index = 0; index < 4; index++) {
        state->ext_name[index] = directory.ext_name[index];
    }
    return 0;
}
