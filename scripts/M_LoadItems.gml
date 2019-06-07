///M_LoadItems(filename);
// loads *.itm data
{
    var filename = argument0;

    var t_thing = 0;
    
    //lib loading
    var num;
    var tmp;
    var tofs=0;
    
    //loop parameters
    var numitms = 0;
    var i = 0;
    
    //item parameters read by loop
    var garbage = 0;    //dummy reads
    var cx = 0;
    var cy = 0;
    var type = 0;
    
    //parameters extrapolated from loop parameters
    var rx = 0;
    var ry = 0;
    
    num = CA_CheckNumForName(filename);
    tmp = global.shadowlib_info[num];

    if(tmp.size == 0) exit;
    numitms = tmp.size/42;
    
    for(i=0;i < numitms; i++) {
        tofs = tmp.offset + (i*42);
        buffer_seek(global.shadowlib,buffer_seek_start,tofs);
        
        garbage = buffer_read(global.shadowlib,buffer_u32);
        garbage = buffer_read(global.shadowlib,buffer_u32);
        garbage = buffer_read(global.shadowlib,buffer_u32);
        
        cx = buffer_read(global.shadowlib,buffer_u32);
        cy = buffer_read(global.shadowlib,buffer_u32);
        
        garbage = buffer_read(global.shadowlib,buffer_u32);
        
        rx = (cx*64)+32;
        ry = (cy*64)+32;
        
        t_thing = instance_create(rx,ry,thing);
        
        t_thing.z = 0;
        t_thing.zspeed = 0;
        t_thing.height = -1;
        t_thing.sprite = _Unknown_Thing_Itm;
        t_thing.rstate = 0;
        t_thing.radius = sprite_get_width(t_thing.sprite)/2;
        t_thing.c = 0;
        t_thing.cx = 0;
        t_thing.cy = 0;
        t_thing.detect_distance = 0;
        t_thing.hp = 1000;
        t_thing.hpmax = 1000;
        t_thing.mp = 1000;
        t_thing.mpmax = 1000;
        t_thing.xp = 1000;
        t_thing.accuracy = 1000;
        t_thing.isfeared = 0;
        t_thing.isalerted = 0;
        t_thing.movetargetdir = 0;
        t_thing.target_x = 0;
        t_thing.target_y = 0;
        t_thing.gpspeed = 0;
        t_thing.canmove = 0;
        t_thing.thingid = -1;

        if(t_thing.height >= 16) {
            t_thing.mask_index = thing_width_16;
            t_thing.collision = 1;
        }
        else {
            t_thing.mask_index = thing_nocollision;
            t_thing.collision = 0;
        }
        
    }
    
}
