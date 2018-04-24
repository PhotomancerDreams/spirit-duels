var spell_self = argument0
var spell_other = argument1
var spell_strength_self = scr_base_spell_strength(spell_self)
var spell_strength_other = scr_base_spell_strength(spell_other)

for(element_index = 0; element_index < 5; element_index++){
    if(spell_self[element_index] >= 1){
        if(spell_other[((element_index+1) mod 5)] >= 1){
            spell_strength_self += 1
        }
        if(spell_other[((element_index+2) mod 5)] >= 1){
            spell_strength_self += 1
        }
    }
    if(spell_other[element_index] >= 1){
        if(spell_self[((element_index+1) mod 5)] >= 1){
            spell_strength_other += 1
        }
        if(spell_self[((element_index+2) mod 5)] >= 1){
            spell_strength_other += 1
        }
    }
}

return (spell_strength_self - spell_strength_other)

