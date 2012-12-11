/**
 * Created with IntelliJ IDEA.
 * User: mathias_lambrecht
 * Date: 26/11/12
 * Time: 21:34
 * To change this template use File | Settings | File Templates.
 */
package be.devine.presentation.components
{

import be.devine.presentation.model.AppModel;

import flash.events.Event;

import starling.display.Sprite;

public class SlideView extends Sprite
{
    private var _appModel:AppModel;
    private var _slides:Vector.<Slide>;

    public function SlideView(slides:Vector.<Slide>)
    {
        _appModel = AppModel.getInstance();
        _appModel.addEventListener(AppModel.SLIDE_INDEX_CHANGED, slideIndexChanged);

        this._slides = slides;

        for each(var slide:Slide in _slides)
        {
            slide.x = 192;
            slide.y = 107;
            addChild(slide);
            slide.flatten();
        }
    }

    private function slideIndexChanged(event:flash.events.Event):void
    {
        for each(var slide:Slide in _slides)
        {
            if(slide.id != _appModel.slideIndex)
            {
                slide.visible = false;
            }
            else
            {
                slide.visible = true;
            }
        }
    }
}
}
