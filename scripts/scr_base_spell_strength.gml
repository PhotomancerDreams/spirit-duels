var spell = argument0
var spell_strength_base = spell[5]
var element_total = 0
var adjacent_bonus = 0

for(i = 0; i < 5; i++){
    if(spell[i] >= 1){
        element_total += 1
        if(spell[((i+1) mod 5)] >= 1){
            adjacent_bonus += 1
        }
    }
}

if(element_total >= 1){
    spell_strength_base += (1 + element_total + adjacent_bonus)
}

return spell_strength_base
