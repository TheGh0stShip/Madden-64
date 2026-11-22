#include "types.h"

typedef struct {
    u8 pad00[0x68];
} Pfs;

typedef struct {
    u8 pad00[4];
    s32 size;
    s32 checksum;
    u8 data[1];
} SaveImage;

extern u16 D_800C5098;
extern u16 D_800C4AD0;
extern u16 D_800C4EE8;
extern SaveImage *D_80084F28;
extern s16 D_80084F6C;
extern Pfs D_80085860[];

void *func_80032E00(s32, s32);
void func_80032F3C(s32, void *);
s32 func_80048FF8(Pfs *, s32, s32, char *, char *, s32, s32 *);
s32 func_800497A8(Pfs *, s32, s32, char *, char *);
s32 func_8004B594(Pfs *, s32, s32, s32, s32, void *);
s32 func_8004BBF8(Pfs *, s32, s32, char *, char *, s32 *);
void overlay5_runtime_system_initialize(void);
void overlay5_runtime_selected_record_process(void);
void func_800E2480(void);
s32 func_800E24A0(u8 *, s32);
s16 overlay5_runtime_result_translate(s32);
void overlay5_string_identifier_advance(char *, char *);
void overlay5_packed_text_encode(char *, char *, s32);
s16 func_800E2B44(void *);

s16 func_800E17A8(void) {
    char name[17] = "MADDEN64\0\0\0\0\0\0\0\0";
    char ext[5] = "0\0\0\0";
    char game_name[16];
    char ext_name[8];
    s32 file_no;
    s16 result;
    s32 size;
    void *buffer;
    SaveImage *image;

    overlay5_runtime_system_initialize();
    overlay5_runtime_selected_record_process();
    if (D_800C5098 == 0xA55A) {
        strcpy(name + 8, "-SEAS");
    } else if (D_800C4AD0 == 0xA5A5) {
        strcpy(name + 8, "-DRAFT");
    } else if (D_800C4EE8 == 0x5AA5) {
        strcpy(name + 8, "-TOUR");
    } else {
        strcpy(name + 8, "-SET");
    }
    overlay5_string_identifier_advance(name, ext);
    overlay5_packed_text_encode(game_name, name, 16);
    overlay5_packed_text_encode(ext_name, ext, 4);
    image = D_80084F28;
    image->checksum = func_800E24A0(image->data, image->size - 12);
    size = 0x7B00;
    result = overlay5_runtime_result_translate(func_80048FF8(&D_80085860[D_80084F6C], 0x3639, 0x4E384D45,
                                                             game_name, ext_name, size, &file_no));
    if (result != 0) {
        func_800E2480();
        return result;
    }
    buffer = func_80032E00(0, 0x7B00);
    if (func_800E2B44(buffer) == 0) {
        char unused[8];

        result = overlay5_runtime_result_translate(
            func_8004B594(&D_80085860[D_80084F6C], file_no, 1, 0, size, buffer));
    } else {
        result = 2;
    }
    if (result != 0) {
        func_800497A8(&D_80085860[D_80084F6C], 0x3639, 0x4E384D45, game_name, ext_name);
    } else {
        result = overlay5_runtime_result_translate(
            func_8004BBF8(&D_80085860[D_80084F6C], 0x3639, 0x4E384D45, game_name, ext_name, &file_no));
    }
    func_80032F3C(0, buffer);
    func_800E2480();
    return result;
}
