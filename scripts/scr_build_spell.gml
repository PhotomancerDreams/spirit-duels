var spell_array = argument0
var element_to_add = argument1

var element_total = 0
for(var totaling_index = 0; totaling_index < 6; totaling_index++){
    element_total += spell_array[totaling_index]
}

if(element_total < obj_opponent_data.focus_level){
    if(element_to_add == 5){
        spell_array[element_to_add] = obj_opponent_data.focus_level - element_total
    }else{
        spell_array[element_to_add] = 1;
    }
    for(var inner_element_index = element_to_add; inner_element_index < 6; inner_element_index++){
        if(spell_array[inner_element_index] == 0 && obj_opponent_data.cooldowns[inner_element_index] == 0){
            spell_array = scr_build_spell(spell_array, inner_element_index)
        }
    }
}else{
    spell_array[6] = scr_relative_spell_strength(obj_player_data.spell_cast, spell_array)
    
    if(!scr_is_in_compendium(spell_array)){
        for(var entry_index = 0; entry_index < 7; entry_index++){
            obj_spellbook.spell_compendium[compendium_entry, entry_index] = spell_array[entry_index];
        }
        obj_spellbook.compendium_entry++;
    }
}

return spell_array
