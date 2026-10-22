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

extern s32 __osCheckId(OSPfs* pfs);
extern s32 __osPfsRWInode(OSPfs* pfs, OSInode* inode, u8 flag, u8 bank);
extern s32 __osPfsSelectBank(OSPfs* pfs);
extern s32 __osContRamRead(OSMesgQueue* queue, s32 channel, u16 address, u8* buffer);
extern u16 __osSumcalc(u8* buffer, s32 length);

#endif
