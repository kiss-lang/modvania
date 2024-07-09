package;

import haxe.DynamicAccess;
import haxe.Json;

class Entity {
    public var id(default, null):String = "";
    public var group(default, null):String = "";
    public var components(default, null):Array<Component> = [];

    public function new() {}

    public static function fromJson(json:String):Entity {
        var e = new Entity();
        var json = Json.parse(json);
        if (json.id != null) e.id = json.id;
        if (json.group != null) e.group = json.group;
        var components:DynamicAccess<String> = json.components;
        for (type => s in components) {
            var c:Component = Type.createEmptyInstance(Type.resolveClass(type));
            c.parse(s);
            e.components.push(c);
        }
        return e;
    }

    public function stringify():String {
        return Json.stringify({
            id: id,
            group: group,
            components: [
                for (c in components) {
                    Type.getClassName(Type.getClass(c)) => c.stringify();
                }
            ]
        });
    }
}
