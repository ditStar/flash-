package ya.module.model.video
{
	import flash.events.EventDispatcher;
	
	public class VideoModel extends EventDispatcher
	{
		private static var _instance:VideoModel;
		
		public static function get instance():VideoModel{
			if(_instance==null){
				_instance=new VideoModel();
			}
			return _instance;
		}
		
		public function VideoModel()
		{
		}
	}
}