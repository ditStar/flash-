package ya.component.events
{
	import flash.events.Event;
	/**
	 * 带参事件 
	 * @author wangshuang
	 * 
	 */	
	public class ParamEvent extends Event
	{
		public var param:Object;
		
		public function ParamEvent(type:String,param:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.param=param;
		}
	}
}