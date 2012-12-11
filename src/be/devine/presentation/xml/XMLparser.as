/**
 * Created with IntelliJ IDEA.
 * User: mathias_lambrecht
 * Date: 20/11/12
 * Time: 23:18
 * To change this template use File | Settings | File Templates.
 */
package be.devine.presentation.xml
{

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class XMLparser extends EventDispatcher
{
    public static const XML_LOADED:String = 'xmlLoaded';

    private var _xmlLoader:URLLoader;
    public var data:XML;

    public function XMLParser():void{}

    public function load(xmlPath:String):void
    {
        _xmlLoader = new URLLoader();
        _xmlLoader.addEventListener(Event.COMPLETE, xmlLoaded);
        _xmlLoader.load(new URLRequest(xmlPath));
    }

    protected function xmlLoaded(event:flash.events.Event):void
    {
        data = new XML(event.currentTarget.data);

        dispatchEvent(new Event(XML_LOADED));
    }
}
}
