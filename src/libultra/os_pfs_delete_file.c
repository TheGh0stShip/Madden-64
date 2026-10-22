#include "pfs.h"

s32 osPfsDeleteFile(OSPfs* pfs, u16 companyCode, u32 gameCode,
                    u8* gameName, u8* extName) {
    s32 fileNo;
    int index;
    s32 result;
    OSInode inode;
    OSDir directory;
    u16 sum = 0;
    OSInodeUnit lastPage;
    u8 startPage;
    u8 bank;

    if (companyCode == 0 || gameCode == 0) {
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
    result = osPfsFindFile(pfs, companyCode, gameCode, gameName, extName, &fileNo);
    if (result != 0) {
        return result;
    }
    if (fileNo == -1) {
        return 5;
    }
    result = __osContRamRead(pfs->queue, pfs->channel,
                             pfs->dir_table + fileNo, (u8*)&directory);
    if (result != 0) {
        return result;
    }
    startPage = directory.start_page.inode.page;
    for (bank = directory.start_page.inode.bank; bank < pfs->banks;) {
        result = __osPfsRWInode(pfs, &inode, 0, bank);
        if (result != 0) {
            return result;
        }
        result = __osPfsReleasePages(pfs, &inode, startPage, &sum, bank,
                                     &lastPage, 1);
        if (result != 0) {
            return result;
        }
        result = __osPfsRWInode(pfs, &inode, 1, bank);
        if (result != 0) {
            return result;
        }
        if (lastPage.ipage == 1) {
            break;
        }
        bank = lastPage.inode.bank;
        startPage = lastPage.inode.page;
    }
    if (bank >= pfs->banks) {
        return 3;
    }
    directory.game_code = 0;
    directory.company_code = 0;
    directory.start_page.ipage = 0;
    directory.data_sum = 0;
    for (index = 0; index < 16; index++) {
        directory.game_name[index] = 0;
    }
    for (index = 0; index < 4; index++) {
        directory.ext_name[index] = 0;
    }
    directory.status = 0;
    result = __osContRamWrite(pfs->queue, pfs->channel,
                              pfs->dir_table + fileNo, (u8*)&directory, 0);
    return result;
}
