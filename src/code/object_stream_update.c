#include "types.h"

/* IJG libjpeg 6a jmemmgr.c: realize_virt_arrays(). */

typedef u32 JDIMENSION;
typedef u8 JSAMPLE;
typedef s16 JCOEF;
typedef JCOEF JBLOCK[64];
typedef JSAMPLE **JSAMPARRAY;
typedef JBLOCK **JBLOCKARRAY;

typedef struct jpeg_common_struct *j_common_ptr;
typedef struct jvirt_sarray_control *jvirt_sarray_ptr;
typedef struct jvirt_barray_control *jvirt_barray_ptr;

struct backing_store_struct {
    u8 opaque[0x100];
};

struct jvirt_sarray_control {
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
};

struct jvirt_barray_control {
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
};

struct jpeg_memory_mgr_private {
    u8 public_methods[0x40];
    jvirt_sarray_ptr virt_sarray_list;
    jvirt_barray_ptr virt_barray_list;
    long total_space_allocated;
    JDIMENSION last_rowsperchunk;
};

struct jpeg_common_struct {
    void *err;
    struct jpeg_memory_mgr_private *mem;
};

extern long func_800649B0(j_common_ptr cinfo, long min_bytes_needed,
                          long max_bytes_needed, long already_allocated);
extern void func_800649B8(j_common_ptr cinfo,
                          struct backing_store_struct *info,
                          long total_bytes_needed);
extern JSAMPARRAY func_8006389C(j_common_ptr cinfo, s32 pool_id,
                                JDIMENSION samplesperrow,
                                JDIMENSION numrows);
extern JBLOCKARRAY func_800639CC(j_common_ptr cinfo, s32 pool_id,
                                 JDIMENSION blocksperrow,
                                 JDIMENSION numrows);

void object_stream_update(j_common_ptr cinfo)
{
    struct jpeg_memory_mgr_private *mem = cinfo->mem;
    long space_per_minheight, maximum_space, avail_mem;
    long minheights, max_minheights;
    jvirt_sarray_ptr sptr;
    jvirt_barray_ptr bptr;

    space_per_minheight = 0;
    maximum_space = 0;
    for (sptr = mem->virt_sarray_list; sptr != 0; sptr = sptr->next) {
        if (sptr->mem_buffer == 0) {
            space_per_minheight += (long) sptr->maxaccess *
                                   (long) sptr->samplesperrow * sizeof(JSAMPLE);
            maximum_space += (long) sptr->rows_in_array *
                             (long) sptr->samplesperrow * sizeof(JSAMPLE);
        }
    }
    for (bptr = mem->virt_barray_list; bptr != 0; bptr = bptr->next) {
        if (bptr->mem_buffer == 0) {
            space_per_minheight += (long) bptr->maxaccess *
                                   (long) bptr->blocksperrow * sizeof(JBLOCK);
            maximum_space += (long) bptr->rows_in_array *
                             (long) bptr->blocksperrow * sizeof(JBLOCK);
        }
    }

    if (space_per_minheight <= 0)
        return;

    avail_mem = func_800649B0(cinfo, space_per_minheight, maximum_space,
                              mem->total_space_allocated);

    if (avail_mem >= maximum_space)
        max_minheights = 1000000000L;
    else {
        max_minheights = avail_mem / space_per_minheight;
        if (max_minheights <= 0)
            max_minheights = 1;
    }

    for (sptr = mem->virt_sarray_list; sptr != 0; sptr = sptr->next) {
        if (sptr->mem_buffer == 0) {
            minheights = ((long) sptr->rows_in_array - 1L) /
                         sptr->maxaccess + 1L;
            if (minheights <= max_minheights) {
                sptr->rows_in_mem = sptr->rows_in_array;
            } else {
                sptr->rows_in_mem = (JDIMENSION)
                    (max_minheights * sptr->maxaccess);
                func_800649B8(cinfo, &sptr->b_s_info,
                              (long) sptr->rows_in_array *
                              (long) sptr->samplesperrow *
                              (long) sizeof(JSAMPLE));
                sptr->b_s_open = 1;
            }
            sptr->mem_buffer = func_8006389C(cinfo, 1,
                                              sptr->samplesperrow,
                                              sptr->rows_in_mem);
            sptr->rowsperchunk = mem->last_rowsperchunk;
            sptr->cur_start_row = 0;
            sptr->first_undef_row = 0;
            sptr->dirty = 0;
        }
    }

    for (bptr = mem->virt_barray_list; bptr != 0; bptr = bptr->next) {
        if (bptr->mem_buffer == 0) {
            minheights = ((long) bptr->rows_in_array - 1L) /
                         bptr->maxaccess + 1L;
            if (minheights <= max_minheights) {
                bptr->rows_in_mem = bptr->rows_in_array;
            } else {
                bptr->rows_in_mem = (JDIMENSION)
                    (max_minheights * bptr->maxaccess);
                func_800649B8(cinfo, &bptr->b_s_info,
                              (long) bptr->rows_in_array *
                              (long) bptr->blocksperrow *
                              (long) sizeof(JBLOCK));
                bptr->b_s_open = 1;
            }
            bptr->mem_buffer = func_800639CC(cinfo, 1,
                                              bptr->blocksperrow,
                                              bptr->rows_in_mem);
            bptr->rowsperchunk = mem->last_rowsperchunk;
            bptr->cur_start_row = 0;
            bptr->first_undef_row = 0;
            bptr->dirty = 0;
        }
    }
}
