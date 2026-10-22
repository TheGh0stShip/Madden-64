#include "pfs.h"

s32 __osGetId(OSPfs* pfs) {
    int index;
    u16 checksum;
    u16 invertedChecksum;
    u8 data[32];
    OSPackId repairedId;
    s32 result;
    OSPackId* id;

    if (pfs->activebank != 0) {
        pfs->activebank = 0;
        result = __osPfsSelectBank(pfs);
        if (result != 0) {
            return result;
        }
    }
    result = __osContRamRead(pfs->queue, pfs->channel, 1, data);
    if (result != 0) {
        return result;
    }
    __osIdCheckSum((u16*)data, &checksum, &invertedChecksum);
    id = (OSPackId*)data;
    if (id->checksum != checksum ||
        id->inverted_checksum != invertedChecksum) {
        result = __osCheckPackId(pfs, id);
        if (result == 10) {
            result = __osRepairPackId(pfs, id, &repairedId);
            if (result != 0) {
                return result;
            }
            id = &repairedId;
        } else if (result != 0) {
            return result;
        }
    }
    if ((id->deviceid & 1) == 0) {
        result = __osRepairPackId(pfs, id, &repairedId);
        if (result != 0) {
            return result;
        }
        id = &repairedId;
        if ((id->deviceid & 1) == 0) {
            return 11;
        }
    }
    for (index = 0; index < 32; index++) {
        pfs->id[index] = ((u8*)id)[index];
    }
    pfs->version = id->version;
    pfs->banks = id->banks;
    pfs->inode_start_page = 1 + 2 + 2 * pfs->banks;
    pfs->dir_size = 16;
    pfs->inode_table = 8;
    pfs->minode_table = (1 + pfs->banks) * 8;
    pfs->dir_table = pfs->minode_table + pfs->banks * 8;
    result = __osContRamRead(pfs->queue, pfs->channel, 7, pfs->label);
    if (result != 0) {
        return result;
    }
    return 0;
}
