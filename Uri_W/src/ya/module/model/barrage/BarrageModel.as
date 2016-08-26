package ya.module.model.barrage
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import ya.manages.JsManager;
	import ya.module.controller.BarrageController;
	import ya.module.model.barrage.vo.BarrageVo;
	
	public class BarrageModel extends EventDispatcher
	{
		private static var _instance:BarrageModel;
		public static function get instance():BarrageModel{
			if(_instance==null){
				_instance=new BarrageModel();
			}
			return _instance;
		}
		
		public function BarrageModel(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function normalBarrageAction(commandStr:String):void{
			var barrageVo:BarrageVo=new BarrageVo();
			barrageVo.setDataByServerStr(commandStr);
			
			JsManager.instance.serverCallBack(commandStr);
			BarrageController.instance.addBarrageAction(barrageVo);
		}
	}
}