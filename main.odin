package main

import "glslang"
import "core:fmt"

main :: proc()
{
    shader_code := cstring(
    `
    #version 450
    layout(location = 0) out vec4 col;

    void main()
    {
        col = vec4(1);
    }`);

    input := glslang.Input{
        language = glslang.Source.Glsl,
        stage = glslang.Stage.Fragment,
        client = glslang.Client.Vulkan,
        client_version = glslang.Target_Client_Version.Vulkan_1_0,
        target_language = glslang.Target_Language.Spir_V,
        target_language_version = glslang.Target_Language_Version.Spv_1_0,
        code = shader_code,
        default_version = 100,
        default_profile = glslang.Profile.No_Profile,
        force_default_version_and_profile = 0,
        forward_compatible = 0,
        messages = glslang.Messages.Default_Bit,
        resource = &glslang.default_resource
    };

    glslang.initialize_process();
    shader := glslang.shader_create(&input);

    if ok := glslang.shader_preprocess(shader,&input); !ok {
        fmt.print("Info log:",glslang.shader_get_info_log(shader),"Debug Log:",glslang.shader_get_info_debug_log(shader),"\n");
    }

    if ok := glslang.shader_parse(shader,&input); !ok {
        fmt.print("Info log:",glslang.shader_get_info_log(shader),"Debug Log:",glslang.shader_get_info_debug_log(shader),"\n");
    }


    program := glslang.program_create();

    glslang.program_add_shader(program,shader);

    if ok := glslang.program_link(program, input.messages); !ok {
        fmt.print("Info log:",glslang.shader_get_info_log(shader),"Debug Log:",glslang.shader_get_info_debug_log(shader),"\n");
    }

    glslang.program_SPIRV_generate(program, input.stage);

    spirv : []u32 = glslang.program_SPIRV_get_buffer(program);

    len : int = len(spirv);
    code : ^u32 = &spirv[0];


    glslang.shader_delete(shader);
    glslang.program_delete(program);
    glslang.finalize_process();

    
    fmt.print("GLSLANG Test finished succesfully!");
}