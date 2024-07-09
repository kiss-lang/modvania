package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		var w = new World();
		super();
		addChild(new FlxGame(0, 0, PlayState));
	}
}
