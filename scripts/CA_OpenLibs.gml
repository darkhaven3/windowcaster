{

    //
    // floppy version
    //
    if(global.gameversion == 0) {
        if(!file_exists(working_directory+"SHADOW.LIB") || !file_exists(working_directory+"SHADOW2.LIB")) {
            I_Quit("CA_OpenLib: no game data!");
        }
        
        else {
            global.shadowlib = buffer_load(working_directory+"SHADOW.LIB");
            global.shadow2lib = buffer_load(working_directory+"SHADOW2.LIB");
            global.ravdata = buffer_load(working_directory+"RAVDATA.DAT");
            
            global.shadowlib_numentries = CA_NumEntriesLib(global.shadowlib);
            global.shadow2lib_numentries = CA_NumEntriesLib(global.shadow2lib);
            global.ravdata_numentries = CA_NumEntriesDat(global.ravdata);
        }
    }
    //
    
    //
    // cd version
    //
    else if(global.gameversion == 1) {
        if(!file_exists(working_directory+"SHADOW.LIB") || !file_exists(working_directory+"SHADOW2.LIB")) {
            I_Quit("CA_OpenLibs: can't find SHADOW.LIB/SHADOW2.LIB!");
        }
        
        if(!file_exists(working_directory+"HD_CASTR.DAT") || !file_exists(working_directory+"CD_CASTR.DAT")) {
            I_Quit("CA_OpenLibs: gameversion inconsistent?");
        }

        else {
            global.shadowlib = buffer_load(working_directory+"SHADOW.LIB");
            global.shadow2lib = buffer_load(working_directory+"SHADOW2.LIB");
            global.hdcastr = buffer_load(working_directory+"HD_CASTR.DAT");
            global.cdcastr = buffer_load(working_directory+"CD_CASTR.DAT");

            global.shadowlib_numentries = CA_NumEntriesLib(global.shadowlib);
            global.shadow2lib_numentries = CA_NumEntriesLib(global.shadow2lib);
            global.hdcastr_numentries = CA_NumEntriesDat(global.hdcastr);
            global.cdcastr_numentries = CA_NumEntriesDat(global.cdcastr);
        
            draw_text(1,20,"CA_OpenLibs: found CD version");
        }
    }
    
    else {
        draw_text(1,20,"CA_OpenLibs: Nothing opened");
    }
}
