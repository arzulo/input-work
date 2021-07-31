/// @param button
/// @param verb
/// @param [alternate]

function input_default_mouse_button()
{
    var _button    = argument[0];
    var _verb      = argument[1];
    var _alternate = ((argument_count > 2) && (argument[2] != undefined))? argument[2] : 0;
    
    if (__INPUT_DEBUG) __input_trace("Setting default mouse button binding...");
    
    //Never allow mouse bindings on console
    if (!__INPUT_ON_CONSOLE) global.__input_mouse_valid = true;
    
    //FIXME - Despite this class being implemented as a fluent interface, GMS2.3.3 has bugs when returning <self> on certain platforms
    var _binding = new __input_class_binding();
    _binding.set_mouse_button(_button);
    
    global.__input_default_player.set_binding(INPUT_SOURCE.KEYBOARD_AND_MOUSE, _verb, _alternate, _binding);
    
    var _p = 0;
    repeat(INPUT_MAX_PLAYERS)
    {
        //FIXME - Despite this class being implemented as a fluent interface, GMS2.3.3 has bugs when returning <self> on certain platforms
        var _binding = new __input_class_binding();
        _binding.set_mouse_button(_button);
        
        global.__input_players[_p].set_binding(INPUT_SOURCE.KEYBOARD_AND_MOUSE, _verb, _alternate, _binding);
        ++_p;
    }
}