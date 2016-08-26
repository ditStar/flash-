package ya.component.events
{
	import flash.events.EventDispatcher;
	/**
	 * 派发器 
	 * @author wangshuang
	 * 
	 */	
	public class YaDispatcher extends EventDispatcher
	{
		private static var _instance:YaDispatcher;
		
		public function YaDispatcher()
		{
		}
		
		public static function get instance():YaDispatcher{
			if (_instance == null){
				_instance = new YaDispatcher();
			}
			return _instance;
		}
	}
}

