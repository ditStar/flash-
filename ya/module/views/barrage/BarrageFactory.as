package ya.module.views.barrage
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class BarrageFactory extends EventDispatcher
	{
		private static var _instance:BarrageFactory;
		public static function get instance():BarrageFactory{
			if(_instance==null){
				_instance=new BarrageFactory();
			}
			return _instance;
		}
		public function BarrageFactory(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		private var _txtBarrageArr:Array=[];
		public function get txtBarrageItem():BarrageRightTxtItem{
			if(_txtBarrageArr.length>0){
				return _txtBarrageArr.pop();
			}else{
				return new BarrageRightTxtItem();
			}
		}
		
		public function poolTxtBarrage(item:BarrageRightTxtItem):void{
			_txtBarrageArr.push(item);
		}
	}
}