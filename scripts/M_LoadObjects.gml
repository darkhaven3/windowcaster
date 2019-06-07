///M_LoadObjects(filename);
// loads *.ojt data
{
    var filename = argument0;

    //lib loading
    var num;
    var tmp;
    var hackofs=36;     //hack offset to skip to end of string
    
    //object handling
    var t_thing=0;
    var tx,ty;
    var type;
    var numojts=0;
    var i=0;
    
    //temp variables
    var garbage=0;      //dummy reads
    var gname="";       //literal lump name
    var cx=0;           //cell coordinates
    var cy=0;
    var tofs=0;
    var tmpimg=0;
    
    num = CA_CheckNumForName(filename);
    tmp = global.shadowlib_info[num];

    if(tmp.size == 0) exit;
    numojts = tmp.size/57;
    
    for(i=0;i < numojts; i++) {
        tofs = i*57 + tmp.offset;
        buffer_seek(global.shadowlib,buffer_seek_start,tofs);
        
        garbage = buffer_read(global.shadowlib,buffer_u32);
        garbage = buffer_read(global.shadowlib,buffer_u32);
        garbage = buffer_read(global.shadowlib,buffer_u32);
        garbage = buffer_read(global.shadowlib,buffer_u16);
        
        gname = buffer_read(global.shadowlib,buffer_string);
        
        buffer_seek(global.shadowlib,buffer_seek_start,tofs+hackofs);
        
        garbage = buffer_read(global.shadowlib,buffer_u16);
        garbage = buffer_read(global.shadowlib,buffer_u16);
        garbage = buffer_read(global.shadowlib,buffer_u16);
        garbage = buffer_read(global.shadowlib,buffer_u16);
        garbage = buffer_read(global.shadowlib,buffer_u16);
        garbage = buffer_read(global.shadowlib,buffer_u16);
        garbage = buffer_read(global.shadowlib,buffer_u16);
        
        cx = buffer_read(global.shadowlib,buffer_u8);
        cy = buffer_read(global.shadowlib,buffer_u8);
        
        tx = (cx*64)+32;
        ty = (cy*64)+32;
        
        if(ds_map_exists(global.SpriteReference,gname)) tmpimg = ds_map_find_value(global.SpriteReference,gname);
        else tmpimg = _Unknown_Thing_Ojt;
        
        t_thing = instance_create(tx,ty,thing);   //hack thing
        t_thing.z = 0;
        t_thing.zspeed = 0;
        t_thing.height = sprite_get_height(tmpimg);
        t_thing.sprite = tmpimg;
        t_thing.rstate = 0;
        t_thing.radius = sprite_get_width(tmpimg)/2;
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
            t_thing.height = 0;
        }
    }
    
}
