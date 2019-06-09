///G_LoadSprites();
//TODO: actually load sprites out of ravdata
//TODO: replace ravdata-specific checks
    
    var startsprites = CA_CheckNumForNameDat("startsprites")+1;
    var endsprites   = CA_CheckNumForNameDat("endsprites");
    var numsprites   = endsprites - startsprites;
    
    for(i=0;i < numsprites;i++) {
        tmpinfo = global.ravdata_info[startsprites+i];
        tmpstring = tmpinfo.name+".png";
        
        if(!file_exists(PATH_SPRITES+tmpstring)) ds_map_add(global.SpriteReference,tmpinfo.name,_Dont_Place);
        else {
            tmptex = sprite_add(PATH_SPRITES+tmpstring,0,false,false,0,0);
            ds_map_add(global.SpriteReference,tmpinfo.name,tmptex);
        }
    }
