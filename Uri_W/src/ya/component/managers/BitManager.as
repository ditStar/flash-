package ya.component.managers
{
	import flash.display.BitmapData;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	
	public class BitManager extends EventDispatcher
	{
		private static var _instance:BitManager;
		public static function get instance():BitManager{
			if(_instance==null){
				_instance=new BitManager();
			}
			return _instance;
		}
		
		public var bitObj:Dictionary=new Dictionary();
		
		public function putBitmapData(key:String,bitmapData:BitmapData):void{
			bitObj[key]=bitmapData;
		}
		
		public function deleteBitmapData(key:String):void{
			if(bitObj[key]){
				bitObj[key]=null;
				delete bitObj[key];
			}
		}
		
		public function isHasBitmapData(key:String):Boolean{
			if(bitObj[key]){
				return true;
			}else{
				return false;
			}
		}
		
		public function getBitmapData(key:String):BitmapData{
			if(bitObj[key]){
				return BitmapData(bitObj[key]).clone();
			}else{
				return new BitmapData(1,1);
			}
		}
		
		public function BitManager(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		
		private var _isLoding:Dictionary=new Dictionary();
		private var _callFun:Dictionary=new Dictionary();
	}
}