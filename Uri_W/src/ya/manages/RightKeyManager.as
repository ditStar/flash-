package ya.manages
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	/**
	 * 右键管理器 
	 * @author Uri_W
	 * 
	 */	
	public class RightKeyManager extends EventDispatcher
	{
		public static const RightClickManager_ClickEvent:String="commentMenuClicked";
		
		private static var _instance:RightKeyManager;
		public static function get instance():RightKeyManager{
			if(_instance==null){
				_instance=new RightKeyManager();
			}
			return _instance;
		}
		
		public function register(stage:Stage):void{
			stage.showDefaultContextMenu = false;
			stage.addEventListener(MouseEvent.RIGHT_CLICK, stageRightClick);
		}
		
		private function stageRightClick(e:MouseEvent):void{
			var point:Point = new Point(LayerManager.Layer_Barrage.stage.mouseX,LayerManager.Layer_Barrage.stage.mouseY);
			var menus:Array = [];
			var i:int;
		}
		
		public function RightKeyManager(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}