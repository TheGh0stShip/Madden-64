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

extern s32 __osCheckId(OSPfs* pfs);
extern s32 __osPfsRWInode(OSPfs* pfs, OSInode* inode, u8 flag, u8 bank);

#endif
