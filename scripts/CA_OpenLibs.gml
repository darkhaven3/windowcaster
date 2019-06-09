    //if the floppy version is detected...
    if(global.gameversion = installtype.floppy) {
    
        window_set_caption("WindowCaster "+ENGINE_VERSION+": Shadowcaster Floppy 1.12F");
        global.ravdata = _CA_OpenLib("RAVDATA.DAT");
        global.shadowlib = _CA_OpenLib("SHADOW.LIB");
        global.shadow2lib = _CA_OpenLib("SHADOW2.LIB");

        global.ravdata_numentries = CA_NumEntriesDat(global.ravdata);
        global.shadowlib_numentries = CA_NumEntriesLib(global.shadowlib);
        global.shadow2lib_numentries = CA_NumEntriesLib(global.shadow2lib);
        
    }

    //if the cd version is detected...
    else if(global.gameversion = installtype.cd) {
        
        window_set_caption("WindowCaster "+ENGINE_VERSION+": Shadowcaster CD 1.01F");
        global.shadowlib = _CA_OpenLib("SHADOW.LIB");
        global.shadow2lib = _CA_OpenLib("SHADOW2.LIB");
        global.hdcastr = _CA_OpenLib("HD_CASTR.DAT");
        global.cdcastr = _CA_OpenLib("CD_CASTR.DAT");

        global.hdcastr_numentries = CA_NumEntriesDat(global.hdcastr);
        global.cdcastr_numentries = CA_NumEntriesDat(global.cdcastr);
        global.shadowlib_numentries = CA_NumEntriesLib(global.shadowlib);
        global.shadow2lib_numentries = CA_NumEntriesLib(global.shadow2lib);

    }
    
    else if(global.gameversion = installtype.unknown) {
        I_Quit("__GameManager: no game data");
    }
