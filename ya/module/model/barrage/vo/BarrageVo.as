package ya.module.model.barrage.vo
{
	import com.adobe.serialization.json.MyJSON;

	public class BarrageVo
	{
		public var cmd:String;
		public var isAdmin:int;
		public var uid:String;
		public var uname:String;
		public var vip:int;
		public var roomid:int;
		
		public var speed:int=5;
		public var str:String="届奥林匹克运动会中国体育代表团致贺电。";
		public function BarrageVo()
		{
			this.cmd="cmd";
			this.isAdmin=0;
			this.uid="asas";
			this.uname=str.substr(int(Math.random()*(str.length-1)));
			this.vip=1//obj["data"]["cmd"];
			this.roomid=2//obj["roomid"];
			this.speed=int(Math.random()*20)+5;
		}
		
		public function setDataByServerStr(commandStr:String):void{
			var obj:Object=MyJSON.parse(commandStr);
			this.cmd=obj["cmd"];
			this.isAdmin=0;
			this.uid="asas";
			this.uname="你妹";
			this.vip=1//obj["data"]["cmd"];
			this.roomid=2//obj["roomid"];
		}
	}
}