///CA_CheckNumForName(lumpname);

{  
    var lumpname = argument0;
    
    var i=0;
    var tmp=0;
    
    for(i=0;i<global.shadowlib_numentries;i++) {
        tmp = global.shadowlib_info[i];
        
        if(tmp.name != lumpname) continue;
        
        else if(tmp.name == lumpname) {
            return i;
        }
    }

    //no lump found by that name
    return -1;
}
