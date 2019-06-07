///M_LoadCreaturesDebug(filename);
// this function is planned to be replaced entirely with a more robust solution.
// right now, it does not do any checking for arcs or stats or any of that.
// that information is stored in the archetype tables for each map, which i have
// made no effort to load. yet.
{
    var filename = argument0;
    
    var lumpnum  = CA_CheckNumForName(filename);
    var info     = global.shadowlib_info[lumpnum];
    var numcrts  = info.size / 202;
    var hackofs  = 0;               //used to offset past unknown values
    var i        = 0;               //loop iterator
    var t_thing  = 0;               //object to create
    var arc      = 0;               //archetype of object
    var tid      = 0;
    var tex      = 0;
    
    if(!lumpnum || lumpnum > global.shadowlib_numentries)
        I_Quit("M_LoadCreaturesDebug: "+filename+" not found");

    if(info.size == 0) exit;
        
    buffer_seek(global.shadowlib,buffer_seek_start,info.offset);
    
    for(i=0;i < numcrts;i++) {
        hackofs = info.offset + (202*i);
        buffer_seek(global.shadowlib,buffer_seek_start,hackofs);
        t_thing = instance_create(0,0,thing);
        tid = buffer_read(global.shadowlib,buffer_u32) - 1; //test: also had -1 to correct for internal array
        t_thing.thingid = tid;
        
        //arc = global.maparcs[tid];
        
        tex = _Unknown_Thing_Crt;

        hackofs = info.offset + (202*i) + 77;
        buffer_seek(global.shadowlib,buffer_seek_start,hackofs);

        t_thing.x = (buffer_read(global.shadowlib,buffer_u16)*64)+32;
        t_thing.y = (buffer_read(global.shadowlib,buffer_u16)*64)+32;
        t_thing.sprite = tex;
        t_thing.rstate = 0;
        t_thing.z = 0;
        t_thing.zspeed = 0;
        t_thing.height = sprite_get_height(t_thing.sprite);     //arc.texture
        t_thing.radius = sprite_get_width(t_thing.sprite)/2;
        t_thing.c = 0;
        t_thing.cx = 0;
        t_thing.cy = 0;
        t_thing.detect_distance = 4;
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
        t_thing.gpspeed = 1;
        t_thing.canmove = 1;
        t_thing.collision = 1;
        t_thing.mask_index = thing_width_16;
        
    }
    
    
}
