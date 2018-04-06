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
}

if(player_id != noone){
    player_id.focus_level = buffer_read(buffer, buffer_u8);
    player_id.player_health = buffer_read(buffer, buffer_u8);
    for(i = 0; i < 6; i++){
        player_id.spell_cast[i] = buffer_read(buffer, buffer_u8);
        player_id.defending_spell[i] = buffer_read(buffer, buffer_u8);
        player_id.cooldowns[i] = buffer_read(buffer, buffer_u8);
    }
    
    obj_player_data.alarm[2] = 1;
    obj_opponent_data.alarm[2] = 1;
    obj_music_player1.alarm[0] = 2;
    room_goto(2);
}
