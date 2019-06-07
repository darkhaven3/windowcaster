///ME_Load(filename);
{
    var filename = argument0;
    var i = 0;
    var cx = 0;
    var cy = 0;
    
    var inst = 0;
    
    var tf = 0;
    var tc = 0;
    var th = 0;
    var tv = 0;
    
    //door loading
    var d  = 0; //id
    var dd = 0; //dir
    var td = 0; //door texture
    var tx = 0; //door tex ref
    
    var mus = "";
    var h = 128;

    if(!file_exists(filename)) {
        show_message("ME_Load: map "+filename+" does not exist");
        exit;
    }
    
    ME_UnloadMap();
    
    ini_open(filename);
    
    h = ini_read_real("info","levelheight","128");
    d = ini_read_real("info","numdoors","0");
    mus = ini_read_string("info","music","g_ruins.ogg");
    global.skyenabled = ini_read_real("info","sky",0);
    global.ceilingallowed = (global.skyenabled == 0);
    
    S_PlayMusic(mus);
    global.levelheight = h;
    
    for(i=0;i<1024;i++) {
        cx = floor(i%32) * 64;
        cy = floor(i/32) * 64;

        tf = ini_read_real(string(i),"floor","1");
        tc = ini_read_real(string(i),"ceiling","0");
        th = ini_read_real(string(i),"wallh","0");
        tv = ini_read_real(string(i),"wallv","0");
        
        inst = instance_place(cx,cy,floor_primitive);
        inst.flat = ds_map_find_value(global.TextureReference,"floor"+string(tf));
        global.mapbuf_tile_floors[i] = tf;

        if(tc) {
            inst = instance_place(cx,cy,ceil_primitive);
            if(!inst) inst = instance_create(cx,cy,ceil_primitive);
            inst.flat = ds_map_find_value(global.TextureReference,"floor"+string(tc));
        }
        
        if(th) {
            inst = instance_place(cx+32,cy,wall_primitive);
            if(!inst) inst = instance_create(cx+64,cy,wall_primitive);
            inst.texture = ds_map_find_value(global.TextureReference,"wall"+string(th));
            inst.tz = background_get_height(inst.texture);
            inst.x1 = inst.x-64;
            inst.x2 = inst.x;
            inst.y1 = inst.y;
            inst.y2 = inst.y;
            inst.height = 65536;
            inst.mask_index = horiz_mask;
        }

        if(tv) {
            inst = instance_place(cx,cy+32,wall_primitive);
            if(!inst) inst = instance_create(cx,cy+64,wall_primitive);
            inst.texture = ds_map_find_value(global.TextureReference,"wall"+string(tv));
            inst.tz = background_get_height(inst.texture);
            inst.x1 = inst.x;
            inst.x2 = inst.x;
            inst.y1 = inst.y-64;
            inst.y2 = inst.y;
            inst.height = 65536;
            inst.mask_index = vert_mask;
        }
    }
    
    //load doors
    if(d) {
        for(i=0;i <= d;i++) {
            dd = ini_read_real("door"+string(i),"doordir","1");
            td = real(ini_read_real("door"+string(i),"texture","BADFLAT"));     //???
            tx = ds_map_find_value(global.TextureReference,"wall"+string(td));
            
            if(dd == 1) {
                inst = instance_create(cx+32,cy+64,door_primitive);
                inst.x1 = inst.x;
                inst.x2 = inst.x;
                inst.y1 = inst.y-64;
                inst.y2 = inst.y;
                inst.mask_index = vert_mask;
            }

            if(dd == 2) {
                inst = instance_create(cx+64,cy+32,door_primitive);
                inst.x1 = inst.x-64;
                inst.x2 = inst.x;
                inst.y1 = inst.y;
                inst.y2 = inst.y;
                inst.mask_index = horiz_mask;
            }

            inst.doordir = dd;
            inst.doorlen = 0;
            inst.doorstate = 0;
            inst.texture = tx;
            inst.z = 0;
            inst.tz = background_get_height(tx);
            inst.height = 65536;
            ins.collision = 1;
        }
    }
    
    ini_close();
    
}
