/**
 * Created with IntelliJ IDEA.
 * User: mathias_lambrecht
 * Date: 27/11/12
 * Time: 01:39
 * To change this template use File | Settings | File Templates.
 */
package be.devine.presentation.components
{
import be.devine.presentation.components.textutils.TextFieldUtil;
import be.devine.presentation.components.rectBox;

import flash.display.Bitmap;
import flash.display.BitmapData;

import starling.display.Image;
import starling.display.Sprite;
import starling.textures.Texture;

public class Slide extends starling.display.Sprite
{
    private var _id:uint;

    public function Slide(slideVO:XML, image:flash.display.Bitmap = null)
    {
        this._id = slideVO.id;

        if(image != null)
        {
            createImage(image, slideVO.image);
        }

        if(slideVO.title.length())
        {
            createTitle(slideVO.title);
        }

        if(slideVO.list.length())
        {
            createList(slideVO.list);
        }
        var sp:rectBox = new rectBox();
        addChild(sp);

        this.flatten();
    }

    private function createTitle(titleNode:XMLList):void
    {
        var textField = new TextFieldUtil(200, 200, titleNode.value, titleNode.size, true);
        addChild(textField);
    }

    private function createImage(image:flash.display.Bitmap, imageNode:XMLList):void
    {
        var texture:Texture = Texture.fromBitmap(image);
        var finalImage:Image = new Image(texture);
        addChild(finalImage);
    }

    private function createList(listNode:XMLList):void
    {
        var yPos:Number = 0;

        for each(var item:XML in listNode.items.item)
        {
            var textField:TextFieldUtil = new TextFieldUtil(200, 200, item, listNode.size);
            textField.y = yPos;
            addChild(textField);

            yPos += listNode.spacing;
        }
    }

    public function get id():uint
    {
        return _id;
    }
}
}
