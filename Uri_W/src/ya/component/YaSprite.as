package ya.component
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	
	import ya.interfaces.IDestroy;
	import ya.manages.LayerManager;
	
	public class YaSprite extends Sprite implements IDestroy
	{
		protected var _stage:Stage=null;
		protected var _registerStage:Boolean=false;
		public function YaSprite()
		{
			initStage();
			addStageEvent();
		}
		
		private function initStage():void{
			_stage=LayerManager.Layer_Stage;
		}
		
		protected function initView():void{
			
		}
		protected function addEvent():void{
			
		}
		protected function removeEvent():void{
			
		}
		
		protected function addStageEvent():void{
			_stage&&_stage.addEventListener(Event.RESIZE,updateResizeFun);
		}
		protected function removeStageEvent():void{
			_stage&&_registerStage&&_stage.removeEventListener(Event.RESIZE,updateResizeFun);
		}
		private function updateResizeFun(e:Event):void{
			resizeFresh();
		}
		
		protected function updatePosition():void{
			
		}
		
		protected function resizeFresh():void{
			
		}
		
		public function destroy():void
		{
			_stage=null;
			removeStageEvent();
			removeEvent();
		}
	}
}