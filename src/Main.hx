class Main extends hxd.App {

    static function main() {
        hxd.Res.initEmbed();
        new Main();
    }
    
    override function init() {
        // create Tile from sampletile.png
        var tile  = hxd.Res.sampletile.toTile();
        var width = 49;
        var height = 49;        
        var Tgrp = new h2d.TileGroup(tile, s2d);
        // modify the display position
        Tgrp.x = width;
        Tgrp.y = 0;
        Tgrp.rotation = Math.PI/4;

        for(x in 0 ... 10) for(y in 0 ... 10){
            Tgrp.add((x+y)*width, -y*height, tile);
        }
    }
    // on each frame
   /*  override function update(dt:Float) {
        // increment the display bitmap rotation by 0.1 radians
        bmp.rotation += 0.1;
    } */

}