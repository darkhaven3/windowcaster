///CA_LoadItemTypes(lumpname);
// Call once at game start. Never again.
{
    var lumpname = argument0;

    var num  = CA_CheckNumForName(lumpname);
    var info = global.shadowlib_info[num];
    var ofs  = info.offset;
    var siz  = info.size;

    var i = 0;
    var numtypes = siz/178;
    var hackofs = 0;

    var t_thing   = 0;
    var garbage   = 0;
    var g_name    = "";
    var r_name    = "";

    for(i=0;i < numtypes;i++) {
        hackofs = (i*178) + ofs;
        buffer_seek(global.shadowlib,buffer_seek_start,hackofs);

        t_thing = instance_create(0,0,itmtype);
        t_thing.itemid = buffer_read(global.shadowlib,buffer_u32);
        
        garbage = buffer_read(global.shadowlib,buffer_u32);
        garbage = buffer_read(global.shadowlib,buffer_u32);
        
        r_name  = buffer_read(global.shadowlib,buffer_string);
    }

}
