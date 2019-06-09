///SE_InitGameSettings();
// gets saved game settings from config.
// if the config does not exist, create it.

var cfg=0;

if(file_exists("caster.cfg")) {
        ini_open("caster.cfg");

        global.skipintro       = ini_read_real("console","c_skipintro","0");
        global.autoskipconsole = ini_read_real("console","c_skipconsole","0");
        global.musicenabled    = ini_read_real("game","g_music","1");

        ini_close();
}
    
else if(!file_exists("caster.cfg")) {
        cfg=file_text_open_write("caster.cfg");
        file_text_close(cfg);
        return -1;
}
