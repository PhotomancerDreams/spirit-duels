var spell_array_to_check = argument0;
var is_in_compendium = false;

for(height = 0; height < array_height_2d(spell_compendium); height++){
    for(length = 0; length < array_length_2d(spell_compendium, height); length++){
        if(obj_spellbook.spell_compendium[height, length] == spell_array_to_check[length]){
            is_in_compendium = true;
        }else{
            is_in_compendium = false;
            break;
        }
    }
    if(is_in_compendium = true){
        break;
    }
}

return is_in_compendium;
