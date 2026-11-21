#include "types.h"
typedef unsigned int size_t;
typedef unsigned char JSAMPLE;
typedef short JCOEF;
typedef unsigned char JOCTET;
typedef unsigned char UINT8;
typedef unsigned short UINT16;
typedef unsigned int JDIMENSION;
typedef int boolean;
typedef JSAMPLE *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;
typedef JSAMPARRAY *JSAMPIMAGE;
typedef JCOEF JBLOCK[64];
typedef JBLOCK *JBLOCKROW;
typedef JBLOCKROW *JBLOCKARRAY;
typedef JCOEF *JCOEFPTR;
typedef struct {
  UINT16 quantval[64];
  boolean sent_table;
} JQUANT_TBL;
typedef struct {
  UINT8 bits[17];
  UINT8 huffval[256];
  boolean sent_table;
} JHUFF_TBL;
typedef struct {
  int component_id;
  int component_index;
  int h_samp_factor;
  int v_samp_factor;
  int quant_tbl_no;
  int dc_tbl_no;
  int ac_tbl_no;
  JDIMENSION width_in_blocks;
  JDIMENSION height_in_blocks;
  int DCT_scaled_size;
  JDIMENSION downsampled_width;
  JDIMENSION downsampled_height;
  boolean component_needed;
  int MCU_width;
  int MCU_height;
  int MCU_blocks;
  int MCU_sample_width;
  int last_col_width;
  int last_row_height;
  JQUANT_TBL * quant_table;
  void * dct_table;
} jpeg_component_info;
typedef enum {
 JCS_UNKNOWN,
 JCS_GRAYSCALE,
 JCS_RGB,
 JCS_YCbCr,
 JCS_CMYK,
 JCS_YCCK
} J_COLOR_SPACE;
typedef enum {
 JDCT_ISLOW,
 JDCT_IFAST,
 JDCT_FLOAT
} J_DCT_METHOD;
typedef enum {
 JDITHER_NONE,
 JDITHER_ORDERED,
 JDITHER_FS
} J_DITHER_MODE;
struct jpeg_common_struct {
  struct jpeg_error_mgr * err; struct jpeg_memory_mgr * mem; struct jpeg_progress_mgr * progress; boolean is_decompressor; int global_state;
};
typedef struct jpeg_common_struct * j_common_ptr;
typedef struct jpeg_decompress_struct * j_decompress_ptr;
struct jpeg_decompress_struct {
  struct jpeg_error_mgr * err; struct jpeg_memory_mgr * mem; struct jpeg_progress_mgr * progress; boolean is_decompressor; int global_state;
  struct jpeg_source_mgr * src;
  JDIMENSION image_width;
  JDIMENSION image_height;
  int num_components;
  J_COLOR_SPACE jpeg_color_space;
  J_COLOR_SPACE out_color_space;
  unsigned int scale_num, scale_denom;
  double output_gamma;
  boolean buffered_image;
  boolean raw_data_out;
  J_DCT_METHOD dct_method;
  boolean do_fancy_upsampling;
  boolean do_block_smoothing;
  boolean quantize_colors;
  J_DITHER_MODE dither_mode;
  boolean two_pass_quantize;
  int desired_number_of_colors;
  boolean enable_1pass_quant;
  boolean enable_external_quant;
  boolean enable_2pass_quant;
  JDIMENSION output_width;
  JDIMENSION output_height;
  int out_color_components;
  int output_components;
  int rec_outbuf_height;
  int actual_number_of_colors;
  JSAMPARRAY colormap;
  JDIMENSION output_scanline;
  int input_scan_number;
  JDIMENSION input_iMCU_row;
  int output_scan_number;
  JDIMENSION output_iMCU_row;
  int (*coef_bits)[64];
  JQUANT_TBL * quant_tbl_ptrs[4];
  JHUFF_TBL * dc_huff_tbl_ptrs[4];
  JHUFF_TBL * ac_huff_tbl_ptrs[4];
  int data_precision;
  jpeg_component_info * comp_info;
  boolean progressive_mode;
  boolean arith_code;
  UINT8 arith_dc_L[16];
  UINT8 arith_dc_U[16];
  UINT8 arith_ac_K[16];
  unsigned int restart_interval;
  boolean saw_JFIF_marker;
  UINT8 density_unit;
  UINT16 X_density;
  UINT16 Y_density;
  boolean saw_Adobe_marker;
  UINT8 Adobe_transform;
  boolean CCIR601_sampling;
  int max_h_samp_factor;
  int max_v_samp_factor;
  int min_DCT_scaled_size;
  JDIMENSION total_iMCU_rows;
  JSAMPLE * sample_range_limit;
  int comps_in_scan;
  jpeg_component_info * cur_comp_info[4];
  JDIMENSION MCUs_per_row;
  JDIMENSION MCU_rows_in_scan;
  int blocks_in_MCU;
  int MCU_membership[10];
  int Ss, Se, Ah, Al;
  int unread_marker;
  struct jpeg_decomp_master * master;
  struct jpeg_d_main_controller * main;
  struct jpeg_d_coef_controller * coef;
  struct jpeg_d_post_controller * post;
  struct jpeg_input_controller * inputctl;
  struct jpeg_marker_reader * marker;
  struct jpeg_entropy_decoder * entropy;
  struct jpeg_inverse_dct * idct;
  struct jpeg_upsampler * upsample;
  struct jpeg_color_deconverter * cconvert;
  struct jpeg_color_quantizer * cquantize;
};
struct jpeg_error_mgr {
  void (*error_exit) (j_common_ptr cinfo);
  void (*emit_message) (j_common_ptr cinfo, int msg_level);
  void (*output_message) (j_common_ptr cinfo);
  void (*format_message) (j_common_ptr cinfo, char * buffer);
  void (*reset_error_mgr) (j_common_ptr cinfo);
  int msg_code;
  union {
    int i[8];
    char s[80];
  } msg_parm;
  int trace_level;
  long num_warnings;
  const char * const * jpeg_message_table;
  int last_jpeg_message;
  const char * const * addon_message_table;
  int first_addon_message;
  int last_addon_message;
};
struct jpeg_progress_mgr {
  void (*progress_monitor) (j_common_ptr cinfo);
  long pass_counter;
  long pass_limit;
  int completed_passes;
  int total_passes;
};
struct jpeg_source_mgr {
  const JOCTET * next_input_byte;
  size_t bytes_in_buffer;
  void (*init_source) (j_decompress_ptr cinfo);
  boolean (*fill_input_buffer) (j_decompress_ptr cinfo);
  void (*skip_input_data) (j_decompress_ptr cinfo, long num_bytes);
  boolean (*resync_to_restart) (j_decompress_ptr cinfo, int desired);
  void (*term_source) (j_decompress_ptr cinfo);
};
typedef struct jvirt_sarray_control * jvirt_sarray_ptr;
typedef struct jvirt_barray_control * jvirt_barray_ptr;
struct jpeg_memory_mgr {
  void * (*alloc_small) (j_common_ptr cinfo, int pool_id, size_t sizeofobject);
  void * (*alloc_large) (j_common_ptr cinfo, int pool_id, size_t sizeofobject);
  JSAMPARRAY (*alloc_sarray) (j_common_ptr cinfo, int pool_id, JDIMENSION samplesperrow, JDIMENSION numrows);
  JBLOCKARRAY (*alloc_barray) (j_common_ptr cinfo, int pool_id, JDIMENSION blocksperrow, JDIMENSION numrows);
  jvirt_sarray_ptr (*request_virt_sarray) (j_common_ptr cinfo, int pool_id, boolean pre_zero, JDIMENSION samplesperrow, JDIMENSION numrows, JDIMENSION maxaccess);
  jvirt_barray_ptr (*request_virt_barray) (j_common_ptr cinfo, int pool_id, boolean pre_zero, JDIMENSION blocksperrow, JDIMENSION numrows, JDIMENSION maxaccess);
  void (*realize_virt_arrays) (j_common_ptr cinfo);
  JSAMPARRAY (*access_virt_sarray) (j_common_ptr cinfo, jvirt_sarray_ptr ptr, JDIMENSION start_row, JDIMENSION num_rows, boolean writable);
  JBLOCKARRAY (*access_virt_barray) (j_common_ptr cinfo, jvirt_barray_ptr ptr, JDIMENSION start_row, JDIMENSION num_rows, boolean writable);
  void (*free_pool) (j_common_ptr cinfo, int pool_id);
  void (*self_destruct) (j_common_ptr cinfo);
  long max_memory_to_use;
};
typedef boolean (*jpeg_marker_parser_method) (j_decompress_ptr cinfo);
typedef enum {
 JBUF_PASS_THRU,
 JBUF_SAVE_SOURCE,
 JBUF_CRANK_DEST,
 JBUF_SAVE_AND_PASS
} J_BUF_MODE;
struct jpeg_decomp_master {
  void (*prepare_for_output_pass) (j_decompress_ptr cinfo);
  void (*finish_output_pass) (j_decompress_ptr cinfo);
  boolean is_dummy_pass;
};
struct jpeg_input_controller {
  int (*consume_input) (j_decompress_ptr cinfo);
  void (*reset_input_controller) (j_decompress_ptr cinfo);
  void (*start_input_pass) (j_decompress_ptr cinfo);
  void (*finish_input_pass) (j_decompress_ptr cinfo);
  boolean has_multiple_scans;
  boolean eoi_reached;
};
struct jpeg_d_main_controller {
  void (*start_pass) (j_decompress_ptr cinfo, J_BUF_MODE pass_mode);
  void (*process_data) (j_decompress_ptr cinfo, JSAMPARRAY output_buf, JDIMENSION *out_row_ctr, JDIMENSION out_rows_avail);
};
struct jpeg_d_coef_controller {
  void (*start_input_pass) (j_decompress_ptr cinfo);
  int (*consume_data) (j_decompress_ptr cinfo);
  void (*start_output_pass) (j_decompress_ptr cinfo);
  int (*decompress_data) (j_decompress_ptr cinfo, JSAMPIMAGE output_buf);
  jvirt_barray_ptr *coef_arrays;
};
struct jpeg_d_post_controller {
  void (*start_pass) (j_decompress_ptr cinfo, J_BUF_MODE pass_mode);
  void (*post_process_data) (j_decompress_ptr cinfo, JSAMPIMAGE input_buf, JDIMENSION *in_row_group_ctr, JDIMENSION in_row_groups_avail, JSAMPARRAY output_buf, JDIMENSION *out_row_ctr, JDIMENSION out_rows_avail);
};
struct jpeg_marker_reader {
  void (*reset_marker_reader) (j_decompress_ptr cinfo);
  int (*read_markers) (j_decompress_ptr cinfo);
  jpeg_marker_parser_method read_restart_marker;
  jpeg_marker_parser_method process_COM;
  jpeg_marker_parser_method process_APPn[16];
  boolean saw_SOI;
  boolean saw_SOF;
  int next_restart_num;
  unsigned int discarded_bytes;
};
struct jpeg_entropy_decoder {
  void (*start_pass) (j_decompress_ptr cinfo);
  boolean (*decode_mcu) (j_decompress_ptr cinfo, JBLOCKROW *MCU_data);
};
typedef void (*inverse_DCT_method_ptr) (j_decompress_ptr cinfo, jpeg_component_info * compptr, JCOEFPTR coef_block, JSAMPARRAY output_buf, JDIMENSION output_col);
struct jpeg_inverse_dct {
  void (*start_pass) (j_decompress_ptr cinfo);
  inverse_DCT_method_ptr inverse_DCT[10];
};
struct jpeg_upsampler {
  void (*start_pass) (j_decompress_ptr cinfo);
  void (*upsample) (j_decompress_ptr cinfo, JSAMPIMAGE input_buf, JDIMENSION *in_row_group_ctr, JDIMENSION in_row_groups_avail, JSAMPARRAY output_buf, JDIMENSION *out_row_ctr, JDIMENSION out_rows_avail);
  boolean need_context_rows;
};
struct jpeg_color_deconverter {
  void (*start_pass) (j_decompress_ptr cinfo);
  void (*color_convert) (j_decompress_ptr cinfo, JSAMPIMAGE input_buf, JDIMENSION input_row, JSAMPARRAY output_buf, int num_rows);
};
struct jpeg_color_quantizer {
  void (*start_pass) (j_decompress_ptr cinfo, boolean is_pre_scan);
  void (*color_quantize) (j_decompress_ptr cinfo, JSAMPARRAY input_buf, JSAMPARRAY output_buf, int num_rows);
  void (*finish_pass) (j_decompress_ptr cinfo);
  void (*new_color_map) (j_decompress_ptr cinfo);
};
typedef struct {
  struct jpeg_d_main_controller pub;
  JSAMPARRAY buffer[10];
  boolean buffer_full;
  JDIMENSION rowgroup_ctr;
  JSAMPIMAGE xbuffer[2];
  int whichptr;
  int context_state;
  JDIMENSION rowgroups_avail;
  JDIMENSION iMCU_row_ctr;
} my_main_controller;
typedef my_main_controller * my_main_ptr;
void object_task_schedule
 (j_decompress_ptr cinfo, JSAMPARRAY output_buf, JDIMENSION *out_row_ctr, JDIMENSION out_rows_avail);
void
object_task_schedule (j_decompress_ptr cinfo,
     JSAMPARRAY output_buf, JDIMENSION *out_row_ctr,
     JDIMENSION out_rows_avail)
{
  my_main_ptr main = (my_main_ptr) cinfo->main;
  JDIMENSION rowgroups_avail;
  if (! main->buffer_full) {
    if (! (*cinfo->coef->decompress_data) (cinfo, main->buffer))
      return;
    main->buffer_full = 1;
  }
  rowgroups_avail = (JDIMENSION) cinfo->min_DCT_scaled_size;
  (*cinfo->post->post_process_data) (cinfo, main->buffer,
         &main->rowgroup_ctr, rowgroups_avail,
         output_buf, out_row_ctr, out_rows_avail);
  if (main->rowgroup_ctr >= rowgroups_avail) {
    main->buffer_full = 0;
    main->rowgroup_ctr = 0;
  }
}
