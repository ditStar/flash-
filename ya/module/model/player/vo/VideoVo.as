package ya.module.model.player.vo
{
	public class VideoVo
	{
		public var result:String;
		public var timelength:String;
		public var stream:String;
		public var src:String;
		
		public var linesAr:Array=[];
		
		private var type:String="bili2";
		
		private var videoId:String="";
		private var barrageId:String="";
		public function VideoVo()
		{
		}
		
		public function initDataByXml(xml_:XML):void{
			var xml:XML=new XML(xml_);
			
			result=xml["result"];//suee
			timelength=xml["timelength"];//0
			stream=xml["stream"];//http
			src=xml["src"];//0
			
			linesAr =[xml["durl"]["url"],xml["durl"]["b1url"],xml["durl"]["b2url"],xml["durl"]["b3url"]];
		}
	}
}