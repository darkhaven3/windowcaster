{
    var ver = -1;

    if(!file_exists(working_directory+"RAVDATA.DAT") && !file_exists(working_directory+"HD_CASTR.DAT")) {
        I_Quit("I_InitGameVersion: indeterminate game mode");
    }
    //  cd or floppy version check.
    //  todo: expand this to allow the user to pick which version if both are installed
        if(file_exists(working_directory+"RAVDATA.DAT")) {
            ver = installtype.floppy; //floppy version
            __GameManager.version_string = "CD 1.01F";  //fake!
            //__GameManager.version_string = "floppy 1.12F";
        }
        else if(file_exists(working_directory+"HD_CASTR.DAT") && file_exists(working_directory+"CD_CASTR.DAT")) {
            ver = installtype.cd; //cd version
            __GameManager.version_string = "CD 1.01F";
            //I_Quit("I_InitGameVersion: CD version is not supported yet!");
        }
    global.gameversion = ver;   //remove this
    __GameManager.version_id = ver;
}
