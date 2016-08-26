package ya.manages
{
	public class ConfigManager
	{
		public static var W_video:int=886;
		public static var H_video:int=504;
		
		public static var Gap_W_Video:int=6;
		public static var Gap_H_Video:int=6;
		public static function get W_Video_Gap():int{
			return W_video-Gap_W_Video;
		}
		
		public static function get H_Video_Gap():int{
			return H_video-Gap_H_Video;
		}
		public function ConfigManager()
		{
		}
	}
}