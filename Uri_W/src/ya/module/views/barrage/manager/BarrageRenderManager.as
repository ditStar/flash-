package ya.module.views.barrage.manager
{
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	
	import ya.component.events.EventName;
	import ya.component.events.ParamEvent;
	import ya.component.events.YaDispatcher;
	
	public class BarrageRenderManager extends EventDispatcher
	{
		private static var _instance:BarrageRenderManager;
		public static function get instance():BarrageRenderManager{
			if(_instance==null){
				_instance=new BarrageRenderManager();
			}
			return _instance;
		}
		
		public function BarrageRenderManager()
		{
			_dic=new Dictionary();
			_timer=new Timer(1000/24);
			_timer.addEventListener(TimerEvent.TIMER,renderFun);
			_timer.start();
			
			YaDispatcher.instance.addEventListener(EventName.Video_Play_State,videoPlayStateFun);
		}
		
		private function videoPlayStateFun(e:ParamEvent):void{
			if(e.param==true){
				_timer.start();
			}else{
				_timer.stop();
			}
		}
		
		private var _dic:Dictionary;
		private var _timer:Timer;
		private function renderFun(e:TimerEvent):void{
			for(var fun:Function in _dic){
				fun();
			}
			e.updateAfterEvent();
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