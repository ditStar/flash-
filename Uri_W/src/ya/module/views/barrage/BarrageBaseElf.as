package ya.module.views.barrage
{
	import flash.display.Sprite;
	
	import ya.interfaces.IDestroy;
	import ya.module.model.barrage.vo.BarrageVo;
	
	public class BarrageBaseElf extends Sprite implements IDestroy
	{
		public function BarrageBaseElf()
		{
			initView();
			addEvent();
		}
		
		public function initView():void{
			
		}
		
		public function addEvent():void{
			
		}
		
		public function removeEvent():void{
			
		}
		
		public function destroy():void
		{
			removeEvent();
		}
		
		private var _barrageVo:BarrageVo;
		public function set vo(vo:BarrageVo):void{
			_barrageVo=vo;
		}
		public function get vo():BarrageVo{
			return _barrageVo;
		}
	}
}