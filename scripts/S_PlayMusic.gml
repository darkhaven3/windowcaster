///S_PlayMusic(name);
{

    var name=argument0;

    if(global.musicinstalled && global.currentmusic) {
        
    audio_stop_sound(global.currentmusic);
    audio_destroy_stream(global.currentmusic);
    if(file_exists(PATH_MUSIC+name)) {
        global.currentmusic = audio_create_stream(PATH_MUSIC+name);
        audio_play_sound(global.currentmusic,666,true);
    }
    else if(!file_exists(PATH_MUSIC+name)) {
        show_message("S_PlayMusic: no such audio "+name);
        return -1;
    }
    else {
        return -1;
    }
    
    }

}
