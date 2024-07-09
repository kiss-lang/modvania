package components;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import haxe.Json;

class Sprite extends FlxSprite implements Component {
    public function new() {
        super();
        makeGraphic(100, 100, FlxColor.WHITE);
    }

    public function stringify():String {
        // TODO stringify other parts
        return '$x,$y';
    }

    public function parse(s:String) {
        // TODO parse other parts
        var parts = s.split(",");
        this.x = Std.parseFloat(parts[0]);
        this.y = Std.parseFloat(parts[1]);
    }
}
