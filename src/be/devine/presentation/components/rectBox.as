/**
 * Created with IntelliJ IDEA.
 * User: alexander
 * Date: 11/12/12
 * Time: 11:11
 * To change this template use File | Settings | File Templates.
 */
package be.devine.presentation.components {
import flash.display.Sprite;
import flash.display.BitmapData;

import starling.display.Image;
import starling.textures.Texture;

public class rectBox extends starling.display.Image
{

    public function rectBox():void {

        var nBox:Sprite = new Sprite();
        nBox.graphics.beginFill(0xF9F9F9, 0.5);
        nBox.graphics.lineStyle(2,0x00aeef);
        nBox.graphics.drawRect(0,0,804,604);

        nBox.graphics.endFill();

        var nBMP_D:BitmapData = new BitmapData(804, 604, true, 0x00000000);
        nBMP_D.draw(nBox);

        var nTxtr:Texture = Texture.fromBitmapData(nBMP_D, false, false);
        //this.texture = nTxtr;
        super(nTxtr);
    }
}
}
