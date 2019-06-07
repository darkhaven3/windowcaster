///I_EngineCall(event);
// makes a special request to __EngineManager.
// currently there are no special engine calls,
// but this is kept so that later we can do things
// like restarting the texture manager or reloading
// raven.pk3.

var event = argument0;

with(__EngineManager) {
    event_user(event);
}
