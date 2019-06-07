///M_SetupLevel(levelnum);
{
    var levelnum = argument0;
    var tmpstring;
    var skyallowed=0;
    var musicstr;

    if(!file_exists(SCRIPT_PATH_MAPINFO)) {
        I_Quit("M_SetupLevel: no mapinfo");
    }

    instance_destroy(info_sky);

    ini_open(SCRIPT_PATH_MAPINFO);
    
    tmpstring = ini_read_string("maplist",levelnum,"-1");
    
    if (tmpstring != "-1") {
        if(file_exists(PATH_BASE+tmpstring)) {
            ini_close();
            
            ini_open(PATH_BASE+tmpstring);
            global.levelheight = ini_read_real("mapinfo","height",64);
            global.fogcolor = ini_read_real("mapinfo","fogcolor",c_black);
            global.fogstart = ini_read_real("mapinfo","fogstart",128);
            global.foglength = ini_read_real("mapinfo","fogend",320);
            global.waterlevel = ini_read_real("mapinfo","watermapnum",0);
            global.surfacelevel = ini_read_real("mapinfo","surfacemapnum",0);
            global.ceilingallowed = ini_read_real("mapinfo","hasceiling",1);
            global.isunderwater = ini_read_real("mapinfo","iswatermap",0);
            skyallowed = ini_read_real("mapinfo","hassky",0);
            
            musicstr = ini_read_string("mapinfo","music",0);
            S_PlayMusic(musicstr);
            
            background_color = global.fogcolor;
            
            ini_close();
            
            if(skyallowed && !global.ceilingallowed) {
                instance_create(player.x,player.y,info_sky);
            }

        }
        else {
            ini_close();
            I_Quit("M_SetupLevel: no such mapinfo "+tmpstring);
        }
    }

}
