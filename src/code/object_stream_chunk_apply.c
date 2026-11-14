/* IJG libjpeg 6a jmemmgr.c: do_sarray_io() and do_barray_io(). */
#include "types.h"

#ifndef FUNCTION
#define FUNCTION func_80063F60
#endif
#ifndef SIZE_SHIFT
#define SIZE_SHIFT 0
#endif

typedef u32 JDIMENSION;
typedef u8 JSAMPLE;
typedef s16 JCOEF;
typedef JCOEF JBLOCK[64];
typedef JSAMPLE *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;
typedef JBLOCK *JBLOCKROW;
typedef JBLOCKROW *JBLOCKARRAY;
typedef struct jpeg_common_struct *j_common_ptr;

typedef void (*backing_store_io)(j_common_ptr cinfo, void *info,
                                 void *buffer_address, long file_offset,
                                 long byte_count);
struct backing_store_struct {
    backing_store_io read_backing_store;
    backing_store_io write_backing_store;
    void *close_backing_store;
};

#if SIZE_SHIFT
typedef struct jvirt_barray_control {
    JBLOCKARRAY mem_buffer;
    JDIMENSION rows_in_array;
    JDIMENSION blocksperrow;
    JDIMENSION maxaccess;
    JDIMENSION rows_in_mem;
    JDIMENSION rowsperchunk;
    JDIMENSION cur_start_row;
    JDIMENSION first_undef_row;
    s32 pre_zero;
    s32 dirty;
    s32 b_s_open;
    struct jvirt_barray_control *next;
    struct backing_store_struct b_s_info;
} *virtual_array_ptr;
#else
typedef struct jvirt_sarray_control {
    JSAMPARRAY mem_buffer;
    JDIMENSION rows_in_array;
    JDIMENSION samplesperrow;
    JDIMENSION maxaccess;
    JDIMENSION rows_in_mem;
    JDIMENSION rowsperchunk;
    JDIMENSION cur_start_row;
    JDIMENSION first_undef_row;
    s32 pre_zero;
    s32 dirty;
    s32 b_s_open;
    struct jvirt_sarray_control *next;
    struct backing_store_struct b_s_info;
} *virtual_array_ptr;
#endif

void FUNCTION(j_common_ptr cinfo, virtual_array_ptr ptr, s32 writing)
{
    long bytesperrow, file_offset, byte_count, rows, thisrow, i;

#if SIZE_SHIFT
    bytesperrow = (long)ptr->blocksperrow * sizeof(JBLOCK);
#else
    bytesperrow = (long)ptr->samplesperrow * sizeof(JSAMPLE);
#endif
    file_offset = ptr->cur_start_row * bytesperrow;
    for (i = 0; i < (long)ptr->rows_in_mem; i += ptr->rowsperchunk) {
        rows = (long)ptr->rowsperchunk < (long)ptr->rows_in_mem - i ?
               (long)ptr->rowsperchunk : (long)ptr->rows_in_mem - i;
        thisrow = (long)ptr->cur_start_row + i;
        rows = rows < (long)ptr->first_undef_row - thisrow ?
               rows : (long)ptr->first_undef_row - thisrow;
        rows = rows < (long)ptr->rows_in_array - thisrow ?
               rows : (long)ptr->rows_in_array - thisrow;
        if (rows <= 0)
            break;
        byte_count = rows * bytesperrow;
        if (writing)
            (*ptr->b_s_info.write_backing_store)(cinfo, &ptr->b_s_info,
                                                  ptr->mem_buffer[i],
                                                  file_offset, byte_count);
        else
            (*ptr->b_s_info.read_backing_store)(cinfo, &ptr->b_s_info,
                                                 ptr->mem_buffer[i],
                                                 file_offset, byte_count);
        file_offset += byte_count;
    }
}
