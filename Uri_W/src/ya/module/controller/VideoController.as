package ya.module.controller
{
	import flash.media.Video;
	
	import ya.component.events.EventName;
	import ya.component.events.ParamEvent;
	import ya.component.events.YaDispatcher;
	import ya.manages.ErrorManager;
	import ya.module.model.player.vo.VideoVo;
	import ya.module.views.video.VideoLiveView;
	
	public class VideoController extends BaseController
	{
		private static var _instance:VideoController;
		public static function get instance():VideoController{
			if(_instance==null){
				_instance=new VideoController();
			}
			return _instance;
		}
		
		public function VideoController()
		{
			ErrorManager.singleError(_instance);
		}
		
		override public function addEvent():void{
			YaDispatcher.instance.addEventListener(EventName.Video_Xml_Complete,Video_Xml_Complete_Fun);
		}
		
		private var _video:VideoLiveView;
		private function Video_Xml_Complete_Fun(e:ParamEvent):void{
			var vo:VideoVo=e.param as VideoVo;
			
			if(vo.type==VideoVo.LIVE){
				if(_video==null){
					_video=new VideoLiveView();
				}
				_video.setVideoVo(vo);
				_video.initParant();
			}
		}
	}
}