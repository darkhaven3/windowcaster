///ME_ClearMap(tilenum);
{
    var tilenum=argument0;
    var i=0;
    var tmptex = 0;
    var tmpflat = 0;
    var cx,cy;
    
    if(tilenum > global.numflats) I_Quit("ME_ClearMap: bad tilenum #"+string(tilenum));

    ME_UnloadMap();
    global.tmpstring = "floor"+string(tilenum);
    global.levelheight = 128;
    global.ceilingallowed = 1;
    global.skyenabled = 0;
    tmptex = ds_map_find_value(global.TextureReference,global.tmpstring);

    for(i=0;i<2048;i++) {
        cx = floor(i%32)*64;
        cy = floor(i/32)*64;
        global.mapbuf_tile_wallv[i] = 0;
        global.mapbuf_tile_wallh[i] = 0;
        global.mapbuf_tile_ceils[i] = 0;
        global.mapbuf_tile_floors[i] = tilenum;
        
        tmpflat = instance_place(cx,cy,floor_primitive);
        if(tmpflat) tmpflat.flat = tmptex;
        else {
            tmpflat = instance_create(cx,cy,floor_primitive);
            tmpflat.flat = tmptex;
        }
    }
    
    //starting position upon new map
    player.x = (16*64) - 32;
    player.y = (16*64) - 32;

}
