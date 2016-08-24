package ya.manages
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.system.Capabilities;
	/**
	 * 系统管理器 
	 * @author wangshuang
	 * 
	 */	
	public class SystemManager extends EventDispatcher
	{
		private static var _instance:SystemManager;
		public static function get instance():SystemManager{
			if(_instance==null){
				_instance=new SystemManager();
			}
			return _instance;
		}
		public function SystemManager(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function getFont():String{
			if(Capabilities.os.indexOf('Linux') != -1){
					return "sans";
			}else if(Capabilities.os.indexOf('Mac') != -1){
				return 'Hei';
			}else{
				return '黑体';
			}
		}
	}
}