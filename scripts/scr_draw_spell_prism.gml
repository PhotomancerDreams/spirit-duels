var spell = argument0
var prism_x = argument1
var prism_y = argument2
var prism_w = argument3
var prism_h = argument4

draw_sprite_stretched(spr_spell_prism_frame, 0, prism_x, prism_y, prism_w, prism_h)
if(spell[0] >= 1){
    draw_sprite_stretched(spr_spell_prism_water_pane, 0, prism_x, prism_y, prism_w, prism_h)
}
if(spell[1] >= 1){
    draw_sprite_stretched(spr_spell_prism_earth_pane, 0, prism_x, prism_y, prism_w, prism_h)
}
if(spell[2] >= 1){
    draw_sprite_stretched(spr_spell_prism_fire_pane, 0, prism_x, prism_y, prism_w, prism_h)
}
if(spell[3] >= 1){
    draw_sprite_stretched(spr_spell_prism_air_pane, 0, prism_x, prism_y, prism_w, prism_h)
}
if(spell[4] >= 1){
    draw_sprite_stretched(spr_spell_prism_shadow_pane, 0, prism_x, prism_y, prism_w, prism_h)
}
if(spell[5] >= 1){
    draw_sprite_stretched(spr_spell_prism_arcane_pane, 0, prism_x, prism_y, prism_w, prism_h)
    draw_set_colour(c_silver)
    draw_text_transformed(prism_x+(prism_w/2), prism_y+(prism_h/3), string(spell[5]), prism_w/128, prism_h/128, 0)
}

//effect_create_below(ef_smoke, prism_x+(prism_w/2), prism_y+(prism_h/2), 2, c_silver);
