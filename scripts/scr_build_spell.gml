var spell_array = argument0
var element_to_add = argument1

var element_total = 0
for(var totaling_index = 0; totaling_index < 6; totaling_index++){
    element_total += spell_array[totaling_index]
}

if(element_total < obj_opponent_data.focus_level){    
    if(element_to_add == 5){
        spell_array[element_to_add] = obj_opponent_data.focus_level - element_total;
    }else{
        spell_array[element_to_add] = 1;
    }
    element_total += spell_array[element_to_add];
    for(var inner_element_index = element_to_add; inner_element_index < 6; inner_element_index++){
        /*if(scr_is_in_compendium(spell_array) && element_to_add != inner_element_index && (element_total+1) == obj_opponent_data.focus_level){
            for(var reset_index = 0; reset_index < array_length_1d(spell_array); reset_index++){
                spell_array[reset_index] = 0;
            }
            spell_array[element_to_add] = 0;
            spell_array[inner_element_index] = 1;
        }*/
        if(spell_array[inner_element_index] == 0 && obj_opponent_data.cooldowns[inner_element_index] == 0 && element_total < obj_opponent_data.focus_level){
            //show_message("Building by recursion. spell_array: "+string(spell_array)+", inner_element_index: "+string(inner_element_index))
            var inner_array
            for(var copy_index = 0; copy_index < array_length_1d(spell_array); copy_index++){
                inner_array[copy_index] = spell_array[copy_index];
            }
            inner_array = scr_build_spell(inner_array, inner_element_index)
        }
    }
    /*
    if(next_element <= 5 && obj_opponent_data.cooldowns[next_element] == 0){
        if(scr_is_in_compendium(spell_array)){
            spell_array[element_to_add] = 0;
        }
        //show_message("Building by recursion. spell_array: "+string(spell_array)+", next_element: "+string(next_element))
        spell_array = scr_build_spell(spell_array, next_element)
    }
    */
    
    /*
    for(var inner_element_index = element_to_add; inner_element_index < 6; inner_element_index++){
        if(spell_array[inner_element_index] == 0 && obj_opponent_data.cooldowns[inner_element_index] == 0){
            spell_array = scr_build_spell(spell_array, inner_element_index)
        }
    }*/
}


spell_array[6] = scr_relative_spell_strength(obj_player_data.spell_cast, spell_array)

if(element_total == obj_opponent_data.focus_level && !scr_is_in_compendium(spell_array)){
    for(var entry_index = 0; entry_index < 7; entry_index++){
        obj_spellbook.spell_compendium[compendium_entry, entry_index] = spell_array[entry_index];
    }
    obj_spellbook.compendium_entry++;
}

return spell_array
