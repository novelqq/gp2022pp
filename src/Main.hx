class Main extends hxd.App {
    var bmp : h2d.Bitmap;
    var hue = 0;
    override function init() {
        // allocate a Texture with red color and creates a 100x100 Tile from it
        var tile = h2d.Tile.fromColor(0xFF0000, 100, 100);
        // create a Bitmap object, which will display the tile
        // and will be added to our 2D scene (s2d)
        bmp = new h2d.Bitmap(tile, s2d);
        // modify the display position of the Bitmap sprite
        bmp.x = s2d.width * 0.5;
        bmp.y = s2d.height * 0.5;
    }
    // on each frame
    override function update(dt:Float) {
        // increment the display bitmap rotation by 0.1 radians
        bmp.rotation += 0.1;
        // There might be a way to update the hue inside the adjustcolour method, but I don't know the syntax for that
        hue += 1;
        bmp.adjustColor({saturation : 0, lightness : 0, hue : hue * Math.PI / 180, contrast : 0} );
    }
    static function main() {
        new Main();
    }
}