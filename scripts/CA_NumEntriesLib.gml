///CA_NumEntriesLib(libhandle);

{
            var libhandle=argument0;
            
            buffer_seek(libhandle,buffer_seek_end,2);
            return buffer_read(libhandle,buffer_u16);
}
