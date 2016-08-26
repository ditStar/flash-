package ya.module.controller
{
	import flash.events.Event;
	import flash.system.Security;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	import ya.component.events.EventName;
	import ya.component.events.ParamEvent;
	import ya.component.events.YaDispatcher;
	import ya.module.model.player.PlayerModel;
	import ya.component.YaSocket;
	import ya.module.model.player.vo.ServerVo;
	
	public class SocketController extends BaseController
	{
		private static var _instance:SocketController;
		public static function get instance():SocketController{
			if(_instance==null){
				_instance=new SocketController();
			}
			return _instance;
		}
		
		public function SocketController()
		{
			super();
		}
		
		override public function addEvent():void{
			YaDispatcher.instance.addEventListener(EventName.Server_Xml_Complete,Server_Xml_Complete);
		}
		
		private var _socket:YaSocket;
		private function Server_Xml_Complete(e:ParamEvent):void{
			var serverVo:ServerVo=e.param as ServerVo;
			
			Security.loadPolicyFile("xmlsocket:://"+serverVo.server+":843");
			initSocket();
		}
		private var _timeOutVal:int;
		private function closeFun(e:Event):void{
			_socket.removeEventListener(Event.CLOSE,closeFun);
			_socket.destroy();
			_socket=null;
			
			_timeOutVal=setTimeout(initSocket,3000);
		}
		private function initSocket():void{
			clearTimeout(_timeOutVal);
			
			_socket=new YaSocket();
			_socket.addEventListener(Event.CLOSE,closeFun);
			_socket.connect(PlayerModel.instance.serverVo.server,788);
		}
	}
}