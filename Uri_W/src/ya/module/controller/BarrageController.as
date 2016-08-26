package ya.module.controller
{
	import ya.component.events.EventName;
	import ya.component.events.ParamEvent;
	import ya.component.events.YaDispatcher;
	import ya.component.loads.XmlLoader;
	import ya.manages.ErrorManager;
	import ya.manages.LayerManager;
	import ya.module.model.barrage.vo.BarrageVo;
	import ya.module.model.player.PlayerModel;
	import ya.module.views.barrage.BarrageView;
	
	public class BarrageController extends BaseController
	{
		private static var _instance:BarrageController;
		public static function get instance():BarrageController{
			if(_instance==null){
				_instance=new BarrageController();
			}
			return _instance;
		}
		public function BarrageController()
		{
			ErrorManager.singleError(_instance);
			init();
		}
		
		override public function addEvent():void{
			YaDispatcher.instance.addEventListener(EventName.Video_Xml_Complete,videoXmlComplete);
		}
		
		private function videoXmlComplete(e:ParamEvent):void{
			new XmlLoader(PlayerModel.instance.getConfigUrl,xmlCompleteFun);
			
			initBarrageView();
		}
		private function xmlCompleteFun(xml_:Object):void{
			XML.ignoreWhitespace = false;
			var xml:XML=new XML('<root>' + xml_ + '</root>');
			PlayerController.instance.initServerVoByXml(xml);
		}
		
		private var _barrageView:BarrageView;
		public function initBarrageView():void{
			if(_barrageView==null){
				(_barrageView=new BarrageView()).initParent();
			}
		}
		
		public function addBarrageAction(vo:BarrageVo):void{
			_barrageView.addBarrageVo(vo);
		}
	}
}