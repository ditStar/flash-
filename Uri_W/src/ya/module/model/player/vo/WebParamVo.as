package ya.module.model.player.vo
{
	public class WebParamVo
	{
		public var autoLoad:String;//1
		public var cid:String;//57076
		public var cover:String;//http://i0.hdslb.com/bfs/live/57076.jpg?07131058
		public var onready:String;//playerOnReady
		public var rnd:String;//1468378757
		public var room_id:int;//57076
		public var start:String;//1468372687
		public var state:String;//LIVE
		
		public var aid:String="";
		
		public var type:String="bili2";
		public function WebParamVo()
		{
		}
		
		public function initDataByObj(obj:Object):void{
			this.autoLoad=obj["autoLoad"];
			this.cid=obj["cid"];
			this.cover=obj["cover"];
			this.onready=obj["onready"];
			this.rnd=obj["rnd"];
			this.room_id=obj["room_id"];
			this.start=obj["start"];
			this.state=obj["state"];
		}
	}
}