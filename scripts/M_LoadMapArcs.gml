///M_LoadMapArcs(filename);
{
    var filename = argument0;
    var lumpnum  = CA_CheckNumForName(filename);
    var info     = global.shadowlib_info[lumpnum];
    var tmpstring= "";
    
    if(info.size == 0) exit;

    var thisarc = 0;    //loop iterator
    var arc     = 0;    //object id reference
    var numarcs = info.size / 1091;
    var hackofs = 0;    //hack offset
    
    var garbage = 0;    //dummy reads
    var lname   = "";   //graphic name
    
    var ofs_to_graphic_name = 36;

    buffer_seek(global.shadowlib,buffer_seek_start,info.offset);
    for(thisarc=0; thisarc < numarcs; thisarc++) {
        hackofs = info.offset + (thisarc * 1091);
        buffer_seek(global.shadowlib,buffer_seek_start,hackofs);
        
        garbage = buffer_read(global.shadowlib,buffer_u32);
        garbage = buffer_read(global.shadowlib,buffer_u32);
        garbage = buffer_read(global.shadowlib,buffer_u32);
        garbage = buffer_read(global.shadowlib,buffer_u32);
        garbage = buffer_read(global.shadowlib,buffer_u32);
        garbage = buffer_read(global.shadowlib,buffer_u32);
        garbage = buffer_read(global.shadowlib,buffer_u32);
        garbage = buffer_read(global.shadowlib,buffer_u32);
        garbage = buffer_read(global.shadowlib,buffer_u32);
        
        arc = instance_create(0,0,archetype);
        
        lname = buffer_read(global.shadowlib, buffer_string);
        arc.spritename = lname;

        tmpstring = PATH_SPRITES+lname+".png";
        
        if(file_exists(tmpstring)) {
        arc.texture = sprite_add(tmpstring,1,false,false,0,0);
        }
        
        else {
            arc.texture = _Unknown_Thing_Crt;
        }
        
        global.thingtest[thisarc] = arc.texture;
        global.maparcs[thisarc] = arc;
        instance_deactivate_object(arc);
    }
    
}
