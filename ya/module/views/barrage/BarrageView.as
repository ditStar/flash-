package ya.module.views.barrage
{
	import flash.display.Sprite;
	import flash.utils.setTimeout;
	
	import ya.interfaces.IDestroy;
	import ya.manages.FrameRenderManager;
	import ya.module.model.barrage.vo.BarrageVo;
	import ya.module.views.barrage.manager.BarrageManager;
	
	public class BarrageView extends Sprite implements IDestroy
	{
		public function BarrageView()
		{
			super();
			var val:int=setTimeout(function():void{
				FrameRenderManager.instance.add(addFun);
			},2000)
		}
		
		private function addFun():void{
			var item:BarrageRightTxtItem=BarrageFactory.instance.txtBarrageItem;
			item.setVo(new BarrageVo());
			if(BarrageManager.instance.addRight(item)){
				this.addChild(item)&&item.start();
			}else{
				item.destroy();
			}
		}
		
		public function addBarrageVo(vo:BarrageVo):void{
		}
		
		public function destroy():void
		{
		}
	}
}