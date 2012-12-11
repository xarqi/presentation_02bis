package be.devine.presentation.queue.tasks
{
import flash.events.IEventDispatcher;

public interface IQueueTask extends flash.events.IEventDispatcher
{
    function start():void;
}
}