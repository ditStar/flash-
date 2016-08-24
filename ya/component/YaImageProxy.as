package ya.component
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	
	import ya.component.managers.BitManager;
	
	public class YaImageProxy extends Sprite
	{
		private var _key:String="";
		private var _action:Boolean=false;
		private var _bitmap:Bitmap;
		public static var loading:Dictionary=new Dictionary();
		
		public function YaImageProxy(key:String="")
		{
			if(key!=""){
				setBitUrlname(key);
			}
		}
		
		public function set enabled(bl:Boolean):void{
			this.mouseChildren=this.mouseEnabled=bl;
		}
		
		public function get key():String{
			return _key;
		}

		private function setBitUrlname(key:String):void{
			_key=key;
			
			if(BitManager.instance.isHasBitmapData(key)){
				initBit();
			}else{
				if(loading[_key]==null){
					loading[_key]=[initBit];
				}else{
					loading[_key].push(initBit);
					return;
				}
				var loader:Loader=new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadComplete);
				loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadError);
				loader.load(new URLRequest(key));
			}
		}
		
		private function initBit():void{
			_bitmap=new Bitmap(BitManager.instance.getBitmapData(_key));
			this.addChild(_bitmap);
		}
		
		private function loadComplete(e:Event):void{
			BitManager.instance.putBitmapData(_key,e.target.content.bitmapData);
			
			var arr:Array=loading[_key];
			while(arr.length>0){
				arr.pop()();
			}
			loading[_key]=null;
			delete loading[_key];
		}
		
		public function removeParent():void{
			if(this.parent){
				this.parent.removeChild(this);
			}
		}
		
		public function loadError(e:IOErrorEvent):void{
			_bitmap=new Bitmap(new BitmapData(10,10));
			this.addChild(_bitmap);
		}
		
		public function destroy():void{
			
		}
	}
}