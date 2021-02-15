package glslang

import "core:c"
import "core:mem"

Stage :: enum c.int {
    Vertex,
    Tess_Control,
    Tess_Evaluation,
    Geometry,
    Fragment,
    Compute,
    Raygen_NV,
    Intersect_NV,
    Any_Hit_NV,
    Closest_Hit_NV,
    Miss_NV,
    Callable_NV,
    Task_NV,
    Mesh_NV
}

Stage_Mask :: bit_set[Stage];

Source :: enum c.int {
    None,
    Glsl,
    Hlsl
}

Client :: enum c.int {
    None,
    Vulkan,
    Open_Gl
}

Target_Language :: enum c.int {
    None,
    Spir_V
}

Target_Client_Version :: enum c.int {
    Vulkan_1_0 = (1 << 22),
    Vulkan_1_1 = (1 << 22) | (1 << 12),
    Open_Gl_450 = 450
}

 Target_Language_Version :: enum c.int {
    Spv_1_0 = (1 << 16),
    Spv_1_1 = (1 << 16) | (1 << 8),
    Spv_1_2 = (1 << 16) | (2 << 8),
    Spv_1_3 = (1 << 16) | (3 << 8),
    Spv_1_4 = (1 << 16) | (4 << 8),
    Spv_1_5 = (1 << 16) | (5 << 8)
}

Executable :: enum c.int
{
	Vertex_Fragment,
	Fragment
}

Optimization_Level :: enum c.int {
    No_Generation,
    None,
    Simple,
    Full,
}


Texture_Sampler_Transform_Mode :: enum c.int {
	Keep,
    Upgrade_Texture_Remove_Sampler
}

Messages :: enum {
    Default_Bit = 0,
    Errors_Bit = (1 << 0),
    Warnings_Bit = (1 << 1),
    AST_Bit = (1 << 2),
    Spv_Rules_Bit = (1 << 3),
    Vulkan_Rules_Bit = (1 << 4),
    Only_Preprocessor_Bit = (1 << 5),
    Read_Hlsl_Bit = (1 << 6),
    Cascading_Errors_Bit = (1 << 7),
    Keep_Uncalled_Bit = (1 << 8),
    Hlsl_Offsets_Bit = (1 << 9),
    Debug_Info_Bit = (1 << 10),
    Hlsl_Enable_16_Bit_Types_Bit = (1 << 11),
    Hlsl_Legalization_Bit = (1 << 12),
    Hlsl_DX9_Compatible_Bit = (1 << 13),
    Builtin_Symbol_Table_Bit = (1 << 14)
}

Reflection_Options :: enum c.int {
    Default_Bit = 0,
    Array_Suffix_Bit = (1 << 0),
    Basic_Array_Suffix_Bit = (1 << 1),
    Intermediate_Ioo_Bit = (1 << 2),
    Separate_Buffers_Bit = (1 << 3),
    All_Block_Variables_Bit = (1 << 4),
    Unwrap_Io_Blocks_Bit = (1 << 5),
    All_Io_Variables_Bit = (1 << 6),
    Shared_Std140_SSBO_Bit = (1 << 7),
    Shared_Std140_UBO_Bit = (1 << 8)
}

Profile :: enum c.int {
    Bad_Profile = 0,
    No_Profile = (1 << 0),
    Core_Profile = (1 << 1),
    Compatibility_Profile = (1 << 2),
    ES_Profile = (1 << 3)
}

Limits :: struct {
    non_inductive_for_loops : c.bool,
    while_loops : c.bool,
    do_while_loops : c.bool,
    general_uniform_indexing : c.bool,
    general_attribute_matrix_vector_indexing : c.bool,
    general_varying_indexing : c.bool,
    general_sampler_indexing : c.bool,
    general_variable_indexing : c.bool,
    general_constant_matrix_vector_indexing : c.bool
}

Built_In_Resource :: struct {
    max_lights : c.int,
    max_clip_planes : c.int,
    max_texture_units : c.int,
    max_texture_coords : c.int,
    max_vertex_attribs : c.int,
    max_vertex_uniform_components : c.int,
    max_varying_floats : c.int,
    max_vertex_texture_image_units : c.int,
    max_combined_texture_image_units : c.int,
    max_texture_image_units : c.int,
    max_fragment_uniform_components : c.int,
    max_draw_buffers : c.int,
    max_vertex_uniform_vectors : c.int,
    max_varying_vectors : c.int,
    max_fragment_uniform_vectors : c.int,
    max_vertex_output_vectors : c.int,
    max_fragment_input_vectors : c.int,
    min_program_texel_offset : c.int,
    max_program_texel_offset : c.int,
    max_clip_distances : c.int,
    max_compute_work_group_count_x : c.int,
    max_compute_work_group_count_y : c.int,
    max_compute_work_group_count_z : c.int,
    max_compute_work_group_size_x : c.int,
    max_compute_work_group_size_y : c.int,
    max_compute_work_group_size_z : c.int,
    max_compute_uniform_components : c.int,
    max_compute_texture_image_units : c.int,
    max_compute_image_uniforms : c.int,
    max_compute_atomic_counters : c.int,
    max_compute_atomic_counter_buffers : c.int,
    max_varying_components : c.int,
    max_vertex_output_components : c.int,
    max_geometry_input_components : c.int,
    max_geometry_output_components : c.int,
    max_fragment_input_components : c.int,
    max_image_units : c.int,
    max_combined_image_units_and_fragment_outputs : c.int,
    max_combined_shader_output_resources : c.int,
    max_image_samples : c.int,
    max_vertex_image_uniforms : c.int,
    max_tess_control_image_uniforms : c.int,
    max_tess_evaluation_image_uniforms : c.int,
    max_geometry_image_uniforms : c.int,
    max_fragment_image_uniforms : c.int,
    max_combined_image_uniforms : c.int,
    max_geometry_texture_image_units : c.int,
    max_geometry_output_vertices : c.int,
    max_geometry_total_output_components : c.int,
    max_geometry_uniform_components : c.int,
    max_geometry_varying_components : c.int,
    max_tess_control_input_components : c.int,
    max_tess_control_output_components : c.int,
    max_tess_control_texture_image_units : c.int,
    max_tess_control_uniform_components : c.int,
    max_tess_control_total_output_components : c.int,
    max_tess_evaluation_input_components : c.int,
    max_tess_evaluation_output_components : c.int,
    max_tess_evaluation_texture_image_units : c.int,
    max_tess_evaluation_uniform_components : c.int,
    max_tess_patch_components : c.int,
    max_patch_vertices : c.int,
    max_tess_gen_level : c.int,
    max_viewports : c.int,
    max_vertex_atomic_counters : c.int,
    max_tess_control_atomic_counters : c.int,
    max_tess_evaluation_atomic_counters : c.int,
    max_geometry_atomic_counters : c.int,
    max_fragment_atomic_counters : c.int,
    max_combined_atomic_counters : c.int,
    max_atomic_counter_bindings : c.int,
    max_vertex_atomic_counter_buffers : c.int,
    max_tess_control_atomic_counter_buffers : c.int,
    max_tess_evaluation_atomic_counter_buffers : c.int,
    max_geometry_atomic_counter_buffers : c.int,
    max_fragment_atomic_counter_buffers : c.int,
    max_combined_atomic_counter_buffers : c.int,
    max_atomic_counter_buffer_size : c.int,
    max_transform_feedback_buffers : c.int,
    max_transform_feedback_interleaved_components : c.int,
    max_cull_distances : c.int,
    max_combined_clip_and_cull_distances : c.int,
    max_samples : c.int,
    max_mesh_output_vertices_NV : c.int,
    max_mesh_output_primitives_NV : c.int,
    max_mesh_work_group_size_x_NV : c.int,
    max_mesh_work_group_size_y_NV : c.int,
    max_mesh_work_group_size_z_NV : c.int,
    max_task_work_group_size_x_NV : c.int,
    max_task_work_group_size_y_NV : c.int,
    max_task_work_group_size_z_NV : c.int,
    max_mesh_view_count_NV : c.int,
    max_dual_source_draw_buffers_EXT : c.int,
    limits : Limits
}

Input :: struct {
 	language : Source,
    stage : Stage,
    client : Client,
    client_version : Target_Client_Version,
	target_language : Target_Language,
    target_language_version : Target_Language_Version,
    code : cstring,
    default_version : c.int,
    default_profile : Profile,
    force_default_version_and_profile : c.int,
    forward_compatible : c.int,
    messages : Messages,
    resource : ^Built_In_Resource
}

Include_Result :: struct {
    header_name : cstring,
    header_data : cstring
}

Shader :: struct {}
Program :: struct {}


/*if compiling with MSVC binaries*/

@require
foreign import other {
"system:ucrt.lib",
"system:vcruntime.lib",
"system:msvcrt.lib",
"system:msvcprt.lib"
}


foreign import glslang_lib
{
"glslang.lib",
"OGLCompiler.lib",
"SPIRV.lib",
"HLSL.lib",
"OSDependent.lib",
"MachineIndependent.lib",
"GenericCodeGen.lib",
"SPIRV-Tools-opt.lib",
"SPIRV-Tools.lib",
"SPVRemapper.lib"
}

@(default_calling_convention = "c")
foreign glslang_lib
{
	glslang_initialize_process :: proc() -> c.int ---;
	glslang_finalize_process :: proc() ---;
	glslang_shader_create :: proc(input : ^Input) -> ^Shader ---;
	glslang_shader_delete :: proc(shader : ^Shader) ---;
	glslang_shader_preprocess :: proc(shader : ^Shader, input : ^Input) -> c.int ---;
	glslang_shader_parse :: proc(shader : ^Shader, input : ^Input) -> c.int ---;
	glslang_shader_get_preprocessed_code :: proc(shader : ^Shader) -> cstring ---;
	glslang_shader_get_info_log :: proc(shader : ^Shader) -> cstring ---;
	glslang_shader_get_info_debug_log :: proc(shader : ^Shader) -> cstring ---;
	glslang_program_create :: proc() -> ^Program ---;
	glslang_program_delete :: proc(program : ^Program) ---;
	glslang_program_add_shader :: proc(program : ^Program,shader : ^Shader) ---;
	glslang_program_link :: proc(program : ^Program, messages : c.int) -> c.int ---;
	glslang_program_SPIRV_generate :: proc(program : ^Program,stage : Stage) ---;
	glslang_program_SPIRV_get :: proc(program : ^Program, buffer : ^u32) ---;
	glslang_program_SPIRV_get_size :: proc(program : ^Program) -> c.uint ---;
	glslang_program_SPIRV_get_ptr :: proc(program : ^Program) -> ^u32 ---;
	glslang_program_SPIRV_get_messages :: proc(program : ^Program) -> cstring ---;
}

initialize_process :: proc() -> b32
{
	return b32(glslang_initialize_process());
}

finalize_process :: proc()
{
	glslang_finalize_process();
}

shader_create :: proc(input : ^Input) -> ^Shader
{
	return glslang_shader_create(input);
}

shader_delete :: proc(shader : ^Shader)
{
	glslang_shader_delete(shader);
}

shader_preprocess :: proc(shader : ^Shader, input : ^Input) -> b32
{
	return b32(glslang_shader_preprocess(shader, input));
}

shader_parse :: proc(shader : ^Shader, input : ^Input) -> b32
{
	return b32(glslang_shader_parse(shader, input));
}

shader_get_preprocessed_code :: proc (shader : ^Shader) -> string
{
	return string(glslang_shader_get_preprocessed_code(shader));
}

shader_get_info_log :: proc(shader : ^Shader) -> string
{
	return string(glslang_shader_get_info_debug_log(shader));
}

shader_get_info_debug_log :: proc(shader : ^Shader) -> string
{
	return string(glslang_shader_get_info_debug_log(shader));
}

program_create :: proc() -> ^Program
{
	return glslang_program_create();
}

program_delete :: proc(program : ^Program)
{
	glslang_program_delete(program);
}

program_add_shader :: proc(program : ^Program,shader : ^Shader)
{
	 glslang_program_add_shader(program, shader);
}

program_link :: proc(program : ^Program, messages : Messages) -> b32
{
	return b32(glslang_program_link(program,c.int(messages)));
}

program_SPIRV_generate :: proc(program : ^Program,stage : Stage)
{
	glslang_program_SPIRV_generate(program, stage);
}

program_SPIRV_get :: proc(program : ^Program, buffer : ^u32)
{
	glslang_program_SPIRV_get(program,buffer);
}

program_SPIRV_get_buffer :: proc(program : ^Program) -> []u32
{
	return mem.slice_ptr(glslang_program_SPIRV_get_ptr(program),int(glslang_program_SPIRV_get_size(program)));	
}

program_SPIRV_get_messages :: proc(program : ^Program) -> string
{
	return string(glslang_program_SPIRV_get_messages(program));
}

default_resource := Built_In_Resource{
	 max_lights = 32,
	 max_clip_planes = 6,
	 max_texture_units = 32,
	 max_texture_coords = 32,
	 max_vertex_attribs = 64,
	 max_vertex_uniform_components = 4096,
	 max_varying_floats = 64,
	 max_vertex_texture_image_units = 32,
	 max_combined_texture_image_units = 80,
	 max_texture_image_units = 32,
	 max_fragment_uniform_components = 4096,
	 max_draw_buffers = 32,
	 max_vertex_uniform_vectors = 128,
	 max_varying_vectors = 8,
	 max_fragment_uniform_vectors = 16,
	 max_vertex_output_vectors = 16,
	 max_fragment_input_vectors = 15,
	 min_program_texel_offset = -8,
	 max_program_texel_offset = 7,
	 max_clip_distances = 8,
	 max_compute_work_group_count_x = 65535,
	 max_compute_work_group_count_y = 65535,
	 max_compute_work_group_count_z = 65535,
	 max_compute_work_group_size_x = 1024,
	 max_compute_work_group_size_y = 1024,
	 max_compute_work_group_size_z = 64,
	 max_compute_uniform_components = 1024,
	 max_compute_texture_image_units = 16,
	 max_compute_image_uniforms = 8,
	 max_compute_atomic_counters = 8,
	 max_compute_atomic_counter_buffers = 1,
	 max_varying_components = 60,
	 max_vertex_output_components = 64,
	 max_geometry_input_components = 64,
	 max_geometry_output_components = 128,
	 max_fragment_input_components = 128,
	 max_image_units = 8,
	 max_combined_image_units_and_fragment_outputs = 8,
	 max_combined_shader_output_resources = 8,
	 max_image_samples = 0,
	 max_vertex_image_uniforms = 0,
	 max_tess_control_image_uniforms = 0,
	 max_tess_evaluation_image_uniforms = 0,
	 max_geometry_image_uniforms = 0,
	 max_fragment_image_uniforms = 8,
	 max_combined_image_uniforms = 8,
	 max_geometry_texture_image_units = 16,
	 max_geometry_output_vertices = 256,
	 max_geometry_total_output_components = 1024,
	 max_geometry_uniform_components = 1024,
	 max_geometry_varying_components = 64,
	 max_tess_control_input_components = 128,
	 max_tess_control_output_components = 128,
	 max_tess_control_texture_image_units = 16,
	 max_tess_control_uniform_components = 1024,
	 max_tess_control_total_output_components = 4096,
	 max_tess_evaluation_input_components = 128,
	 max_tess_evaluation_output_components = 128,
	 max_tess_evaluation_texture_image_units = 16,
	 max_tess_evaluation_uniform_components = 1024,
	 max_tess_patch_components = 120,
	 max_patch_vertices = 32,
	 max_tess_gen_level = 64,
	 max_viewports = 16,
	 max_vertex_atomic_counters = 0,
	 max_tess_control_atomic_counters = 0,
	 max_tess_evaluation_atomic_counters = 0,
	 max_geometry_atomic_counters = 0,
	 max_fragment_atomic_counters = 8,
	 max_combined_atomic_counters = 8,
	 max_atomic_counter_bindings = 1,
	 max_vertex_atomic_counter_buffers = 0,
	 max_tess_control_atomic_counter_buffers = 0,
	 max_tess_evaluation_atomic_counter_buffers = 0,
	 max_geometry_atomic_counter_buffers = 0,
	 max_fragment_atomic_counter_buffers = 1,
	 max_combined_atomic_counter_buffers = 1,
	 max_atomic_counter_buffer_size = 16384,
	 max_transform_feedback_buffers = 4,
	 max_transform_feedback_interleaved_components = 64,
	 max_cull_distances = 8,
	 max_combined_clip_and_cull_distances = 8,
	 max_samples = 4,
	 max_mesh_output_vertices_NV = 256,
	 max_mesh_output_primitives_NV = 512,
	 max_mesh_work_group_size_x_NV = 32,
	 max_mesh_work_group_size_y_NV = 1,
	 max_mesh_work_group_size_z_NV = 1,
	 max_task_work_group_size_x_NV = 32,
	 max_task_work_group_size_y_NV = 1,
	 max_task_work_group_size_z_NV = 1,
	 max_mesh_view_count_NV = 4,
	 max_dual_source_draw_buffers_EXT = 1,

	 limits = Limits{
	 non_inductive_for_loops = true,
	 while_loops = true,
	 do_while_loops = true,
	 general_uniform_indexing = true,
	 general_attribute_matrix_vector_indexing = true,
	 general_varying_indexing = true,
	 general_sampler_indexing = true,
	 general_variable_indexing = true,
	 general_constant_matrix_vector_indexing = true
	 }

};