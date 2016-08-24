package ya.manages
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	/**
	 * 统一帧频管理器 
	 * @author wangshuang
	 * 
	 */
	public class FrameRenderManager extends EventDispatcher
	{
		private static var _instance:FrameRenderManager;
		public static function get instance():FrameRenderManager{
			if(_instance==null){
				_instance=new FrameRenderManager();
			}
			return _instance;
		}
	
		public function FrameRenderManager()
		{
			ErrorManager.singleError(_instance);
			
			_dic=new Dictionary();
			_sp=new Sprite();
			_sp.addEventListener(Event.ENTER_FRAME,renderFun);
		}
		
		private var _dic:Dictionary;
		private var _sp:Sprite;
		private function renderFun(e:Event):void{
			for(var fun:Function in _dic){
				fun();
			}
		}
		public function add(fun:Function):void{
			_dic[fun]=true;
		}
		public function remove(fun:Function):void{
			if(_dic[fun]){
				_dic[fun]=null;
				delete _dic[fun];
			}
		}
	}
}