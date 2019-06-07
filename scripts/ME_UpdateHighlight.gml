///ME_UpdateHighlight();
// returns cell number touched by highlighter
{
    var px, py;     //player cellx/y
    var c = P_ObjectInCell(player);
    
    px = floor(c % 32);
    py = floor(c / 32);    //these get fudged into the destination coords

    if(player.direction < 45 || player.direction > 315) {   //east q
        px++;
    }
    else if(player.direction >= 45 && player.direction < 135) {  //north q
        py--;
    }
    else if(player.direction >= 135 && player.direction < 225) { //west q
        px--;
    }
    else if(player.direction >= 225 && player.direction < 315) { //south q
        py++;
    }

    var rx = (px*64);
    var ry = (py*64);
    
    var bc = (py*32) + px;

    instance_destroy(edit_highlight);
    var inst = instance_create(px*64,py*64,edit_highlight);
    inst.sprite_index = blanks;
    switch(global.mapeditmode) {
        default:
            break;
        case editmode.floors:
            inst.x1 = inst.x+64;
            inst.x2 = inst.x;
            inst.y1 = inst.y+64;
            inst.y2 = inst.y;
            inst.z1 = 1;
            inst.z2 = -1;
            global.systemmsg = "floor: "+string(global.mapbuf_tile_floors[bc]);
            break;
        case editmode.ceilings:
            inst.x1 = inst.x+64;
            inst.x2 = inst.x;
            inst.y1 = inst.y+64;
            inst.y2 = inst.y;
            inst.z1 = global.levelheight + 1;
            inst.z2 = global.levelheight - 1;
            global.systemmsg = "ceil: "+string(global.mapbuf_tile_ceils[bc]);
            break;
        case editmode.wallh:
            inst.x1 = inst.x+64;
            inst.x2 = inst.x;
            inst.y1 = inst.y-1;
            inst.y2 = inst.y+1;
            inst.z1 = 0;
            inst.z2 = global.levelheight;
            global.systemmsg = "wallh: "+string(global.mapbuf_tile_wallv[bc]);
            break;
        case editmode.wallv:
            inst.x1 = inst.x-1;
            inst.x2 = inst.x+1;
            inst.y1 = inst.y+64;
            inst.y2 = inst.y;
            inst.z1 = 0;
            inst.z2 = global.levelheight;
            global.systemmsg = "wallv: "+string(global.mapbuf_tile_wallh[bc]);
            break;
        case editmode.doors:
            inst.x1 = inst.x;
            inst.x2 = inst.x+64;
            inst.y1 = inst.y;
            inst.y2 = inst.y+64;
            inst.z1 = 0;
            inst.z2 = global.levelheight;
            global.systemmsg = "door mode";
            break;
    }
    
    return bc;
}
