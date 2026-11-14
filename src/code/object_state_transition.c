/* IJG libjpeg 6a jdphuff.c: start_pass_phuff_decoder(). */
typedef unsigned int size_t;
typedef struct FILE FILE;
extern void *memset(void *, int, unsigned int);
extern void *memcpy(void *, const void *, unsigned int);
typedef unsigned char JSAMPLE;
typedef short JCOEF;
typedef unsigned char JOCTET;
typedef unsigned char UINT8;
typedef unsigned short UINT16;
typedef short INT16;
typedef long INT32;
typedef unsigned int JDIMENSION;
typedef int boolean;
typedef JSAMPLE *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;
typedef JSAMPARRAY *JSAMPIMAGE;
typedef JCOEF JBLOCK[64];
typedef JBLOCK *JBLOCKROW;
typedef JBLOCKROW *JBLOCKARRAY;
typedef JBLOCKARRAY *JBLOCKIMAGE;
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
typedef struct {
  int comps_in_scan;
  int component_index[4];
  int Ss, Se;
  int Ah, Al;
} jpeg_scan_info;
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
typedef struct jpeg_compress_struct * j_compress_ptr;
typedef struct jpeg_decompress_struct * j_decompress_ptr;
struct jpeg_compress_struct {
  struct jpeg_error_mgr * err; struct jpeg_memory_mgr * mem; struct jpeg_progress_mgr * progress; boolean is_decompressor; int global_state;
  struct jpeg_destination_mgr * dest;
  JDIMENSION image_width;
  JDIMENSION image_height;
  int input_components;
  J_COLOR_SPACE in_color_space;
  double input_gamma;
  int data_precision;
  int num_components;
  J_COLOR_SPACE jpeg_color_space;
  jpeg_component_info * comp_info;
  JQUANT_TBL * quant_tbl_ptrs[4];
  JHUFF_TBL * dc_huff_tbl_ptrs[4];
  JHUFF_TBL * ac_huff_tbl_ptrs[4];
  UINT8 arith_dc_L[16];
  UINT8 arith_dc_U[16];
  UINT8 arith_ac_K[16];
  int num_scans;
  const jpeg_scan_info * scan_info;
  boolean raw_data_in;
  boolean arith_code;
  boolean optimize_coding;
  boolean CCIR601_sampling;
  int smoothing_factor;
  J_DCT_METHOD dct_method;
  unsigned int restart_interval;
  int restart_in_rows;
  boolean write_JFIF_header;
  UINT8 density_unit;
  UINT16 X_density;
  UINT16 Y_density;
  boolean write_Adobe_marker;
  JDIMENSION next_scanline;
  boolean progressive_mode;
  int max_h_samp_factor;
  int max_v_samp_factor;
  JDIMENSION total_iMCU_rows;
  int comps_in_scan;
  jpeg_component_info * cur_comp_info[4];
  JDIMENSION MCUs_per_row;
  JDIMENSION MCU_rows_in_scan;
  int blocks_in_MCU;
  int MCU_membership[10];
  int Ss, Se, Ah, Al;
  struct jpeg_comp_master * master;
  struct jpeg_c_main_controller * main;
  struct jpeg_c_prep_controller * prep;
  struct jpeg_c_coef_controller * coef;
  struct jpeg_marker_writer * marker;
  struct jpeg_color_converter * cconvert;
  struct jpeg_downsampler * downsample;
  struct jpeg_forward_dct * fdct;
  struct jpeg_entropy_encoder * entropy;
};
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
struct jpeg_destination_mgr {
  JOCTET * next_output_byte;
  size_t free_in_buffer;
  void (*init_destination) (j_compress_ptr cinfo);
  boolean (*empty_output_buffer) (j_compress_ptr cinfo);
  void (*term_destination) (j_compress_ptr cinfo);
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
extern struct jpeg_error_mgr * jpeg_std_error
 (struct jpeg_error_mgr * err);
extern void jpeg_CreateCompress (j_compress_ptr cinfo, int version, size_t structsize);
extern void jpeg_CreateDecompress (j_decompress_ptr cinfo, int version, size_t structsize);
extern void jpeg_destroy_compress (j_compress_ptr cinfo);
extern void jpeg_destroy_decompress (j_decompress_ptr cinfo);
extern void jpeg_stdio_dest (j_compress_ptr cinfo, FILE * outfile);
extern void jpeg_stdio_src (j_decompress_ptr cinfo, FILE * infile);
extern void jpeg_set_defaults (j_compress_ptr cinfo);
extern void jpeg_set_colorspace (j_compress_ptr cinfo, J_COLOR_SPACE colorspace);
extern void jpeg_default_colorspace (j_compress_ptr cinfo);
extern void jpeg_set_quality (j_compress_ptr cinfo, int quality, boolean force_baseline);
extern void jpeg_set_linear_quality (j_compress_ptr cinfo, int scale_factor, boolean force_baseline);
extern void jpeg_add_quant_table (j_compress_ptr cinfo, int which_tbl, const unsigned int *basic_table, int scale_factor, boolean force_baseline);
extern int jpeg_quality_scaling (int quality);
extern void jpeg_simple_progression (j_compress_ptr cinfo);
extern void jpeg_suppress_tables (j_compress_ptr cinfo, boolean suppress);
extern JQUANT_TBL * jpeg_alloc_quant_table (j_common_ptr cinfo);
extern JHUFF_TBL * jpeg_alloc_huff_table (j_common_ptr cinfo);
extern void jpeg_start_compress (j_compress_ptr cinfo, boolean write_all_tables);
extern JDIMENSION jpeg_write_scanlines (j_compress_ptr cinfo, JSAMPARRAY scanlines, JDIMENSION num_lines);
extern void jpeg_finish_compress (j_compress_ptr cinfo);
extern JDIMENSION jpeg_write_raw_data (j_compress_ptr cinfo, JSAMPIMAGE data, JDIMENSION num_lines);
extern void jpeg_write_marker
 (j_compress_ptr cinfo, int marker, const JOCTET * dataptr, unsigned int datalen);
extern void jpeg_write_tables (j_compress_ptr cinfo);
extern int jpeg_read_header (j_decompress_ptr cinfo, boolean require_image);
extern boolean jpeg_start_decompress (j_decompress_ptr cinfo);
extern JDIMENSION jpeg_read_scanlines (j_decompress_ptr cinfo, JSAMPARRAY scanlines, JDIMENSION max_lines);
extern boolean jpeg_finish_decompress (j_decompress_ptr cinfo);
extern JDIMENSION jpeg_read_raw_data (j_decompress_ptr cinfo, JSAMPIMAGE data, JDIMENSION max_lines);
extern boolean jpeg_has_multiple_scans (j_decompress_ptr cinfo);
extern boolean jpeg_start_output (j_decompress_ptr cinfo, int scan_number);
extern boolean jpeg_finish_output (j_decompress_ptr cinfo);
extern boolean jpeg_input_complete (j_decompress_ptr cinfo);
extern void jpeg_new_colormap (j_decompress_ptr cinfo);
extern int jpeg_consume_input (j_decompress_ptr cinfo);
extern void jpeg_calc_output_dimensions (j_decompress_ptr cinfo);
extern void jpeg_set_marker_processor
 (j_decompress_ptr cinfo, int marker_code, jpeg_marker_parser_method routine);
extern jvirt_barray_ptr * jpeg_read_coefficients (j_decompress_ptr cinfo);
extern void jpeg_write_coefficients (j_compress_ptr cinfo, jvirt_barray_ptr * coef_arrays);
extern void jpeg_copy_critical_parameters (j_decompress_ptr srcinfo, j_compress_ptr dstinfo);
extern void jpeg_abort_compress (j_compress_ptr cinfo);
extern void jpeg_abort_decompress (j_decompress_ptr cinfo);
extern void jpeg_abort (j_common_ptr cinfo);
extern void jpeg_destroy (j_common_ptr cinfo);
extern boolean jpeg_resync_to_restart (j_decompress_ptr cinfo, int desired);
typedef enum {
 JBUF_PASS_THRU,
 JBUF_SAVE_SOURCE,
 JBUF_CRANK_DEST,
 JBUF_SAVE_AND_PASS
} J_BUF_MODE;
struct jpeg_comp_master {
  void (*prepare_for_pass) (j_compress_ptr cinfo);
  void (*pass_startup) (j_compress_ptr cinfo);
  void (*finish_pass) (j_compress_ptr cinfo);
  boolean call_pass_startup;
  boolean is_last_pass;
};
struct jpeg_c_main_controller {
  void (*start_pass) (j_compress_ptr cinfo, J_BUF_MODE pass_mode);
  void (*process_data) (j_compress_ptr cinfo, JSAMPARRAY input_buf, JDIMENSION *in_row_ctr, JDIMENSION in_rows_avail);
};
struct jpeg_c_prep_controller {
  void (*start_pass) (j_compress_ptr cinfo, J_BUF_MODE pass_mode);
  void (*pre_process_data) (j_compress_ptr cinfo, JSAMPARRAY input_buf, JDIMENSION *in_row_ctr, JDIMENSION in_rows_avail, JSAMPIMAGE output_buf, JDIMENSION *out_row_group_ctr, JDIMENSION out_row_groups_avail);
};
struct jpeg_c_coef_controller {
  void (*start_pass) (j_compress_ptr cinfo, J_BUF_MODE pass_mode);
  boolean (*compress_data) (j_compress_ptr cinfo, JSAMPIMAGE input_buf);
};
struct jpeg_color_converter {
  void (*start_pass) (j_compress_ptr cinfo);
  void (*color_convert) (j_compress_ptr cinfo, JSAMPARRAY input_buf, JSAMPIMAGE output_buf, JDIMENSION output_row, int num_rows);
};
struct jpeg_downsampler {
  void (*start_pass) (j_compress_ptr cinfo);
  void (*downsample) (j_compress_ptr cinfo, JSAMPIMAGE input_buf, JDIMENSION in_row_index, JSAMPIMAGE output_buf, JDIMENSION out_row_group_index);
  boolean need_context_rows;
};
struct jpeg_forward_dct {
  void (*start_pass) (j_compress_ptr cinfo);
  void (*forward_DCT) (j_compress_ptr cinfo, jpeg_component_info * compptr, JSAMPARRAY sample_data, JBLOCKROW coef_blocks, JDIMENSION start_row, JDIMENSION start_col, JDIMENSION num_blocks);
};
struct jpeg_entropy_encoder {
  void (*start_pass) (j_compress_ptr cinfo, boolean gather_statistics);
  boolean (*encode_mcu) (j_compress_ptr cinfo, JBLOCKROW *MCU_data);
  void (*finish_pass) (j_compress_ptr cinfo);
};
struct jpeg_marker_writer {
  void (*write_any_marker) (j_compress_ptr cinfo, int marker, const JOCTET *dataptr, unsigned int datalen);
  void (*write_file_header) (j_compress_ptr cinfo);
  void (*write_frame_header) (j_compress_ptr cinfo);
  void (*write_scan_header) (j_compress_ptr cinfo);
  void (*write_file_trailer) (j_compress_ptr cinfo);
  void (*write_tables_only) (j_compress_ptr cinfo);
};
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
extern void jinit_compress_master (j_compress_ptr cinfo);
extern void jinit_c_master_control (j_compress_ptr cinfo, boolean transcode_only);
extern void jinit_c_main_controller (j_compress_ptr cinfo, boolean need_full_buffer);
extern void jinit_c_prep_controller (j_compress_ptr cinfo, boolean need_full_buffer);
extern void jinit_c_coef_controller (j_compress_ptr cinfo, boolean need_full_buffer);
extern void jinit_color_converter (j_compress_ptr cinfo);
extern void jinit_downsampler (j_compress_ptr cinfo);
extern void jinit_forward_dct (j_compress_ptr cinfo);
extern void jinit_huff_encoder (j_compress_ptr cinfo);
extern void jinit_phuff_encoder (j_compress_ptr cinfo);
extern void jinit_marker_writer (j_compress_ptr cinfo);
extern void jinit_master_decompress (j_decompress_ptr cinfo);
extern void jinit_d_main_controller (j_decompress_ptr cinfo, boolean need_full_buffer);
extern void jinit_d_coef_controller (j_decompress_ptr cinfo, boolean need_full_buffer);
extern void jinit_d_post_controller (j_decompress_ptr cinfo, boolean need_full_buffer);
extern void jinit_input_controller (j_decompress_ptr cinfo);
extern void jinit_marker_reader (j_decompress_ptr cinfo);
extern void jinit_huff_decoder (j_decompress_ptr cinfo);
extern void jinit_phuff_decoder (j_decompress_ptr cinfo);
extern void jinit_inverse_dct (j_decompress_ptr cinfo);
extern void jinit_upsampler (j_decompress_ptr cinfo);
extern void jinit_color_deconverter (j_decompress_ptr cinfo);
extern void jinit_1pass_quantizer (j_decompress_ptr cinfo);
extern void jinit_2pass_quantizer (j_decompress_ptr cinfo);
extern void jinit_merged_upsampler (j_decompress_ptr cinfo);
extern void jinit_memory_mgr (j_common_ptr cinfo);
extern long jdiv_round_up (long a, long b);
extern long jround_up (long a, long b);
extern void jcopy_sample_rows (JSAMPARRAY input_array, int source_row, JSAMPARRAY output_array, int dest_row, int num_rows, JDIMENSION num_cols);
extern void jcopy_block_row (JBLOCKROW input_row, JBLOCKROW output_row, JDIMENSION num_blocks);
extern void jzero_far (void * target, size_t bytestozero);
extern const int jpeg_zigzag_order[];
extern const int jpeg_natural_order[];
typedef enum {
JMSG_NOMESSAGE ,
JERR_ARITH_NOTIMPL ,
JERR_BAD_ALIGN_TYPE ,
JERR_BAD_ALLOC_CHUNK ,
JERR_BAD_BUFFER_MODE ,
JERR_BAD_COMPONENT_ID ,
JERR_BAD_DCTSIZE ,
JERR_BAD_IN_COLORSPACE ,
JERR_BAD_J_COLORSPACE ,
JERR_BAD_LENGTH ,
JERR_BAD_LIB_VERSION ,
JERR_BAD_MCU_SIZE ,
JERR_BAD_POOL_ID ,
JERR_BAD_PRECISION ,
JERR_BAD_PROGRESSION ,
JERR_BAD_PROG_SCRIPT ,
JERR_BAD_SAMPLING ,
JERR_BAD_SCAN_SCRIPT ,
JERR_BAD_STATE ,
JERR_BAD_STRUCT_SIZE ,
JERR_BAD_VIRTUAL_ACCESS ,
JERR_BUFFER_SIZE ,
JERR_CANT_SUSPEND ,
JERR_CCIR601_NOTIMPL ,
JERR_COMPONENT_COUNT ,
JERR_CONVERSION_NOTIMPL ,
JERR_DAC_INDEX ,
JERR_DAC_VALUE ,
JERR_DHT_COUNTS ,
JERR_DHT_INDEX ,
JERR_DQT_INDEX ,
JERR_EMPTY_IMAGE ,
JERR_EMS_READ ,
JERR_EMS_WRITE ,
JERR_EOI_EXPECTED ,
JERR_FILE_READ ,
JERR_FILE_WRITE ,
JERR_FRACT_SAMPLE_NOTIMPL ,
JERR_HUFF_CLEN_OVERFLOW ,
JERR_HUFF_MISSING_CODE ,
JERR_IMAGE_TOO_BIG ,
JERR_INPUT_EMPTY ,
JERR_INPUT_EOF ,
JERR_MISMATCHED_QUANT_TABLE ,
JERR_MISSING_DATA ,
JERR_MODE_CHANGE ,
JERR_NOTIMPL ,
JERR_NOT_COMPILED ,
JERR_NO_BACKING_STORE ,
JERR_NO_HUFF_TABLE ,
JERR_NO_IMAGE ,
JERR_NO_QUANT_TABLE ,
JERR_NO_SOI ,
JERR_OUT_OF_MEMORY ,
JERR_QUANT_COMPONENTS ,
JERR_QUANT_FEW_COLORS ,
JERR_QUANT_MANY_COLORS ,
JERR_SOF_DUPLICATE ,
JERR_SOF_NO_SOS ,
JERR_SOF_UNSUPPORTED ,
JERR_SOI_DUPLICATE ,
JERR_SOS_NO_SOF ,
JERR_TFILE_CREATE ,
JERR_TFILE_READ ,
JERR_TFILE_SEEK ,
JERR_TFILE_WRITE ,
JERR_TOO_LITTLE_DATA ,
JERR_UNKNOWN_MARKER ,
JERR_VIRTUAL_BUG ,
JERR_WIDTH_OVERFLOW ,
JERR_XMS_READ ,
JERR_XMS_WRITE ,
JMSG_COPYRIGHT ,
JMSG_VERSION ,
JTRC_16BIT_TABLES ,
JTRC_ADOBE ,
JTRC_APP0 ,
JTRC_APP14 ,
JTRC_DAC ,
JTRC_DHT ,
JTRC_DQT ,
JTRC_DRI ,
JTRC_EMS_CLOSE ,
JTRC_EMS_OPEN ,
JTRC_EOI ,
JTRC_HUFFBITS ,
JTRC_JFIF ,
JTRC_JFIF_BADTHUMBNAILSIZE ,
JTRC_JFIF_MINOR ,
JTRC_JFIF_THUMBNAIL ,
JTRC_MISC_MARKER ,
JTRC_PARMLESS_MARKER ,
JTRC_QUANTVALS ,
JTRC_QUANT_3_NCOLORS ,
JTRC_QUANT_NCOLORS ,
JTRC_QUANT_SELECTED ,
JTRC_RECOVERY_ACTION ,
JTRC_RST ,
JTRC_SMOOTH_NOTIMPL ,
JTRC_SOF ,
JTRC_SOF_COMPONENT ,
JTRC_SOI ,
JTRC_SOS ,
JTRC_SOS_COMPONENT ,
JTRC_SOS_PARAMS ,
JTRC_TFILE_CLOSE ,
JTRC_TFILE_OPEN ,
JTRC_UNKNOWN_IDS ,
JTRC_XMS_CLOSE ,
JTRC_XMS_OPEN ,
JWRN_ADOBE_XFORM ,
JWRN_BOGUS_PROGRESSION ,
JWRN_EXTRANEOUS_DATA ,
JWRN_HIT_MARKER ,
JWRN_HUFF_BAD_CODE ,
JWRN_JFIF_MAJOR ,
JWRN_JPEG_EOF ,
JWRN_MUST_RESYNC ,
JWRN_NOT_SEQUENTIAL ,
JWRN_TOO_MUCH_DATA ,
  JMSG_LASTMSGCODE
} J_MESSAGE_CODE;
typedef struct {
  INT32 mincode[17];
  INT32 maxcode[18];
  int valptr[17];
  JHUFF_TBL *pub;
  int look_nbits[1<<8];
  UINT8 look_sym[1<<8];
} d_derived_tbl;
extern void func_80058F2C (j_decompress_ptr cinfo, JHUFF_TBL * htbl, d_derived_tbl ** pdtbl);
typedef INT32 bit_buf_type;
typedef struct {
  bit_buf_type get_buffer;
  int bits_left;
  boolean printed_eod;
} bitread_perm_state;
typedef struct {
  const JOCTET * next_input_byte;
  size_t bytes_in_buffer;
  int unread_marker;
  bit_buf_type get_buffer;
  int bits_left;
  j_decompress_ptr cinfo;
  boolean * printed_eod_ptr;
} bitread_working_state;
extern boolean jpeg_fill_bit_buffer
 (bitread_working_state * state, register bit_buf_type get_buffer, register int bits_left, int nbits);
extern int jpeg_huff_decode
 (bitread_working_state * state, register bit_buf_type get_buffer, register int bits_left, d_derived_tbl * htbl, int min_bits);
typedef struct {
  unsigned int EOBRUN;
  int last_dc_val[4];
} savable_state;
typedef struct {
  struct jpeg_entropy_decoder pub;
  bitread_perm_state bitstate;
  savable_state saved;
  unsigned int restarts_to_go;
  d_derived_tbl * derived_tbls[4];
  d_derived_tbl * ac_derived_tbl;
} phuff_entropy_decoder;
typedef phuff_entropy_decoder * phuff_entropy_ptr;
static boolean object_state_update_primary (j_decompress_ptr cinfo, JBLOCKROW *MCU_data);
static boolean object_state_update_secondary (j_decompress_ptr cinfo, JBLOCKROW *MCU_data);
static boolean func_8005A45C (j_decompress_ptr cinfo, JBLOCKROW *MCU_data);
static boolean object_state_machine_advance (j_decompress_ptr cinfo, JBLOCKROW *MCU_data);
void
object_state_transition (j_decompress_ptr cinfo)
{
  phuff_entropy_ptr entropy = (phuff_entropy_ptr) cinfo->entropy;
  boolean is_DC_band, bad;
  int ci, coefi, tbl;
  int *coef_bit_ptr;
  jpeg_component_info * compptr;
  is_DC_band = (cinfo->Ss == 0);
  bad = 0;
  if (is_DC_band) {
    if (cinfo->Se != 0)
      bad = 1;
  } else {
    if (cinfo->Ss > cinfo->Se || cinfo->Se >= 64)
      bad = 1;
    if (cinfo->comps_in_scan != 1)
      bad = 1;
  }
  if (cinfo->Ah != 0) {
    if (cinfo->Al != cinfo->Ah-1)
      bad = 1;
  }
  if (cinfo->Al > 13)
    bad = 1;
  if (bad)
    ((cinfo)->err->msg_code = (JERR_BAD_PROGRESSION), (cinfo)->err->msg_parm.i[0] = (cinfo->Ss), (cinfo)->err->msg_parm.i[1] = (cinfo->Se), (cinfo)->err->msg_parm.i[2] = (cinfo->Ah), (cinfo)->err->msg_parm.i[3] = (cinfo->Al), (*(cinfo)->err->error_exit) ((j_common_ptr) (cinfo)));
  for (ci = 0; ci < cinfo->comps_in_scan; ci++) {
    int cindex = cinfo->cur_comp_info[ci]->component_index;
    coef_bit_ptr = & cinfo->coef_bits[cindex][0];
    if (!is_DC_band && coef_bit_ptr[0] < 0)
      ((cinfo)->err->msg_code = (JWRN_BOGUS_PROGRESSION), (cinfo)->err->msg_parm.i[0] = (cindex), (cinfo)->err->msg_parm.i[1] = (0), (*(cinfo)->err->emit_message) ((j_common_ptr) (cinfo), -1));
    for (coefi = cinfo->Ss; coefi <= cinfo->Se; coefi++) {
      int expected = (coef_bit_ptr[coefi] < 0) ? 0 : coef_bit_ptr[coefi];
      if (cinfo->Ah != expected)
 ((cinfo)->err->msg_code = (JWRN_BOGUS_PROGRESSION), (cinfo)->err->msg_parm.i[0] = (cindex), (cinfo)->err->msg_parm.i[1] = (coefi), (*(cinfo)->err->emit_message) ((j_common_ptr) (cinfo), -1));
      coef_bit_ptr[coefi] = cinfo->Al;
    }
  }
  if (cinfo->Ah == 0) {
    if (is_DC_band)
      entropy->pub.decode_mcu = object_state_update_primary;
    else
      entropy->pub.decode_mcu = object_state_update_secondary;
  } else {
    if (is_DC_band)
      entropy->pub.decode_mcu = func_8005A45C;
    else
      entropy->pub.decode_mcu = object_state_machine_advance;
  }
  for (ci = 0; ci < cinfo->comps_in_scan; ci++) {
    compptr = cinfo->cur_comp_info[ci];
    if (is_DC_band) {
      if (cinfo->Ah == 0) {
 tbl = compptr->dc_tbl_no;
 if (tbl < 0 || tbl >= 4 ||
     cinfo->dc_huff_tbl_ptrs[tbl] == ((void *)0))
   ((cinfo)->err->msg_code = (JERR_NO_HUFF_TABLE), (cinfo)->err->msg_parm.i[0] = (tbl), (*(cinfo)->err->error_exit) ((j_common_ptr) (cinfo)));
 func_80058F2C(cinfo, cinfo->dc_huff_tbl_ptrs[tbl],
    & entropy->derived_tbls[tbl]);
      }
    } else {
      tbl = compptr->ac_tbl_no;
      if (tbl < 0 || tbl >= 4 ||
          cinfo->ac_huff_tbl_ptrs[tbl] == ((void *)0))
        ((cinfo)->err->msg_code = (JERR_NO_HUFF_TABLE), (cinfo)->err->msg_parm.i[0] = (tbl), (*(cinfo)->err->error_exit) ((j_common_ptr) (cinfo)));
      func_80058F2C(cinfo, cinfo->ac_huff_tbl_ptrs[tbl],
         & entropy->derived_tbls[tbl]);
      entropy->ac_derived_tbl = entropy->derived_tbls[tbl];
    }
    entropy->saved.last_dc_val[ci] = 0;
  }
  entropy->bitstate.bits_left = 0;
  entropy->bitstate.get_buffer = 0;
  entropy->bitstate.printed_eod = 0;
  entropy->saved.EOBRUN = 0;
  entropy->restarts_to_go = cinfo->restart_interval;
}
