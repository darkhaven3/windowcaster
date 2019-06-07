///CA_BuildInfoTables();
// reads the lib/dat directories and creates infotables from them
{

    var i=1;
    var numlumps;
    
    var ref=0;
    var rofs=0;
    
    var tmpofs=0;
    var tmpsiz=0;
    var tmpname="";
    
    var dat_dirstart=0;
    var dat_nameofs=0;
    var dat_flags=0;
    
    numlumps = global.shadowlib_numentries;
    
    for(i=1;i<numlumps+1;i++) {
        rofs = (i*21) + 2;
        buffer_seek(global.shadowlib,buffer_seek_end,rofs);
        ref = instance_create(0,0,lumpinfo);
        
        tmpsiz = buffer_read(global.shadowlib,buffer_u32);
        tmpofs = buffer_read(global.shadowlib,buffer_u32);
        tmpname = buffer_read(global.shadowlib,buffer_string);
        
        ref.size = tmpsiz;
        ref.offset = tmpofs;
        ref.name = tmpname;
        
        global.shadowlib_info[i-1] = ref;
        object_set_persistent(ref,true);
        
    }

    //build dat infotable

    numlumps = global.ravdata_numentries;

    buffer_seek(global.ravdata,buffer_seek_start,2);
    dat_dirstart = buffer_read(global.ravdata,buffer_u32);
    
    for(i=1;i<numlumps+1;i++) {
        rofs = dat_dirstart + (12*i);
        buffer_seek(global.ravdata,buffer_seek_start,rofs);
        
        tmpofs = buffer_read(global.ravdata,buffer_u32);
        tmpsiz = buffer_read(global.ravdata,buffer_u32);
        dat_nameofs = buffer_read(global.ravdata,buffer_u16);
        dat_flags = buffer_read(global.ravdata,buffer_u16);
        
        ref = instance_create(0,0,datlumpinfo);

        ref.offset = tmpofs;
        ref.size = tmpsiz;
        ref.nameofs = dat_nameofs;
        ref.flags = dat_flags;
        
        tmpofs = dat_dirstart + dat_nameofs;
        
        buffer_seek(global.ravdata,buffer_seek_start,tmpofs);
        tmpname = buffer_read(global.ravdata,buffer_string);
        
        ref.name = tmpname;

        global.ravdata_info[i-1] = ref;
    
    }

}
