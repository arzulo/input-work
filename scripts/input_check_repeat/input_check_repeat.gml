/// @param verb/array
/// @param [playerIndex]
/// @param [delay]
/// @param [predelay]

function input_check_repeat(_verb, _player_index = 0, _delay = INPUT_REPEAT_DEFAULT_DELAY, _predelay = INPUT_REPEAT_DEFAULT_PREDELAY)
{
    __INPUT_VERIFY_PLAYER_INDEX
    __INPUT_GET_VERB_STRUCT
    
    if (_verb_struct.__inactive) return false;
    if (!_verb_struct.held) return false;
    
    var _time = __input_get_time() - _verb_struct.press_time - _predelay;
    if (_time < 0) return false;
    
    var _prev_time = __input_get_previous_time() - _verb_struct.press_time - _predelay;
    return (floor(_time / _delay) > floor(_prev_time / _delay));
}