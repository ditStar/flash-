package ya.module.controller
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class PlayerController extends EventDispatcher
	{
		public function PlayerController(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}