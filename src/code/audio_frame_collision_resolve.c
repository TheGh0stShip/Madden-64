#include "types.h"

typedef struct AudioFrameSmallRecord {
    u8 bytes[40];
} AudioFrameSmallRecord;

extern void *func_80037258(u16 *indices);
extern void func_80037290(void *state);
extern u8 func_8003C1F8(u16 *indices, AudioFrameSmallRecord *records,
                       u32 value, u32 tag);
extern void audio_frame_record_copy(u32 index,
                                    AudioFrameSmallRecord *destination);

void audio_frame_collision_resolve(u16 *indices,
                                   AudioFrameSmallRecord *records)
{
    register u16 *index_cursor __asm__("$16") = indices;
    register AudioFrameSmallRecord *record_cursor __asm__("$17") = records;
    register u16 *base_indices __asm__("$22") = indices;
    register AudioFrameSmallRecord *base_records __asm__("$21") = records;
    void *state;
    s16 i;
    s16 j;
    s32 outer_index;

    __asm__("" : "=r"(index_cursor), "=r"(record_cursor),
                   "=r"(base_indices), "=r"(base_records)
             : "0"(index_cursor), "1"(record_cursor),
               "2"(base_indices), "3"(base_records));
    state = func_80037258(indices);
    for (i = 0; i < 55; i++) {
        audio_frame_record_copy(*index_cursor++, record_cursor++);
    }
    func_80037290(state);

    i = 0;
    {
        register u32 sentinel __asm__("$23") = 0xFFFF;
        __asm__("" : "=r"(sentinel) : "0"(sentinel));
        for (; i < 54; i++) {
            AudioFrameSmallRecord *first;
            if (base_indices[i] == sentinel) {
                break;
            }
            j = i + 1;
            outer_index = i;
            if (j < 55) {
                AudioFrameSmallRecord *second;
                first = (AudioFrameSmallRecord *)
                    ((u32)(outer_index * 40) + (u32)base_records);
                while (j < 55) {
                    register u32 first_tag __asm__("$8");
                    register u32 second_tag __asm__("$7");
                    if (base_indices[j] == sentinel) {
                        break;
                    }
                    if (outer_index != j) {
                        second = (AudioFrameSmallRecord *)
                            ((u32)(j * 40) + (u32)base_records);
                        __asm__("" : "=r"(second) : "0"(second));
                        first_tag = first->bytes[13];
                        second_tag = second->bytes[13];
                        if (first_tag == second_tag) {
                            __asm__("" : "=r"(first_tag) : "0"(first_tag));
                            if (j < outer_index) {
                                first->bytes[13] = func_8003C1F8(
                                    base_indices, base_records,
                                    first->bytes[14] & 0x3F, first_tag);
                            } else {
                                second->bytes[13] = func_8003C1F8(
                                    base_indices, base_records,
                                    second->bytes[14] & 0x3F, second_tag);
                            }
                        }
                    }
                    j++;
                }
            }
        }
    }
}
