///G_LoadExternalTextures();
// TODO: make this parameterized.

    if(file_exists(SCRIPT_PATH_FLOOR_TEXTURES)) {
    ini_open(SCRIPT_PATH_FLOOR_TEXTURES);

    if(!ini_section_exists("floors"))
        I_Quit("__TextureManager: One of the loaded PK3s has malformed floor texture definitions");
    
    for(i=0;i<256;++i) {
        tmpstring = "floor"+string(i);
        tmpstring2 = ini_read_string("floors",string(i),"badflat.png");
        tmptex = PATH_TEXTURES+tmpstring2;
        
        //texture definition does not already exist
        if(!ds_map_exists(global.TextureReference,tmpstring)) {
            if(!file_exists(tmptex))
                ds_map_add(global.TextureReference,tmpstring,BADFLAT);
        
            else {
                tmptex=background_add(tmptex,false,false);
                ds_map_add(global.TextureReference,tmpstring,tmptex);
                global.numflats++;
            }
        }
        
        //texture definition does already exist
        else if(ds_map_exists(global.TextureReference,tmpstring)) {
            if(!file_exists(tmptex)) {
                //debug
                //ds_map_replace(global.TextureReference,tmpstring,BADFLAT);
                continue;
            }
            else {
                tmptex=background_add(tmptex,false,false);
                ds_map_replace(global.TextureReference,tmpstring,tmptex);
            }
        }
    }
    
    ini_close();
    
    }

///////////////////////////////////////

    if(file_exists(SCRIPT_PATH_WALL_TEXTURES)) {
    
    ini_open(SCRIPT_PATH_WALL_TEXTURES);

    if(!ini_section_exists("walls"))
        I_Quit("__TextureManager: One of the loaded PK3s has malformed wall texture definitions");
    
    for(i=0;i<256;++i) {
        tmpstring = "wall"+string(i);
        tmpstring2 = ini_read_string("walls",string(i),"badflat.png");
        
        tmptex = PATH_TEXTURES+tmpstring2;

        //texture definition does not already exist
        if(!ds_map_exists(global.TextureReference,tmpstring)) {
            if(!file_exists(tmptex))
                ds_map_add(global.TextureReference,tmpstring,BADFLAT);
        
            else {
                tmptex=background_add(tmptex,false,false);
                ds_map_add(global.TextureReference,tmpstring,tmptex);
                global.numtextures++;
            }
        }
        
        //texture definition does already exist
        else if(ds_map_exists(global.TextureReference,tmpstring)) {
            if(!file_exists(tmptex)) {
                //debug
                //ds_map_replace(global.TextureReference,tmpstring,BADFLAT);
                continue;
            }
            else {
                tmptex=background_add(tmptex,false,false);
                ds_map_replace(global.TextureReference,tmpstring,tmptex);
            }
        }
    }
    
    ini_close();
    
    }

/*
    // This function should not be needed for Shadowcaster.
    // Un-comment this section to re-enable loading of ceiling textures as a separate list.
    ini_open(SCRIPT_PATH_CEILING_TEXTURES);

    if(!ini_section_exists("ceils"))
        I_Quit("__TextureManager: One of the loaded PK3s has malformed ceiling texture definitions");
    
    for(i=0;i<256;++i) {
        tmpstring = "ceil"+string(i);
        tmpstring2 = ini_read_string("ceilings",string(i),"-1");
        
        if(tmpstring2 = "-1") continue;
        
        tmptex = PATH_TEXTURES+tmpstring2;
        
        if(!file_exists(tmptex))
            ds_map_add(TextureReference,tmpstring,BADFLAT);
        
        else {
            tmptex=background_add(tmptex,false,false);
            ds_map_add(TextureReference,tmpstring,tmptex);
            global.numflats++;
        }
    }
    
    ini_close();

*/
