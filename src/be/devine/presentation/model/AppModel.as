/**
 * Created with IntelliJ IDEA.
 * User: mathias_lambrecht
 * Date: 26/11/12
 * Time: 21:21
 * To change this template use File | Settings | File Templates.
 */
package be.devine.presentation.model
{
import be.devine.presentation.vo.SlideVO;
import be.devine.presentation.xml.XMLparser;

import flash.events.Event;
import flash.events.EventDispatcher;

public class AppModel extends flash.events.EventDispatcher
{
    private static var _instance:AppModel;

    public static function getInstance():AppModel
    {
        if(_instance == null)
        {
            _instance = new AppModel(new enForcer());
        }
        return _instance;
    }

    private static const XML_PATH:String = 'assets/xml/';
    public static const XML_LOADED:String = 'xmlLoaded';
    public static const SLIDE_INDEX_CHANGED:String = 'slideIndexChanged';

    private var _xmlParser:XMLparser;
    private var _slides:Vector.<SlideVO>;
    private var _slideIndex:int;

    public function AppModel(event:enForcer)
    {
        if(event == null)
        {
            throw new Error('AppModel is a singleton');
        }

        _xmlParser = new XMLparser();
        _xmlParser.addEventListener(XMLparser.XML_LOADED, xmlLoadedHandler);
        _xmlParser.load(XML_PATH + 'main.xml');

        _slides = new Vector.<SlideVO>();
    }

    private function xmlLoadedHandler(event:flash.events.Event):void
    {
        for each(var slideNode:XML in _xmlParser.data.slide)
        {
            var slide:SlideVO = new SlideVO(slideNode);
            _slides.push(slide);
        }

        dispatchEvent(new flash.events.Event(XML_LOADED));
    }

    public function get slides():Vector.<SlideVO>
    {
        return _slides;
    }

    public function previousSlide():void
    {
        if((_slideIndex - 1) > 0)
        {
            slideIndex --;
        }
        else
        {
            slideIndex = _slides.length;
        }
    }

    public function nextSlide():void
    {
        if((_slideIndex + 1) <= _slides.length)
        {
            slideIndex ++;
        }
        else
        {
            slideIndex = 1;
        }
    }

    public function get slideIndex():int
    {
        return _slideIndex;
    }

    public function set slideIndex(value:int):void
    {
        if(_slideIndex != value)
        {
            _slideIndex = value;
            dispatchEvent(new Event(SLIDE_INDEX_CHANGED));
        }
    }
}
}

internal class enForcer{};