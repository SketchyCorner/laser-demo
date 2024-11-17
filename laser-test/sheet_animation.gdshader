shader_type canvas_item;

uniform int hframes : hint_range(1, 32) = 1; // Number of horizontal frames
uniform int vframes : hint_range(1, 32) = 1; // Number of vertical frames
uniform int current_frame : hint_range(0, 1024) = 0; // Current frame index

void fragment() {
    // Calculate the size of each frame
    vec2 frame_size = vec2(1.0 / float(hframes), 1.0 / float(vframes));

    // Calculate the current frame position in the texture
    float frame_x = float(current_frame % hframes);
    float frame_y = float(current_frame / hframes);

    vec2 frame_offset = vec2(frame_x, frame_y) * frame_size;

    // Adjust UV coordinates to sample from the correct frame
    vec2 adjusted_uv = (UV * frame_size) + frame_offset;

    // Sample the texture
    COLOR = texture(TEXTURE, adjusted_uv);
}