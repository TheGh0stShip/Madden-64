#include "pfs.h"

s32 corrupted_init(OSPfs* pfs, OSInodeCache* cache);
s32 corrupted(OSPfs* pfs, OSInodeUnit filePage, OSInodeCache* cache);

#define VALID_PAGE(pfs, node)                                      \
    ((node).ipage >= (pfs)->inode_start_page &&                    \
     (node).inode.bank < (pfs)->banks && (node).inode.page >= 1 && \
     (node).inode.page < 128)

s32 osPfsChecker(OSPfs* pfs) {
    int index;
    s32 result;
    OSInodeUnit nextPage;
    OSInode checkedInode;
    OSInode temporaryInode;
    OSDir directory;
    OSInodeUnit fileNextPage[16];
    OSInodeCache cache;
    int fixed = 0;
    u8 bank;
    s32 collisionCount;
    s32 previousCount;
    int offset;

    result = __osCheckId(pfs);
    if (result == 2) {
        result = __osGetId(pfs);
    }
    if (result != 0) {
        return result;
    }
    result = corrupted_init(pfs, &cache);
    if (result != 0) {
        return result;
    }
    for (index = 0; index < pfs->dir_size; index++) {
        result = __osContRamRead(pfs->queue, pfs->channel,
                                 pfs->dir_table + index,
                                 (u8*)&directory);
        if (result != 0) {
            return result;
        }
        if (directory.company_code != 0 && directory.game_code != 0) {
            nextPage = directory.start_page;
            previousCount = collisionCount = 0;
            bank = 255;
            while (VALID_PAGE(pfs, nextPage)) {
                if (bank != nextPage.inode.bank) {
                    bank = nextPage.inode.bank;
                    result = __osPfsRWInode(pfs, &temporaryInode, 0,
                                            bank);
                    if (result != 0 && result != 3) {
                        return result;
                    }
                }
                collisionCount =
                    corrupted(pfs, nextPage, &cache) - previousCount;
                if (collisionCount != 0) {
                    break;
                }
                previousCount = 1;
                nextPage = temporaryInode.inode_page[nextPage.inode.page];
            }
            if (collisionCount != 0 || nextPage.ipage != 1) {
                directory.company_code = 0;
                directory.game_code = 0;
                directory.start_page.ipage = 0;
                directory.status = 0;
                directory.data_sum = 0;
                if (pfs->activebank != 0) {
                    pfs->activebank = 0;
                    result = __osPfsSelectBank(pfs);
                    if (result != 0) {
                        return result;
                    }
                }
                result = __osContRamWrite(pfs->queue, pfs->channel,
                                          pfs->dir_table + index,
                                          (u8*)&directory, 0);
                if (result != 0) {
                    return result;
                }
                fixed++;
            }
        } else if (directory.company_code != 0 || directory.game_code != 0) {
            directory.company_code = 0;
            directory.game_code = 0;
            directory.start_page.ipage = 0;
            directory.status = 0;
            directory.data_sum = 0;
            if (pfs->activebank != 0) {
                pfs->activebank = 0;
                result = __osPfsSelectBank(pfs);
                if (result != 0) {
                    return result;
                }
            }
            result = __osContRamWrite(pfs->queue, pfs->channel,
                                      pfs->dir_table + index,
                                      (u8*)&directory, 0);
            if (result != 0) {
                return result;
            }
            fixed++;
        }
    }
    for (index = 0; index < pfs->dir_size; index++) {
        result = __osContRamRead(pfs->queue, pfs->channel,
                                 pfs->dir_table + index,
                                 (u8*)&directory);
        if (result != 0) {
            return result;
        }
        if (directory.company_code != 0 && directory.game_code != 0 &&
            directory.start_page.ipage >= (u16)pfs->inode_start_page) {
            fileNextPage[index].ipage = directory.start_page.ipage;
        } else {
            fileNextPage[index].ipage = 0;
        }
    }
    for (bank = 0; bank < pfs->banks; bank++) {
        result = __osPfsRWInode(pfs, &temporaryInode, 0, bank);
        if (result != 0 && result != 3) {
            return result;
        }
        offset = bank > 0 ? 1 : pfs->inode_start_page;
        for (index = 0; index < offset; index++) {
            checkedInode.inode_page[index].ipage =
                temporaryInode.inode_page[index].ipage;
        }
        for (; index < 128; index++) {
            checkedInode.inode_page[index].ipage = 3;
        }
        for (index = 0; index < pfs->dir_size; index++) {
            while (fileNextPage[index].inode.bank == bank &&
                   fileNextPage[index].ipage >=
                       (u16)pfs->inode_start_page) {
                u8 page = fileNextPage[index].inode.page;
                fileNextPage[index] = checkedInode.inode_page[page] =
                    temporaryInode.inode_page[page];
            }
        }
        result = __osPfsRWInode(pfs, &checkedInode, 1, bank);
        if (result != 0) {
            return result;
        }
    }
    if (fixed) {
        pfs->status |= 2;
    } else {
        pfs->status &= ~2;
    }
    return 0;
}

s32 corrupted_init(OSPfs* pfs, OSInodeCache* cache) {
    int index;
    int mapIndex;
    int offset;
    u8 bank;
    OSInodeUnit page;
    OSInode inode;
    s32 result;

    for (index = 0; index < 256; index++) {
        cache->map[index] = 0;
    }
    cache->bank = -1;
    for (bank = 0; bank < pfs->banks; bank++) {
        offset = bank > 0 ? 1 : pfs->inode_start_page;
        result = __osPfsRWInode(pfs, &inode, 0, bank);
        if (result != 0 && result != 3) {
            return result;
        }
        for (index = offset; index < 128; index++) {
            page = inode.inode_page[index];
            if (page.ipage >= pfs->inode_start_page &&
                page.inode.bank != bank) {
                mapIndex = page.inode.page / 4 +
                           (page.inode.bank % 8) * 32;
                cache->map[mapIndex] |= 1 << (bank % 8);
            }
        }
    }
    return 0;
}

s32 corrupted(OSPfs* pfs, OSInodeUnit filePage, OSInodeCache* cache) {
    int index;
    int mapIndex;
    int matches;
    u8 bank;
    int offset;
    s32 result;

    matches = 0;
    result = 0;
    mapIndex = filePage.inode.page / 4 +
               (filePage.inode.bank % 8) * 32;
    for (bank = 0; bank < pfs->banks; bank++) {
        offset = bank > 0 ? 1 : pfs->inode_start_page;
        if (bank == filePage.inode.bank ||
            cache->map[mapIndex] & (1 << (bank % 8))) {
            if (bank != cache->bank) {
                result = __osPfsRWInode(pfs, &cache->inode, 0, bank);
                if (result != 0 && result != 3) {
                    return result;
                }
                cache->bank = bank;
            }
            for (index = offset; matches < 2 && index < 128; index++) {
                if (cache->inode.inode_page[index].ipage ==
                    filePage.ipage) {
                    matches++;
                }
            }
            if (matches >= 2) {
                return 2;
            }
        }
    }
    return matches;
}
