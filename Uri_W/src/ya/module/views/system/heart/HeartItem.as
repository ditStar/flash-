package ya.module.views.system.heart
{
	import ya.component.YaImageProxy;
	import ya.component.YaSprite;
	import ya.manages.FrameRenderManager;
	import ya.manages.LayerManager;
	import ya.manages.UrlManager;
	
	public class HeartItem extends YaSprite
	{
		private var _heartImg:YaImageProxy;
		public function HeartItem()
		{
			_heartImg=new YaImageProxy(UrlManager.instance.getResUrl('heart.png'));
			this.addChild(_heartImg);
			
			LayerManager.Layer_UI.addChild(this);
		}
		
		private var xVal:int;
		public function start():void{
			this.x=_stage.stageWidth/2;
			this.alpha=0;
			this.scaleX=this.scaleY=0.5;
			this.y=_stage.stageHeight-80;
			this.xVal=Math.random()*10-5;
			FrameRenderManager.instance.add(frameAction);
			bl=0.01;
		}
		
		private var bl:Number=0.02;
		private function frameAction():void{
			this.alpha+=bl;
			if(this.alpha>=1){
				bl=-(bl);
				this.xVal=-this.xVal;
			}
			this.y-=2;
			this.x+=this.xVal;
			if(this.scaleX>1){
				this.scaleX=this.scaleX+=0.02;
			}
			if(this.alpha<=0){
				destroy();
			}
		}
		
		override public function destroy():void{
			FrameRenderManager.instance.remove(frameAction);
			LayerManager.Layer_UI.removeChild(this);
		}
	}
}