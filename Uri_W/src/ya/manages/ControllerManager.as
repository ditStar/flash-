package ya.manages
{
	import flash.events.EventDispatcher;
	
	import ya.module.controller.BarrageController;
	import ya.module.controller.SocketController;
	import ya.module.controller.VideoController;
	/**
	 * 控制器管理器 也是所有控制器入口 
	 * @author wangshuang
	 * 
	 */	
	public class ControllerManager extends EventDispatcher
	{
		private static var _instance:ControllerManager;
		public static function get instance():ControllerManager{
			if(_instance==null){
				_instance=new ControllerManager();
			}
			return _instance;
		}
		
		public function ControllerManager(){
			ErrorManager.singleError(_instance);
		}
		
		public function init():void{
			VideoController.instance.init();
			BarrageController.instance.init();
			SocketController.instance.init();
		}
	}
}