#include "pfs.h"

s32 osPfsFindFile(OSPfs* pfs, u16 companyCode, u32 gameCode,
                  u8* gameName, u8* extName, s32* fileNo) {
    s32 directoryIndex;
    int characterIndex;
    OSDir directory;
    s32 result = 0;
    int mismatch;

    if (__osCheckId(pfs) == 2) {
        return 2;
    }
    for (directoryIndex = 0; directoryIndex < pfs->dir_size;
         directoryIndex++) {
        result = __osContRamRead(pfs->queue, pfs->channel,
                                 pfs->dir_table + directoryIndex,
                                 (u8*)&directory);
        if (result != 0) {
            return result;
        }
        if (directory.company_code == companyCode &&
            directory.game_code == gameCode) {
            mismatch = 0;
            if (gameName != (u8*)0) {
                for (characterIndex = 0; characterIndex < 16;
                     characterIndex++) {
                    if (directory.game_name[characterIndex] !=
                        gameName[characterIndex]) {
                        mismatch = 1;
                        break;
                    }
                }
            }
            if (extName != (u8*)0 && !mismatch) {
                for (characterIndex = 0; characterIndex < 4;
                     characterIndex++) {
                    if (directory.ext_name[characterIndex] !=
                        extName[characterIndex]) {
                        mismatch = 1;
                        break;
                    }
                }
            }
            if (!mismatch) {
                *fileNo = directoryIndex;
                return result;
            }
        }
    }
    *fileNo = -1;
    return 5;
}
