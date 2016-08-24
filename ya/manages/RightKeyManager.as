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
			for(i = LayerManager.Layer_Barrage.numChildren-1; i >=0; i--){
				var comment:DisplayObject = LayerManager.Layer_Barrage.getChildAt(i);
				if(comment){
					if(comment is Comment&&IComment(comment).data.live_extra&&IComment(comment).data.live_extra.giftId){
						continue;
					}
					if(comment is IComment&&comment.hitTestPoint(point.x,point.y)){
						if(IComment(comment).data&&IComment(comment).data.preview){
							if(commentPlayer.liveMode){
								CommentView.getInstance().dispatchEvent(new MukioEvent(RightClickManager_ClickEvent, {item:IComment(comment).data, point:point}));
							}else{
								CommentView.getInstance().dispatchEvent(new MukioEvent(RightClickManager_ClickEvent, {item:null, point:point}));
							}
							return;
						}
						for each(var item:Object in commentPlayer.provider.commentResource){
							if(item.id === IComment(comment).data.id){
								CommentView.getInstance().dispatchEvent(new MukioEvent(RightClickManager_ClickEvent, {item:item, point:point}));
								return;
							}
						}
						CommentView.getInstance().dispatchEvent(new MukioEvent(RightClickManager_ClickEvent, {item:null, point:point}));
					}
				}
			}
		}
		
		public function RightKeyManager(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}