///CA_CheckNumForNameDat(lumpname);

{  
    var lumpname = argument0;
    
    var i=0;
    var tmp=0;
    
    for(i=0;i<global.ravdata_numentries;i++) {
        tmp = global.ravdata_info[i];
        
        if(tmp.name != lumpname) continue;
        
        else if(tmp.name == lumpname) {
            //show_message("CA_CheckNumForNameDat: "+lumpname+" is "+string(i));
            return i;
        }
    }

    //no lump found by that name
    show_message("CA_CheckNumForNameDat: "+lumpname+" not found");
    return -1;
}
