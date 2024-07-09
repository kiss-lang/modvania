package components;

import flixel.math.FlxPoint;

class FlxPointComponent extends FlxBasePoint implements Component {
    public function new(x, y) {
        super(x, y);
    }
    
    public function stringify():String {
        return '$x,$y';
    }

    public function parse(s:String) {
        var parts = s.split(",");
        this.x = Std.parseFloat(parts[0]);
        this.y = Std.parseFloat(parts[1]);
    }
}
