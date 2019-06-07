///CA_ConstructMapDebug(mapfile);
{
    var mapfile=argument0;
    var mapdoors = M_GetMapFileName(global.currentlevel)+".dor";
    var mapojts = M_GetMapFileName(global.currentlevel)+".ojt";
    var mapitms = M_GetMapFileName(global.currentlevel)+".itm";
    var mapcrts = M_GetMapFileName(global.currentlevel)+".crt";
    var maparcs = M_GetMapFileName(global.currentlevel)+".arc";
    var mapscr  = M_GetMapFileName(global.currentlevel)+".scr";
    
    var global.floorpics=0;
    var global.floorheights=0;
    var global.ceilpics=0;
    var global.ceilheights=0;
    var global.wallsnorth=0;
    var global.u_walln=0;
    var global.wallswest=0;
    var global.u_wallw=0;
    var global.doors=0;
    var global.unused=0;
    
    //numforname
    var tmpnum=0;
    var tmpofs=0;
    var tmpobj=0;
    
    var makewallval=0;
    var makewalltmp=0;
    
    var tmpcc=0;

    var curx=0;
    var cury=0;
    var global.tmpstring="";
    
    var curc=0;
    var curcc=0;
    var curoffset=0;
    
    tmpnum = CA_CheckNumForName(mapfile);
    tmpobj = global.shadowlib_info[tmpnum];
    tmpofs = tmpobj.offset;

    buffer_seek(global.shadowlib,buffer_seek_start,tmpofs);
    
    //floorpic
    global.floorpics = buffer_tell(global.shadowlib);
    while(curc<1024) {
            tmp = buffer_read(global.shadowlib,buffer_u16);
            global.mapbuf_tile_floors[curc] = tmp;
            curc++;
        }
    //floorheight
    global.floorheights = buffer_tell(global.shadowlib);
    curc = 0;
    while(curc<1024) {
            tmp = buffer_read(global.shadowlib,buffer_s8);
            global.mapbuf_tile_floorh[curc] = tmp;
            curc++;
        }
    //ceilpic
    global.ceilpics = buffer_tell(global.shadowlib);
    curc = 0;
    while(curc<1024) {
            tmp = buffer_read(global.shadowlib,buffer_u16);
            global.mapbuf_tile_ceils[curc] = tmp;
            curc++;
        }
    //ceilheight
    global.ceilheights = buffer_tell(global.shadowlib);
    curc = 0;
    while(curc<1024) {
            tmp = buffer_read(global.shadowlib,buffer_s8);
            global.mapbuf_tile_ceilh[curc] = tmp;
            curc++;
        }
    //wallsnorth
    global.wallsnorth = buffer_tell(global.shadowlib);
    curc = 0;
    while(curc<1024) {
            tmp = buffer_read(global.shadowlib,buffer_u16);
            global.mapbuf_tile_wallv[curc] = tmp;
            curc++;
        }
    //unknown_walln
    global.u_walln = buffer_tell(global.shadowlib);
    curc = 0;
    while(curc<1024) {
            tmp = buffer_read(global.shadowlib,buffer_s8);
            global.mapbuf_tile_unkdata_wv[curc] = tmp;
            curc++;
        }
    //wallswest
    global.wallswest = buffer_tell(global.shadowlib);
    curc = 0;
    while(curc<1024) {
            tmp = buffer_read(global.shadowlib,buffer_u16);
            global.mapbuf_tile_wallh[curc] = tmp;
            curc++;
        }
    //unknown_wallw
    global.u_wallw = buffer_tell(global.shadowlib);
    curc = 0;
    while(curc<1024) {
            tmp = buffer_read(global.shadowlib,buffer_s8);
            global.mapbuf_tile_unkdata_wh[curc] = tmp;
            curc++;
        }
    //doors
    global.doors = buffer_tell(global.shadowlib);
    curc = 0;
    while(curc<1024) {
            tmp = buffer_read(global.shadowlib,buffer_s8);
            global.mapbuf_tile_doors[curc] = tmp;
            curc++;
        }
    //unused?
    global.unused = buffer_tell(global.shadowlib);
    curc = 0;
    while(curc<1024) {
            tmp = buffer_read(global.shadowlib,buffer_s8);
            global.mapbuf_tile_unused[curc] = tmp;
            curc++;
        }
    
    //generate ceilings
    if(global.ceilingallowed) {
        curc = 0;
        curx = 0;
        cury = 0;

        while(curc<1024) {
                curcc = global.mapbuf_tile_ceils[curc];
                cury = (floor(curc/32))*64;
                curx = (curc%32)*64;
            
                if(curcc == 0) {
                    curc++;
                    continue;
                }
            
                global.tmpstring = "floor"+string(global.mapbuf_tile_ceils[curc]);

                    makewalltmp = instance_create(curx,cury,ceil_primitive);
                
                    if(ds_map_exists(global.TextureReference,global.tmpstring)) {
                        makewallval = ds_map_find_value(global.TextureReference,global.tmpstring);
                    }
                    else {
                        makewallval = BADFLAT;
                    }

                        makewalltmp.flat = makewallval;

                curc++;
        }
    }

    //generate floors
    curc = 0;
    curx = 0;
    cury = 0;

    while(curc<1024) {
            curcc = global.mapbuf_tile_floors[curc];
            cury = (floor(curc/32))*64;
            curx = (curc%32)*64;
            
            if(curcc == 0) {
                curc++;
                continue;
            }
            
            global.tmpstring = "floor"+string(global.mapbuf_tile_floors[curc]);

                makewalltmp = instance_create(curx,cury,floor_primitive);
                
                if(ds_map_exists(global.TextureReference,global.tmpstring)) {
                    makewallval = ds_map_find_value(global.TextureReference,global.tmpstring);
                }
                else {
                    makewallval = BADFLAT;
                }

                    makewalltmp.flat = makewallval;

            curc++;
    }

    //generate hwalls
    curc = 0;
    curx = 0;
    cury = 0;

    while(curc<1024) {
            curcc = global.mapbuf_tile_wallv[curc];
            cury = (floor(curc/32))*64;
            curx = ((curc+1)%32)*64;
            
            if(curcc == 0) {
                curc++;
                continue;
            }
            
            global.tmpstring = "wall"+string(global.mapbuf_tile_wallv[curc]);

                makewalltmp = instance_create(curx,cury,wall_primitive);
                
                if(ds_map_exists(global.TextureReference,global.tmpstring)) {
                    makewallval = ds_map_find_value(global.TextureReference,global.tmpstring);
                }
                else {
                    makewallval = BADFLAT;
                }

                    makewalltmp.texture = makewallval;
                    makewalltmp.tz = background_get_height(makewallval);
                    makewalltmp.x1 = makewalltmp.x-64;
                    makewalltmp.x2 = makewalltmp.x;
                    makewalltmp.y1 = makewalltmp.y;
                    makewalltmp.y2 = makewalltmp.y;
                    makewalltmp.height = 65536;
                    makewalltmp.z = 0;
                    makewalltmp.mask_index = horiz_mask;
                    makewalltmp.collision = 1;

            curc++;
    }
    
    //generate vwalls
    curc = 0;
    curx = 0;
    cury = 0;

    while(curc<1024) {
            curcc = global.mapbuf_tile_wallh[curc];
            cury = (floor(curc/32)+1)*64;
            curx = (curc%32)*64;
            
            if(curcc == 0) {
                curc++;
                continue;
            }
            
            global.tmpstring = "wall"+string(global.mapbuf_tile_wallh[curc]);

                makewalltmp = instance_create(curx,cury,wall_primitive);
                
                if(ds_map_exists(global.TextureReference,global.tmpstring)) {
                    makewallval = ds_map_find_value(global.TextureReference,global.tmpstring);
                }
                else {
                    makewallval = BADFLAT;
                }

                    makewalltmp.texture = makewallval;
                    makewalltmp.tz = background_get_height(makewallval);
                    makewalltmp.x1 = makewalltmp.x;
                    makewalltmp.x2 = makewalltmp.x;
                    makewalltmp.y1 = makewalltmp.y-64;
                    makewalltmp.y2 = makewalltmp.y;
                    makewalltmp.height = 65536;
                    makewalltmp.z = 0;
                    makewalltmp.mask_index = vert_mask;
                    makewalltmp.collision = 1;

            curc++;
    }

    M_LoadMapArcs(maparcs);
    M_LoadDoors(mapdoors);
    M_LoadObjects(mapojts);
    M_LoadItems(mapitms);
    M_LoadCreaturesDebug(mapcrts);
    //M_LoadScript(mapscr);

}
