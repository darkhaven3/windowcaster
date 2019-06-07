///ME_UpdateCellFloor();
// updates the floor currently highlighted in the editor
{
    var ttc = global.mapbuf_tile_floors[global.editcell];
    var tmptex = ds_map_find_value(global.TextureReference,"floor"+string(ttc));
    var inst = instance_place(edit_highlight.x, edit_highlight.y, floor_primitive);
        if(inst && ttc < global.numflats - 1 && ttc >= 1) {
            inst.flat = tmptex;
        }
        else if(ttc >= global.numflats - 1) {
            global.mapbuf_tile_floors[global.editcell] = global.numflats-1;
            ttc = global.mapbuf_tile_floors[global.editcell];
            tmptex = ds_map_find_value(global.TextureReference,"floor"+string(ttc));
            inst.flat = tmptex;
        }
        else if(ttc < 1) {
            global.mapbuf_tile_floors[global.editcell] = 1;
            ttc = global.mapbuf_tile_floors[global.editcell];
            tmptex = ds_map_find_value(global.TextureReference,"floor"+string(ttc));
            inst.flat = tmptex;
        }
}
