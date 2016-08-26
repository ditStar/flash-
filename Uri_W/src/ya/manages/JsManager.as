package ya.manages
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.external.ExternalInterface;
	/**
	 * js调度管理器 
	 * 所有js通过管理器接口调用 方便管理 
	 * @author wangshuang
	 * 
	 */	
	public class JsManager extends EventDispatcher
	{
		private static  var _instance:JsManager;
		public static function get instance():JsManager{
			if(_instance==null){
				_instance=new JsManager();
			}
			return _instance;
		}
		
		public function JsManager(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function serverCallBack(str:String):void{
			if(ExternalInterface.available)
				ExternalInterface.call('server_callback',str);
		}
	}
}