package ya.module.views.barrage
{
	import flash.display.Sprite;
	
	import ya.interfaces.IDestroy;
	import ya.module.views.barrage.manager.BarrageRenderManager;
	import ya.manages.ConfigManager;
	import ya.module.model.barrage.vo.BarrageVo;
	import ya.module.views.barrage.manager.BarrageManager;
	
	public class BarrageBaseItem extends Sprite implements IDestroy
	{
		//		private var sp:Sprite
		//		public function setCur():void{
		//			sp=new Sprite();
		//			sp.graphics.beginFill(0xff0000);
		//			sp.graphics.drawRect(0,0,20,20);
		//			sp.graphics.endFill();
		//			this.addChild(sp);
		//		}
		//		public function outCur():void{
		//			sp&&this.removeChild(sp);
		//		}
		public function BarrageBaseItem()
		{
			initView();
			addEvent();
		}
		
		public function setY(y_:Number):void{
			this.y=y_;
		}
		
		public function setX(x_:Number):void{
			this.x=x_;
		}
		
		public function initView():void{
			
		}
		
		public function addEvent():void{
			
		}
		
		public function removeEvent():void{
			
		}
		
		protected function frameAction():void{
			if(_barrageVo){
				this.x-=_barrageVo.speed;
				if(this.x<=-this.width){
					reset();
				}
			}
		}
		
		public function destroy():void
		{
			removeEvent();
		}
		
		private var _barrageVo:BarrageVo;
		public function setVo(vo:BarrageVo):void{
			_barrageVo=vo;
			
			this.x=ConfigManager.W_video;
		}
		public function get vo():BarrageVo{
			return _barrageVo;
		}
		
		public function start():void{
			//FrameRenderManager.instance.add(frameAction);
			BarrageRenderManager.instance.add(frameAction);
		}
		
		public function reset():void{
			//FrameRenderManager.instance.remove(frameAction);
			BarrageRenderManager.instance.remove(frameAction);
			this.x=ConfigManager.W_video;
			if(this.parent){
				this.parent.removeChild(this);
			}
			BarrageManager.instance.removeRight(this);
			if(this is BarrageRightTxtItem){
				BarrageFactory.instance.poolTxtBarrage(BarrageRightTxtItem(this));
			}
		}
	}
}