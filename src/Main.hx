import hxd.Res;
import haxe.Json;

class Main extends hxd.App {
    var bmp : h2d.Bitmap;
    var hue = 0;
    override function init() {
        super.init();
        var mapData:TiledMapData = Json.parse(Res.map.entry.getText());
        var tw = mapData.tilewidth;
        var th = mapData.tileheight*2;
        var mw = mapData.width;
        var mh = mapData.height;
        var tileImage = hxd.Res.tiles.toTile();
        var group = new h2d.TileGroup(tileImage, s2d);
        group.x = s2d.width/2;
        group.y = s2d.height/4;

        var tiles = [
            for(y in 0 ... Std.int(tileImage.height / th))
            for(x in 0 ... Std.int(tileImage.width / tw))
            tileImage.sub(x * tw, y * th, tw, th)

        ];

        for(layer in mapData.layers) {
            for(y in 0 ... mh) for (x in 0 ... mw) {
                var tid = layer.data[x + y * mw];
                if(tid != 0) {
                    group.add((x-y)*(tw/2), (x+y)*(th/4), tiles[tid - 1]);
                }
            }
        }




        // // allocate a Texture with red color and creates a 100x100 Tile from it
        // var tile = h2d.Tile.fromColor(0xFF0000, 100, 100);
        // // create a Bitmap object, which will display the tile
        // // and will be added to our 2D scene (s2d)
        // bmp = new h2d.Bitmap(tile, s2d);
        // // modify the display position of the Bitmap sprite
        // bmp.x = s2d.width * 0.5;
        // bmp.y = s2d.height * 0.5;
    }
    // on each frame
    override function update(dt:Float) {

    }
    static function main() {
        hxd.Res.initEmbed();
        new Main();
    }
}

typedef TiledMapData = { layers:Array<{ data:Array<Int>}>, tilewidth:Int, tileheight:Int, width:Int, height:Int };
