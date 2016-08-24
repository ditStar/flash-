package ya.module.model.player.vo
{
	public class ServerVo
	{
//		<uid></uid>
//		<uname></uname>
//		<login></login>
//		<isadmin></isadmin>
//		<time>1468372687</time>
//		<rank></rank>
//		<level></level>
//		<state>LIVE</state>
//		<chatid>57076</chatid>
//		<server>livecmt-2.bilibili.com</server>
//		<sheid_user></sheid_user>
//		<block_time>0</block_time>
//		<block_type>0</block_type>
//		<room_shield>0</room_shield>
//		<level_sheid>0</level_sheid>
//		<user_sheid_keyword></user_sheid_keyword>
//		<need_authority>0</need_authority>
//		<authority_range>日本</authority_range>
		
		public var uid:String;
		public var uname:String;
		public var login:String;
		public var isadmin:String;
		public var time:String;
		public var rank:String;
		public var level:String;
		public var state:String;
		public var chatid:String;
		public var server:String;
		public var sheid_user:String;
		public var block_time:String;
		public var room_shield:String;
		public var level_sheid:String;
		public var user_sheid_keyword:String;
		public var need_authority:String;
		public var authority_range:String;
		
		public function iniDataByXml(xml_:XML):void{
		}
	}
}