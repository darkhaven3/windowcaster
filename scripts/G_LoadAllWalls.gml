///G_LoadAllWalls();
// loads all walls from a dat.
{

    var i=0;
    var firstwall = CA_CheckNumForNameDat("startwalls") + 1;
    var endwalls = CA_CheckNumForNameDat("endwalls");
    var firstdoor = CA_CheckNumForNameDat("firstdoor") - firstwall + 1;
    var numwalls = endwalls - firstwall;
    var lumpnum = firstwall-1;
    var tmp = 0;
    var tmpstr="";
    
    for(i=0; i < numwalls; i++) {
        if(i < firstdoor) tmp = G_LoadWall(lumpnum,false);
        else if(i >= firstdoor) tmp = G_LoadWall(lumpnum,true);
        tmpstr = "wall"+string(i);
        
        ds_map_add(global.TextureReference,tmpstr,tmp);
        lumpnum++;
        global.numtextures++;
    }
}
