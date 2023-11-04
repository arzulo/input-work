// Feather disable all

function __input_class_combo_definition(_name, _phase_timeout, _directional) constructor
{
    __name          = _name;
    __phase_timeout = _phase_timeout;
    __directional   = _directional;
    
    __phase_array = [];
	__ignore_verb_array = [];
    
    static press = function(_verb)
    {
        array_push(__phase_array, {
            __type: __INPUT_COMBO_PHASE.__PRESS,
            __verb: _verb,
        });
        
        return self;
    }
    
    static release = function(_verb)
    {
        array_push(__phase_array, {
            __type: __INPUT_COMBO_PHASE.__RELEASE,
            __verb: _verb,
        });
        
        return self;
    }
    
    static press_or_release = function(_verb)
    {
        array_push(__phase_array, {
            __type: __INPUT_COMBO_PHASE.__PRESS_OR_RELEASE,
            __verb: _verb,
        });
        
        return self;
    }
    
    static hold = function(_verb)
    {
        array_push(__phase_array, {
            __type: __INPUT_COMBO_PHASE.__HOLD,
            __verb: _verb,
        });
        
        return self;
    }
    
    static charge = function(_verb, _min_time = INPUT_COMBO_DEFAULT_MIN_CHARGE_TIME)
    {
        array_push(__phase_array, {
            __type:     __INPUT_COMBO_PHASE.__CHARGE,
            __verb:     _verb,
            __min_time: _min_time,
        });
        
        return self;
    }
	
	static ignore_add = function(_verb) {
	    if (is_array(_verb))
	    {
			__ignore_verb_array = array_concat(__ignore_verb_array, _verb);
	    } else {
			array_push(__ignore_verb_array, _verb);
		}
	}
	
	
	static ignore_remove = function(_verb) {
	    if (is_array(_verb))
	    {
			var _i = 0;
			repeat(array_length(_verb))
	        {
				var _index = array_get_index(__ignore_verb_array, _verb);
				if(_index > -1)
				{
					array_delete(__ignore_verb_array, _index, 1);
				} 
				else 
				{
					_i++;
				}
	        }
	    } else {
			var _index = array_get_index(__ignore_verb_array, _verb);
			if(_index > -1)
			{
				array_delete(__ignore_verb_array, _index, 1);
			} 
		}
	}
	
}