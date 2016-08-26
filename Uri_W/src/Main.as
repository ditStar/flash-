package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import ya.component.loads.XmlLoader;
	import ya.manages.ControllerManager;
	import ya.manages.LayerManager;
	import ya.manages.LogManager;
	import ya.manages.UrlManager;
	import ya.module.controller.PlayerController;
	import ya.module.model.player.PlayerModel;
	
	[SWF(backgroundColor="0x000000", width="886", height="504")]
	public class Main extends Sprite
	{
		public function Main(){
			this.addEventListener(Event.ADDED_TO_STAGE,addStageFun);
		}
		
		private function addStageFun(e:Event):void{
			init();
		}
		
		private function init():void{
			initTool();
			LayerManager.init(this.stage);
			ControllerManager.instance.init();
			PlayerController.instance.initWebParamVo(thisParam);
			
			//获取播放状态
			if(PlayerModel.instance.webParamVo.cid){
				new XmlLoader(UrlManager.instance.getStreamUrl(PlayerModel.instance.webParamVo.cid),xmlcomplete);
			}else{
				new XmlLoader(UrlManager.instance.getStreamUrl("50341"),xmlcomplete);
			}
		}
		
		private function xmlcomplete(obj:Object):void{
			PlayerController.instance.initVideoVoByXml(new XML(obj));
		}
		
		private function initTool():void{
			LogManager.register(this.stage);
		}
		
		private function get thisParam():Object{
			return this.loaderInfo.parameters;
		}
	}
}