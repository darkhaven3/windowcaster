///CA_PersistInfoTables();
// makes sure info table stays persistent across maps.

{
    var i=0;
    
    for(i=0;i<global.shadowlib_numentries;i++) {
        instance_activate_object(global.shadowlib_info[i]);
    }

    for(i=0;i<global.ravdata_numentries;i++) {
        instance_activate_object(global.ravdata_info[i]);
    }

}
