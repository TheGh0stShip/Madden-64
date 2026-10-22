#include "pfs.h"

s32 osPfsInitPak(OSMesgQueue* queue, OSPfs* pfs, int channel) {
    int index;
    s32 result = 0;
    u16 checksum;
    u16 invertedChecksum;
    u8 data[32];
    OSPackId* id;
    OSPackId repairedId;

    __osSiGetAccess();
    result = __osPfsGetStatus(queue, channel);
    __osSiRelAccess();
    if (result != 0) {
        return result;
    }
    pfs->queue = queue;
    pfs->channel = channel;
    pfs->status = 0;
    pfs->activebank = 0;
    result = __osPfsSelectBank(pfs);
    if (result != 0) {
        return result;
    }
    __osIdCheckSum((u16*)data, &checksum, &invertedChecksum);
    id = (OSPackId*)data;
    if (id->checksum != checksum ||
        id->inverted_checksum != invertedChecksum) {
        result = __osCheckPackId(pfs, id);
        if (result != 0) {
            return result;
        }
        if (result != 0) {
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
    pfs->dir_size = 2 * 8;
    pfs->inode_table = 1 * 8;
    pfs->minode_table = (1 + pfs->banks) * 8;
    pfs->dir_table = pfs->minode_table + pfs->banks * 8;
    result = __osContRamRead(pfs->queue, pfs->channel, 7, pfs->label);
    if (result != 0) {
        return result;
    }
    result = osPfsChecker(pfs);
    pfs->status |= 1;
    return result;
}
