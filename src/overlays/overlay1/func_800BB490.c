#include "types.h"

typedef struct {
    s32 words[11];
} Roster;

typedef struct {
    u32 frames;
    u32 keys;
    u16 unk08;
    u16 mirrored;
    u16 length;
    u16 unk0E;
    s32 unk10;
    s32 unk14;
    Roster roster;
    u8 sounds[4];
    u8 pad48[4];
} PlayHeader;

typedef struct {
    s32 pos[4];
    u16 rot[4];
    u16 time;
    u16 kind;
} KeyRecord;

typedef struct {
    u8 pad00[0x20];
    u16 time;
} Key;

typedef struct {
    u8 pad00[4];
    u16 unk04;
    u16 mirrored;
    u16 length;
    u16 unk0A;
    s32 unk0C;
    s32 unk10;
    Roster roster;
    u8 frames[0x2500];
    u8 paths[0x4560];
    u8 moves[0xF2D0];
    u8 sets[0x8AC];
    u8 tags[0x3CB4];
    u8 flags[1];
} Track;

extern Track *D_800718E8;

void func_80034D30();
u8 *func_80035D7C(u16);
void func_80035F88(u16, s32);
void func_8004DF68(void *, void *, u32);
Key *func_800B7004(KeyRecord *, u16 *, u16);

void func_800BB490(u16 id, s32 arg1) {
    u8 *data = func_80035D7C(id);
    PlayHeader *hdr = (PlayHeader *)data;
    u32 frames = hdr->frames;
    u32 keys = hdr->keys;
    KeyRecord *rec;
    u32 eighth;
    u32 rest;
    u32 i;

    D_800718E8->unk04 = hdr->unk08;
    D_800718E8->mirrored = hdr->mirrored;
    D_800718E8->length = hdr->length;
    D_800718E8->unk0A = hdr->unk0E;
    D_800718E8->unk0C = hdr->unk10;
    D_800718E8->unk10 = hdr->unk14;
    D_800718E8->roster = hdr->roster;
    if (hdr->sounds[0] != 0xFF) {
        func_80034D30(hdr->sounds[0] << 8, 2, 0);
    }
    if (hdr->sounds[1] != 0xFF) {
        func_80034D30(hdr->sounds[1] << 8, 2, 0);
    }
    if (hdr->sounds[2] != 0xFF) {
        func_80034D30(hdr->sounds[2] << 8, 2, 0);
    }
    if (hdr->sounds[3] != 0xFF) {
        func_80034D30(hdr->sounds[3] << 8, 2, 0);
    }
    data += sizeof(PlayHeader);
    func_8004DF68(D_800718E8->frames, data, frames * 16);
    data += frames * 16;
    func_8004DF68(D_800718E8->paths, data, (eighth = frames >> 3) * 240);
    data += eighth * 240;
    func_8004DF68(D_800718E8->moves, data, (rest = frames - eighth) * 120);
    data += rest * 120;
    func_8004DF68(D_800718E8->sets, data, eighth * 30);
    data += eighth * 30;
    func_8004DF68(D_800718E8->tags, data, rest * 30);
    data += rest * 30;
    rec = (KeyRecord *)(data + frames);
    func_8004DF68(D_800718E8->flags, data, frames);
    for (i = 0; i < keys; i++) {
        func_800B7004(rec, rec->rot, rec->kind)->time = rec->time;
        rec++;
    }
    func_80035F88(id, arg1);
}
