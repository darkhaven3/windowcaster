///M_LoadDoors(filename);
// loads doors from a filename.
{
    var filename = argument0;
    var firstwall = CA_CheckNumForNameDat("startwalls")+1;

    //door properties
    var garbage;        //always junk-filled
    var cx=0;
    var cy=0;         //cell coords
    var cellid = 0;   //cellid for packdoors
    var facing;
    var gname=0;
    var flags;
    
    //temp variables
    var rx, ry;
    var num, tmp;
    var numdoors;
    var tmpobj;
    var i=0;
    var iofs=0;
    var hackofs = 0;
    var glump=0;        //the graphic's lumpnum
    var tid=0;          //the final texture id
    var tstr="";        //final texture string, use this as reference in ds_map
    var ostr="";        //intermediary string to pass into tstr

    num = CA_CheckNumForName(filename);
    tmp = global.shadowlib_info[num];
    numdoors = tmp.size / 52;
    
    buffer_seek(global.shadowlib, buffer_seek_start, tmp.offset);
    
    //this loop contains hacks to get around data i have not figured out yet
    for(i = 0;i < numdoors; i++) {
        iofs = (i * 52) + tmp.offset;
        buffer_seek(global.shadowlib, buffer_seek_start, iofs);
        
        //garbage reads
        garbage = buffer_read(global.shadowlib,buffer_u32);
        garbage = buffer_read(global.shadowlib,buffer_u32);
        garbage = buffer_read(global.shadowlib,buffer_u32);
        
        //direction
        facing = buffer_read(global.shadowlib,buffer_u8);
        
        //gfx name and texture id reference
        gname = buffer_read(global.shadowlib,buffer_string);
        if(gname == "door1") gname = "firstdoor";               //necessary hack :(
        
        glump = CA_CheckNumForNameDat(gname)+1;
        tid = glump - firstwall;
        ostr = "wall"+string(tid);
        
        if(ds_map_exists(global.TextureReference,ostr)) {
            tstr = ds_map_find_value(global.TextureReference,ostr);
        }
        else {
            tstr = BADFLAT;
        }
        
        //go to next value, skipping the remainder of the string field -- HACK!
        hackofs = iofs + 40;
        buffer_seek(global.shadowlib, buffer_seek_start, hackofs);
        
        cx = buffer_read(global.shadowlib, buffer_u8);
        garbage = buffer_read(global.shadowlib, buffer_u8);
        garbage = buffer_read(global.shadowlib, buffer_u8);
        garbage = buffer_read(global.shadowlib, buffer_u8);

        cy = buffer_read(global.shadowlib, buffer_u8);
        garbage = buffer_read(global.shadowlib, buffer_u8);
        garbage = buffer_read(global.shadowlib, buffer_u8);
        garbage = buffer_read(global.shadowlib, buffer_u8);
        
        rx = (cx * 64) + 64;    //fudged for collision
        ry = (cy * 64) + 64;    //reverse the subtractions below to revert behavior
        
        flags = buffer_read(global.shadowlib, buffer_u32);
        
        tmpobj = instance_create(rx,ry,door_primitive);
        
        tmpobj.texture = tstr;
        tmpobj.tz = background_get_height(tstr);
        tmpobj.doorstate = 0;
        tmpobj.doorlen = 0;
        tmpobj.collision = 1;
        tmpobj.height = 65536;
        
        //door is vert?
        if(facing) {
            tmpobj.y -= 32;
            tmpobj.x1 = tmpobj.x - 64;
            tmpobj.x2 = tmpobj.x;
            tmpobj.y1 = tmpobj.y;
            tmpobj.y2 = tmpobj.y;
            tmpobj.mask_index = horiz_mask;
            tmpobj.doordir = 2;
        }
        
        //door is horz?
        else if(!facing) {
            tmpobj.x -= 32;
            tmpobj.x1 = tmpobj.x;
            tmpobj.x2 = tmpobj.x;
            tmpobj.y1 = tmpobj.y - 64;
            tmpobj.y2 = tmpobj.y;
            tmpobj.mask_index = vert_mask;
            tmpobj.doordir = 1;
        }
        
        cellid = (cy*32) + cx;
        global.mapbuf_tile_doors[cellid] = tid; //assign door texture id here
        
    }
    
    //debug
    //global.systemmsg = "M_loaddoors: "+gname+"?";
    
}
