/**
 * Created with IntelliJ IDEA.
 * User: mathias_lambrecht
 * Date: 26/11/12
 * Time: 21:16
 * To change this template use File | Settings | File Templates.
 */
package be.devine.presentation
{

import be.devine.presentation.components.Test;
import be.devine.presentation.components.controls.ButtonNext;
import be.devine.presentation.components.controls.ButtonPrev;
import be.devine.presentation.components.Slide;
import be.devine.presentation.components.SlideView;
import be.devine.presentation.components.ThumbGroup;
import be.devine.presentation.model.AppModel;
import be.devine.presentation.queue.Queue;
import be.devine.presentation.queue.tasks.LoaderTask;
import be.devine.presentation.vo.SlideVO;

import flash.display.Bitmap;
import flash.events.Event;
import flash.ui.Keyboard;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.KeyboardEvent;

public class Application extends Sprite
{
    private var _appModel:AppModel;

    private var _queue:Queue;
    private var _slides:Vector.<Slide>;

    private var _slideView:SlideView;
    private var _thumbGroup:ThumbGroup;

    private var _buttonPrev:ButtonPrev;
    private var _buttonNext:ButtonNext;

    public function Application()
    {
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, init);
    }

    private function init(event:starling.events.Event):void
    {
        _appModel = AppModel.getInstance();
        _appModel.addEventListener(AppModel.XML_LOADED, xmlLoadedHandler);

        resizeHandler(null);
        stage.addEventListener(starling.events.Event.RESIZE, resizeHandler);
    }

    private function xmlLoadedHandler(event:flash.events.Event):void
    {
        _queue = new Queue();

        for each(var slideVO:SlideVO in _appModel.slides)
        {
            if(slideVO.xml.image.path.length())
            {
                _queue.add(new LoaderTask(slideVO.xml.image.path));
            }
        }

        _queue.addEventListener(flash.events.Event.COMPLETE, queueCompleteHandler);
        _queue.start();
    }

    private function queueCompleteHandler(event:flash.events.Event):void
    {
        _slides = new Vector.<Slide>();

        for each(var slideVO:SlideVO in _appModel.slides)
        {
            if(slideVO.xml.image.path.length())
            {
                for each(var task:LoaderTask in _queue.finishedTasks)
                {
                    if(task.url == slideVO.xml.image.path)
                    {
                        var bitmap = task.content as Bitmap;
                        var slide:Slide = new Slide(slideVO.xml, bitmap);
                    }
                }
            }
            else
            {
                var slide:Slide = new Slide(slideVO.xml);
            }

            _slides.push(slide);
        }

        var t:Test = new Test();
        t.x = 100;
        t.scaleX = t.scaleY = 5;
        addChild(t);

        _slideView = new SlideView(_slides);
        addChild(_slideView);

        _thumbGroup = new ThumbGroup(_slides);
      //  _thumbGroup.x = 32;
        //_thumbGroup.y = 70;
       addChild(_thumbGroup);

        createControls();

        _appModel.slideIndex = 1;
        stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
    }

    private function keyDownHandler(event:KeyboardEvent):void
    {
        var key:uint = event.keyCode;

        switch(key)
        {
            case Keyboard.RIGHT:
                _appModel.nextSlide();
                break;

            case Keyboard.LEFT:
                _appModel.previousSlide();
                break;
        }
    }

    private function createControls():void
    {
        _buttonPrev = new ButtonPrev();
        _buttonPrev.x = 934;
        _buttonPrev.y = 70;
        addChild(_buttonPrev);

        _buttonNext = new ButtonNext();
        _buttonNext.x = _buttonPrev.x + _buttonPrev.width + 5;
        _buttonNext.y = _buttonPrev.y
        addChild(_buttonNext);
    }

    private function resizeHandler(event:starling.events.Event):void
    {
    }
}
}
