package ya.manages
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.Stage;
	
	import ya.component.YaLayer;

	/**
	 * 层级管理器 
	 * @author wangshuang
	 * 
	 */
	public class LayerManager
	{
		public static var Layer_Video:YaLayer;
		public static var Layer_Barrage:YaLayer;
		public static var Layer_UI:YaLayer;
		public static var Layer_Tips:YaLayer;
		public static var Layer_Stage:Stage;
		public static function init(root:DisplayObjectContainer):void{
			var sp:Sprite=new Sprite();
			sp.graphics.beginFill(0x000000);
			sp.graphics.drawRect(0,0,ConfigManager.W_video,ConfigManager.H_video);
			sp.graphics.endFill();
			root.addChild(sp);
			
			Layer_Video=new YaLayer();
			root.addChild(Layer_Video);
			
			Layer_Barrage=new YaLayer();
			root.addChild(Layer_Barrage);
			
			Layer_UI=new YaLayer();
			root.addChild(Layer_UI);
			
			Layer_Tips=new YaLayer();
			root.addChild(Layer_Tips);
			
			Layer_Stage=Stage(root);
			
			Layer_Stage.showDefaultContextMenu = false;
			Layer_Stage.addEventListener(MouseEvent.RIGHT_CLICK,function stageRightClick():void{});
		}
	}
}
