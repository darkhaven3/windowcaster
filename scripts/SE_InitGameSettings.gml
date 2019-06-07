///SE_InitGameSettings();
// gets saved game settings from config.
{
    global.skipintro       = ini_read_real("console","c_skipintro","0");
    global.autoskipconsole = ini_read_real("console","c_skipconsole","0");
    global.musicenabled    = ini_read_real("game","g_music","1");
}
