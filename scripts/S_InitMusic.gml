///S_InitMusic();

{
    if(!directory_exists(PATH_MUSIC)) {
        global.musicinstalled = 0;
        exit;
    }
    else if(directory_exists(PATH_MUSIC)) {
        global.musicinstalled = 1;
        exit;
    }
}
