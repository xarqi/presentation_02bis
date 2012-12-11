/**
 * Created with IntelliJ IDEA.
 * User: mathias_lambrecht
 * Date: 3/12/12
 * Time: 21:40
 * To change this template use File | Settings | File Templates.
 */
package be.devine.presentation.components
{
import be.devine.presentation.components.Slide;

import starling.display.Sprite;

public class Thumb extends starling.display.Sprite
{
    private var _slide:Slide;

    public function Thumb(slide:Slide, id:int)
    {
        this._slide = slide;
        addChild(_slide);
    }
}
}
