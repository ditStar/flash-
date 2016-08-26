package ya.module.model.player
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import ya.manages.UrlManager;
	import ya.module.model.player.vo.ServerVo;
	import ya.module.model.player.vo.VideoVo;
	import ya.module.model.player.vo.WebParamVo;
	
	public class PlayerModel extends EventDispatcher
	{
		private var _webParamVo:WebParamVo;
		private var _serverVo:ServerVo;
		private var _videoVo:VideoVo;
		
		private static var _instance:PlayerModel;
		public static function get instance():PlayerModel{
			if(_instance==null){
				_instance=new PlayerModel();
			}
			return _instance;
		}
		
		public function PlayerModel(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function initWebParamVo(obj:Object):void{
			if(_webParamVo==null){
				_webParamVo=new WebParamVo();
			}
			_webParamVo.initDataByObj(obj);
		}
		public function get webParamVo():WebParamVo{
			return _webParamVo;
		}
		
		public function initServerVoByXml(xml_:XML):void{
			if(_serverVo==null){
				_serverVo=new ServerVo();
			}
			_serverVo.iniDataByXml(xml_);
		}
		public function get serverVo():ServerVo{
			return _serverVo;
		}
		
		public function initVideoVoByXml(xml_:XML):void{
			if(_videoVo==null){
				_videoVo=new VideoVo();
			}
			_videoVo.initDataByXml(xml_);
		}
		public function get videoVo():VideoVo{
			return _videoVo;
		}
		
		public function get getConfigUrl():String{
			var aidSeg:String = _webParamVo.aid == "" ? "" : "&aid=" + _webParamVo.aid;
			var cid:String = null;
			switch(_webParamVo.type)
			{
				case 'bili2':
				case 'letv':
					cid = 'cid:' + _webParamVo.cid;
					break;
				default:
					cid = _webParamVo.cid;
					break;
			}
			
			return UrlManager.instance.getPlayerUrl()+'id=' + cid + aidSeg + "&ts=" + new Date().time.toString(16);
		}
	}
}