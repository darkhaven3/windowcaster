///CA_UnloadMap();

{
    with(floor_primitive) {
        instance_destroy();
    }
    
    with(ceil_primitive) {
        instance_destroy();
    }
    
    with(collidable_primitive) {
        instance_destroy();
    }
    with(worldsetting_primitive) {
        instance_destroy();
    }
    
    //this should not happen - in the real game, object states are preserved across hubs
    with(thing) {
        instance_destroy();
    }
    
    //...but this should.
    with(archetype) {
        instance_destroy();
    }
    
    with(info_sky) {
        instance_destroy();
    }
}
