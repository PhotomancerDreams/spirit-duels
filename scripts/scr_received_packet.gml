///scr_received_packet(buffer)
var buffer = argument[0];
var message_id = buffer_read(buffer, buffer_u8);
var player_id = noone;

//show_message("message_id: "+string(message_id));

if(message_id == 1){
    player_id = obj_player_data;
}else if(message_id == 2){
    player_id = obj_opponent_data;
}else if(message_id == 3){
    var outcome = buffer_read(buffer, buffer_u8);
    if(outcome == 0){
        obj_prompt.prompt_text = "Opponent has left the game.";
    }else if(outcome == 1){
        obj_prompt.prompt_text = "Victory";
    }else if(outcome == 2){
        obj_prompt.prompt_text = "Defeat";
    }else if(outcome == 3){
        obj_prompt.prompt_text = "Tie";
    }
    instance_create(room_width/2, room_height/2, obj_restart_button);
}else if(message_id == 4){
    obj_opponent_data.attack = buffer_read(buffer, buffer_u8);
    obj_opponent_data.defend = buffer_read(buffer, buffer_u8);
    obj_opponent_data.focus = buffer_read(buffer, buffer_u8);
    for(i = 0; i < 6; i++){
        obj_opponent_data.spell_cast[i] = buffer_read(buffer, buffer_u8);
    }
    obj_animator.alarm[1] = 1
}

if(player_id != noone){
    var dummy = instance_create(1, 1, obj_dummy_data);
    dummy.target = player_id;
    dummy.focus_level = buffer_read(buffer, buffer_u8);
    dummy.player_health = buffer_read(buffer, buffer_u8);
    for(i = 0; i < 6; i++){
        dummy.spell_cast[i] = buffer_read(buffer, buffer_u8);
        dummy.defending_spell[i] = buffer_read(buffer, buffer_u8);
        dummy.cooldowns[i] = buffer_read(buffer, buffer_u8);
    }
}
