///CA_UnpersistInfoTables();
// call once map is loaded to "lock" info tables.

{
    var i=0;
    
    for(i=0;i<global.shadowlib_numentries;i++) {
        instance_deactivate_object(global.shadowlib_info[i]);
    }

    for(i=0;i<global.ravdata_numentries;i++) {
        instance_deactivate_object(global.ravdata_info[i]);
    }

}
