package be.devine.presentation.queue.tasks
{
import flash.display.Loader;
import flash.events.Event;
import flash.events.ProgressEvent;
import flash.net.URLRequest;

public class LoaderTask extends Loader implements IQueueTask
{
    public var url:String;

    public function LoaderTask(url:String)
    {
        this.url = url;
    }

    public function start():void
    {
        contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
        contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, progressHandler);
        load(new URLRequest(url));
    }

    private function progressHandler(event:flash.events.ProgressEvent):void
    {
        dispatchEvent(new ProgressEvent(flash.events.ProgressEvent.PROGRESS, false, false, event.bytesLoaded, event.bytesTotal));
    }

    private function completeHandler(event:flash.events.Event):void
    {
        dispatchEvent(new Event(Event.COMPLETE));
    }
}
}