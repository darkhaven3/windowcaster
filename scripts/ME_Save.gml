///ME_Save(filename);
// saves the current map.
{
    var filename = argument0;
    var i = 0;
    var d = instance_number(door_primitive);
    var s = (global.ceilingallowed == 0);
    
    //for determining cell coordinates
    var cellid = 0;
    var cx = 0;
    var cy = 0;

    ini_open(filename);
    
    ini_write_real("info","levelheight",global.levelheight);
    ini_write_real("info","sky",s);
    
    with(door_primitive) {
        ini_write_real("door"+string(d),"x",x);
        ini_write_real("door"+string(d),"y",y);
        ini_write_real("door"+string(d),"dir",doordir);
        
        cx = floor(x/64);
        cy = floor(y/64);
        cellid = (cy*32) + cx;
        
        ini_write_real("door"+string(d),"texture",global.mapbuf_tile_packdoors[cellid]);    //not sure how to implement this yet
        d++;
    }
    
    for(i=0;i < 1024; i++) {
        ini_write_real(string(i),"floor",global.mapbuf_tile_floors[i]);
        ini_write_real(string(i),"ceiling",global.mapbuf_tile_ceils[i]);
        ini_write_real(string(i),"wallh",global.mapbuf_tile_wallv[i]);
        ini_write_real(string(i),"wallv",global.mapbuf_tile_wallh[i]);
    }
    
    ini_write_real("info","numdoors",d);
    
    ini_close();
}
