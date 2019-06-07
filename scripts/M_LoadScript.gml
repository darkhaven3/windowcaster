///M_LoadScript(lumpname);
// loads a binary script and handles all the translation to internal triggers.

    var lumpname = argument0;
    var lumpnum  = CA_CheckNumForName(lumpname);
    var info     = global.shadowlib_info[lumpnum];
    
    if(info.size == 0) exit;
    
    var i=0;    //loop iterator
    var j=0;    //script collection iterator
    
    var action = 0;     //u16
    var condition = 0;  //u8
    var paramtmp = 0;   //u32
    
    var newdata = 0;    //scriptdata object
    var prev = 0;       //previously created scriptdata (for linked list)
    
    buffer_seek(global.shadowlib,buffer_seek_start,info.offset);
    
    for(j=0;buffer_tell(global.shadowlib) < info.offset+info.size;j++) {
    if(j) buffer_seek(global.shadowlib,buffer_seek_relative,1); //skip script block delimiter
    prev = 0;   //drop reference to previous scriptdata
    
    if(buffer_tell(global.shadowlib) >= info.offset+info.size) exit;

        for(i=0;buffer_peek(global.shadowlib,buffer_tell(global.shadowlib),buffer_u8) != $ff;i++) {

            ///////////////////////////////////////////////////////////////////
            //hack to try to skip leading byte in some triggers (?)////////////
            if(buffer_peek(global.shadowlib,buffer_tell(global.shadowlib),buffer_u8) == $00 &&
                buffer_peek(global.shadowlib,buffer_tell(global.shadowlib),buffer_u32) == $84000000)    //might not be "correct"  L-E
                    buffer_seek(global.shadowlib,buffer_seek_relative,1);
            
            else if(buffer_peek(global.shadowlib,buffer_tell(global.shadowlib),buffer_u8) == $00 &&
                    buffer_peek(global.shadowlib,buffer_tell(global.shadowlib),buffer_u16) != $0000)
                        buffer_seek(global.shadowlib,buffer_seek_relative,1);
            else if(buffer_peek(global.shadowlib,buffer_tell(global.shadowlib),buffer_u16) == $0834)    //???
                buffer_seek(global.shadowlib,buffer_seek_relative,1);
            ///////////////////////////////////////////////////////////////////
            ///////////////////////////////////////////////////////////////////

            newdata = instance_create(0,0,scriptdata);
            newdata.action = buffer_read(global.shadowlib,buffer_u16);
            newdata.condition = buffer_read(global.shadowlib,buffer_u8);
            newdata.triggerlist = j;
            
            if(prev) prev.next = newdata;

            switch(newdata.action) {
                default:
                    show_message("M_LoadScript: unmapped sc action "+string(action)+" at "+string(i)+" of "+string(j));
                    break;
                
                //1 parameter
                case trigger.unk_0000:
                case trigger.unk_0200:
                case trigger.unk_0300:
                case trigger.unk_0400:
                case trigger.unk_0500:
                case trigger.unk_0680:
                case trigger.unk_0780:
                case trigger.unk_0f80:
                case trigger.unk_1080:
                case trigger.unk_1380:
                case trigger.unk_1580:
                case trigger.unk_1a80:
                case trigger.unk_2280:
                case trigger.unk_2480:
                case trigger.unk_2880:
                case trigger.unk_3c00:
                case trigger.unk_3d00:
                case trigger.unk_3e00:
                case trigger.unk_3f00:
                case trigger.unk_4200:
                case trigger.unk_4900:
                case trigger.unk_4a00:
                case trigger.unk_4f00:
                case trigger.unk_5800:
                    show_message("M_LoadScript: "+string(newdata.action)+" (1p) at "+string(i)+" in trigger group "+string(j));
                    newdata.parameters[0] = buffer_read(global.shadowlib,buffer_u32);
                    break;
                
                //2 parameters
                case trigger.unk_0080:
                case trigger.unk_1b80:
                case trigger.unk_1e80:
                case trigger.unk_0280:
                    show_message("M_LoadScript: "+string(newdata.action)+" (2p) at "+string(i)+" in trigger group "+string(j));
                    newdata.parameters[0] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[1] = buffer_read(global.shadowlib,buffer_u32);
                    break;
                
                //4 parameters
                case trigger.unk_0580:
                case trigger.unk_0880:
                case trigger.unk_0980:
                case trigger.teleport:
                    show_message("M_LoadScript: "+string(newdata.action)+" (4p) at "+string(i)+" in trigger group "+string(j));
                    newdata.parameters[0] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[1] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[2] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[3] = buffer_read(global.shadowlib,buffer_u32);
                    break;

                //5 parameters
                case trigger.unk_2380:
                    show_message("M_LoadScript: "+string(newdata.action)+" (5p) at "+string(i)+" in trigger group "+string(j));
                    newdata.parameters[0] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[1] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[2] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[3] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[4] = buffer_read(global.shadowlib,buffer_u32);
                    break;

                //8 parameters
                case trigger.unk_1480:
                    show_message("M_LoadScript: "+string(newdata.action)+" (8p) at "+string(i)+" in trigger group "+string(j));
                    newdata.parameters[0] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[1] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[2] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[3] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[4] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[5] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[6] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[7] = buffer_read(global.shadowlib,buffer_u32);
                    break;
                //14 parameters!!!!!!! WTF!!!
                case trigger.unk_0800:
                    show_message("M_LoadScript: "+string(newdata.action)+" (14p) short circuit at "+string(i)+" in trigger group "+string(j));
                    newdata.parameters[0] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[1] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[2] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[3] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[4] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[5] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[6] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[7] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[8] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[9] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[10] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[11] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[12] = buffer_read(global.shadowlib,buffer_u32);
                    newdata.parameters[13] = buffer_read(global.shadowlib,buffer_u32);
                    break;
            }
            
            prev = newdata;
        }
    }
