package;

import haxe.DynamicAccess;
import haxe.Json;

class World {
    public var entities(default, null): Array<Entity> = [];
    public var components(default, null): Array<Component> = [];

    public function new() {}

    public static function fromJson(json:String):World {
        var w = new World();
        var json = Json.parse(json);

        var _entities: Array<String> = json.entities;
        w.entities = [for (e in _entities) Entity.fromJson(e)];

        var _components:DynamicAccess<String> = json.components;
        for (type => s in _components) {
            var c:Component = Type.createInstance(Type.resolveClass(type), []);
            c.parse(s);
            w.components.push(c);
        }
        return w;
    }

    public function stringify():String {
        return Json.stringify({
            entities: [for (e in entities) e.stringify()],
            components: [
                for (c in components) {
                    Type.getClassName(Type.getClass(c)) => c.stringify();
                }
            ]
        });
    }

    public function update(elapsed:Float) {

    }
}
