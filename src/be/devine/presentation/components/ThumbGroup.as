/**
 * Created with IntelliJ IDEA.
 * User: mathias_lambrecht
 * Date: 27/11/12
 * Time: 12:54
 * To change this template use File | Settings | File Templates.
 */
package be.devine.presentation.components
{
import be.devine.presentation.components.Thumb;
import be.devine.presentation.components.controls.ButtonClose;

import starling.display.Sprite;
import be.devine.presentation.components.controls.ButtonPlay;
public class ThumbGroup extends starling.display.Sprite
{
    private var _arraySlides:Vector.<Slide>;
    private var _arrayThumbs:Array;
    private var _buttonPlay:ButtonPlay;
    private var _buttonClose:ButtonClose;

    public function ThumbGroup(slides:Vector.<Slide>)
    {
        this._arraySlides = slides;

        // this.width=50;
        //this.height=50;
        var i:int = 1;

        for each(var slide:Slide in _arraySlides)
        {
            var thumb = new Thumb(slide, i);
            addChild(thumb);

            i++;
        }
        createControls();

    }
    private function createControls():void
    {
        _buttonPlay = new ButtonPlay();
        _buttonPlay.x = 52;
        _buttonPlay.y = 537;
        addChild(_buttonPlay);

        _buttonClose = new ButtonClose();
        _buttonClose.x = 62;
        _buttonClose.y = 537;
        addChild(_buttonClose);


    }
}
}
