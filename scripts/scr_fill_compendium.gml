var spell_array
var element_total = 0

//Iterate through all elements
for(var outer_element_index = 0; outer_element_index < 6; outer_element_index++){
    //Reset all to 0
    for(var reset_index = 0; reset_index < 7; reset_index++){
        spell_array[reset_index] = 0;
    }
    element_total = 0
    //Find unique element to add
    for(var inner_element_index = outer_element_index; inner_element_index < 6; inner_element_index++){
        if(spell_array[inner_element_index] == 0){
            spell_array[inner_element_index] = 1;
            element_total++
        }
        //Fill remainder with arcane
        spell_array[5] = obj_opponent_data.focus_level - element_total;
        //Calulate relative strength
        spell_array[6] = scr_relative_spell_strength(obj_player_data.spell_cast, spell_array)
        
        //Add spell to compendium
        if(!scr_is_in_compendium(spell_array)){
            for(var entry_index = 0; entry_index < 7; entry_index++){
                obj_spellbook.spell_compendium[compendium_entry, entry_index] = spell_array[entry_index];
            }
            obj_spellbook.compendium_entry++;
        }else{
            show_message("Duplicate entry found! spell_array: "+string(spell_array))
        }
        //If max focus, reset index
        if(element_total == obj_opponent_data.focus_level){
            spell_array[inner_element_index] = 0;
            element_total--
        }
    }
}

/*
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
    
    for(var inner_element_index = element_to_add; inner_element_index < 6; inner_element_index++){
        /*if(scr_is_in_compendium(spell_array) && element_to_add != inner_element_index && (element_total+1) == obj_opponent_data.focus_level){
            for(var reset_index = 0; reset_index < array_length_1d(spell_array); reset_index++){
                spell_array[reset_index] = 0;
            }
            spell_array[element_to_add] = 0;
            spell_array[inner_element_index] = 1;
        }
        if(spell_array[inner_element_index] == 0 && obj_opponent_data.cooldowns[inner_element_index] == 0 && (element_total+spell_array[element_to_add]) < obj_opponent_data.focus_level){
            show_message("Building by recursion. spell_array: "+string(spell_array)+", inner_element_index: "+string(inner_element_index))
            spell_array = scr_build_spell(spell_array, inner_element_index)
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
    }
}


spell_array[6] = scr_relative_spell_strength(obj_player_data.spell_cast, spell_array)

if(!scr_is_in_compendium(spell_array)){
    for(var entry_index = 0; entry_index < 7; entry_index++){
        obj_spellbook.spell_compendium[compendium_entry, entry_index] = spell_array[entry_index];
    }
    obj_spellbook.compendium_entry++;
}
