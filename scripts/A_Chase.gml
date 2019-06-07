///A_Chase(from);

var from = argument0;

    if(from.dist < 64) {
        from.tx = player.x;
        from.ty = player.y;
        move_towards_point(from.tx,from.ty,from.gpspeed);
        exit;
    }
    
    from.c = P_ObjectInCell(self);
    
        from.cx = from.c%32;
        from.cy = from.c/32;
    
    from.c = P_ObjectInCell(player);
    
        from.px = from.c%32;
        from.py = from.c/32;

            from.tx = (from.px*64) + 32;
            from.ty = (from.py*64) + 32;
        
        move_towards_point(from.tx,from.ty,from.gpspeed);

