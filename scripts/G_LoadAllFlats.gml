///G_LoadAllFlats();
// loads all flats from a dat.
{

    var i=0;
    var firstflat = CA_CheckNumForNameDat("startflats") + 1;
    var endflats = CA_CheckNumForNameDat("endflats");
    var numwalls = endflats - firstflat;
    var lumpnum = firstflat-1;
    var tmp = 0;
    var tmpstr="";
    
    for(i=0; i < numwalls; i++) {
        tmp = G_LoadFlat(lumpnum);
        tmpstr = "floor"+string(i);
        
        ds_map_add(global.TextureReference,tmpstr,tmp);
        lumpnum++;
        global.numflats++;
    }
}
