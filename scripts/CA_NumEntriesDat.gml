///CA_NumEntries(dathandle);

{
            var dathandle=argument0;
            
            buffer_seek(dathandle,buffer_seek_start,0);
            return buffer_read(dathandle,buffer_u16);
}
