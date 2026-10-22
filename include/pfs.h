#ifndef MADDEN64_PFS_H
#define MADDEN64_PFS_H

#include "os_internal.h"

typedef struct OSPfs {
    s32 status;
    OSMesgQueue* queue;
    s32 channel;
    u8 id[32];
    u8 label[32];
    s32 version;
    s32 dir_size;
    s32 inode_table;
    s32 minode_table;
    s32 dir_table;
    s32 inode_start_page;
    u8 banks;
    u8 activebank;
} OSPfs;

typedef union OSInodeUnit {
    struct {
        u8 bank;
        u8 page;
    } inode;
    u16 ipage;
} OSInodeUnit;

typedef struct OSInode {
    OSInodeUnit inode_page[128];
} OSInode;

typedef struct OSDir {
    u32 game_code;
    u16 company_code;
    OSInodeUnit start_page;
    u8 status;
    s8 reserved;
    u16 data_sum;
    u8 ext_name[4];
    u8 game_name[16];
} OSDir;

typedef struct OSPfsState {
    u32 file_size;
    u32 game_code;
    u16 company_code;
    u8 ext_name[4];
    u8 game_name[16];
} OSPfsState;

typedef struct OSPackId {
    u32 repaired;
    u32 random;
    u64 serial_mid;
    u64 serial_low;
    u16 deviceid;
    u8 banks;
    u8 version;
    u16 checksum;
    u16 inverted_checksum;
} OSPackId;

extern s32 __osCheckId(OSPfs* pfs);
extern s32 __osPfsRWInode(OSPfs* pfs, OSInode* inode, u8 flag, u8 bank);
extern s32 __osPfsSelectBank(OSPfs* pfs);
extern s32 __osContRamRead(OSMesgQueue* queue, s32 channel, u16 address, u8* buffer);
extern s32 __osContRamWrite(OSMesgQueue* queue, s32 channel, u16 address,
                            u8* buffer, s32 force);
extern u16 __osSumcalc(u8* buffer, s32 length);
extern s32 __osBlockSum(OSPfs* pfs, u8 page, u16* sum, u8 bank);
extern s32 __osPfsReleasePages(OSPfs* pfs, OSInode* inode, u8 startPage,
                               u16* sum, u8 bank, OSInodeUnit* finalPage,
                               int flag);
extern s32 osPfsFindFile(OSPfs* pfs, u16 companyCode, u32 gameCode,
                         u8* gameName, u8* extName, s32* fileNo);
extern s32 osPfsFreeBlocks(OSPfs* pfs, s32* bytesNotUsed);
extern s32 __osPfsDeclearPage(OSPfs* pfs, OSInode* inode, int pageCount,
                              int* firstPage, u8 bank, int* allocated,
                              int* lastPage);
extern void __osSiGetAccess(void);
extern void __osSiRelAccess(void);
extern s32 __osPfsGetStatus(OSMesgQueue* queue, s32 channel);
extern s32 __osIdCheckSum(u16* words, u16* checksum,
                          u16* invertedChecksum);
extern s32 __osCheckPackId(OSPfs* pfs, OSPackId* id);
extern s32 __osRepairPackId(OSPfs* pfs, OSPackId* badId,
                            OSPackId* newId);
extern s32 osPfsChecker(OSPfs* pfs);

#endif
