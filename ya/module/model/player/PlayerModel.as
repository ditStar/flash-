package ya.module.model.player
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.system.Security;
	
	import ya.component.events.EventName;
	import ya.component.events.ParamEvent;
	import ya.component.events.YaDispatcher;
	import ya.module.model.player.vo.PlayerVo;
	import ya.module.model.player.vo.ServerVo;
	import ya.module.model.player.vo.VideoVo;
	
	public class PlayerModel extends EventDispatcher
	{
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
		
		private  var _playerVo:PlayerVo;
		public function initPlayerVoByObj(obj:Object):void{
			if(_playerVo==null){
				_playerVo=new PlayerVo();
			}
			_playerVo.initDataByObj(obj);
		}
		public function get playerVo():PlayerVo{
			return _playerVo;
		}
		
		private var _serverVo:ServerVo;
		public function initServerVoByXml(xml_:XML):void{
			_serverVo=new ServerVo();
			_serverVo.iniDataByXml(xml_);
			
			YaDispatcher.instance.dispatchEvent(new ParamEvent(EventName.Server_Xml_Complete,_serverVo));
		}
		public function get serverVo():ServerVo{
			return _serverVo;
		}
		
		private var _videoVo:VideoVo;
		public function initVideoVoByXml(xml_:XML):void{
			_videoVo=new VideoVo();
			_videoVo.initDataByXml(xml_);
			
			YaDispatcher.instance.dispatchEvent(new ParamEvent(EventName.Video_Xml_Complete,_videoVo));
		}
		public function get videoVo():VideoVo{
			return _videoVo;
		}
		
		public function get getConfigUrl():String{
			return "直播地址";
		}
	}
}