package ya.module.views.system.person
{
	import flash.display.MovieClip;
	
	import ya.component.YaCacheSprite;
	import ya.manages.FrameRenderManager;
	import ya.manages.LayerManager;
	import ya.manages.ResManager;
	import ya.manages.UrlManager;
	
	public class PersonItem extends YaCacheSprite
	{
		public function PersonItem()
		{
			super(UrlManager.instance.getResUrl("PersonWalkRes.swf"));
			this.y=100+Math.random()*300;
		}
		
		private var walk:MovieClip;
		override protected function resManagerCall():void{
			walk=ResManager.instance.getInstanceObj("PersonWalkRes3","PersonWalkRes.swf") as MovieClip;
			this.addChild(walk);
			LayerManager.Layer_UI.addChild(this);
			FrameRenderManager.instance.add(frameAction);
		}
		
		private function frameAction():void{
			this.x+=15;
			if(this.x>_stage.stageWidth){
				destroy();
			}
		}
		override public function destroy():void{
			FrameRenderManager.instance.remove(frameAction);
			walk.stop();
			LayerManager.Layer_UI.removeChild(this);
		}
	}
}