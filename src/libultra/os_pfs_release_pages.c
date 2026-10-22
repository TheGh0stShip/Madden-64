#include "pfs.h"

s32 __osPfsReleasePages(OSPfs* pfs, OSInode* inode, u8 startPage,
                        u16* sum, u8 bank, OSInodeUnit* finalPage, int flag) {
    OSInodeUnit nextPage;
    OSInodeUnit oldPage;
    s32 result = 0;
    int offset;

    nextPage = inode->inode_page[startPage];
    if (nextPage.ipage != 1) {
        if (nextPage.inode.bank > 0) {
            offset = 1;
        } else {
            offset = pfs->inode_start_page;
        }
    } else {
        if (bank > 0) {
            offset = 1;
        } else {
            offset = pfs->inode_start_page;
        }
    }
    if (nextPage.inode.page < offset && nextPage.ipage != 1) {
        return 3;
    }
    *finalPage = nextPage;
    if (flag == 1) {
        inode->inode_page[startPage].ipage = 3;
    }
    result = __osBlockSum(pfs, startPage, sum, bank);
    if (result != 0) {
        return result;
    }
    if (nextPage.ipage == 1) {
        return 0;
    }
    while (nextPage.ipage >= pfs->inode_start_page) {
        oldPage = nextPage;
        nextPage = inode->inode_page[nextPage.inode.page];
        inode->inode_page[oldPage.inode.page].ipage = 3;
        result = __osBlockSum(pfs, oldPage.inode.page, sum, bank);
        if (result != 0) {
            return result;
        }
        if (nextPage.inode.bank != bank) {
            break;
        }
    }
    if (nextPage.ipage >= pfs->inode_start_page) {
        inode->inode_page[nextPage.inode.page].ipage = 3;
    }
    *finalPage = nextPage;
    return 0;
}
