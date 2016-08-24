package ya.utils
{
	import flash.display.DisplayObject;

	public class YaUtils
	{
		public static function setCenterByDisplayObject(dis:DisplayObject):void{
			if(dis.parent){
				dis.x=(dis.parent.width-dis.width)/2;
				dis.y=(dis.parent.height-dis.height)/2;
			}
		}
		
		public static function secToTime ( secs:int ):String { 
			var h:int = Math.floor ( secs / 3600); 
			var m:int = Math.floor ( ( secs - h * 3600 ) / 60 ); 
			var s:int = secs - h * 3600 - m * 60; 
			return h + ":" + m + ":" + s; 
		} 
	}
}