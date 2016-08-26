package ya.module.model
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class SocketModel extends EventDispatcher
	{
		private static var _instance:SocketModel;
		public static function get instance():SocketModel{
			if(_instance==null){
				_instance=new SocketModel();
			}
			return _instance;
		}
		
		public function SocketModel(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}