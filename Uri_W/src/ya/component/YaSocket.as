package ya.component
{
	import com.adobe.serialization.json.MyJSON;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	
	import ya.interfaces.IDestroy;
	import ya.manages.LogManager;
	import ya.module.model.barrage.BarrageModel;
	import ya.module.model.player.PlayerModel;
	
	public class YaSocket extends Socket implements IDestroy
	{
		public function YaSocket()
		{
			_data=new ByteArray();
			addEvent();
		}
		
		override public function connect(host:String, port:int):void{
			super.connect(host, port);
		}
		
		private function addEvent():void{
			this.addEventListener(ProgressEvent.SOCKET_DATA, eventFun);
			this.addEventListener(Event.CONNECT, eventFun);
			this.addEventListener(Event.CLOSE, eventFun);
			this.addEventListener(IOErrorEvent.IO_ERROR, eventFun);
			this.addEventListener(SecurityErrorEvent.SECURITY_ERROR, eventFun);
		}
		
		private function removeEvent():void{
			this.removeEventListener(ProgressEvent.SOCKET_DATA, eventFun);
			this.removeEventListener(Event.CONNECT, eventFun);
			this.removeEventListener(Event.CLOSE, eventFun);
			this.removeEventListener(IOErrorEvent.IO_ERROR, eventFun);
			this.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, eventFun);
		}
		
		private function eventFun(e:Event):void{
			LogManager.log(e.type);
			
			if(e.type==ProgressEvent.SOCKET_DATA){
				readSocketData();
			}else if(e.type==Event.CONNECT){
				firstHandshakeFun();
			}else if(e.type==Event.CLOSE){
			}else if(e.type==IOErrorEvent.IO_ERROR){
				
			}else if(e.type==SecurityErrorEvent.SECURITY_ERROR){
				
			}
		}
		
		private function firstHandshakeFun():void{
		}
		protected function _writePack(index:int, payload:String):void
		{
			this.writeShort(index);
			this.writeShort(4 + payload.length);
			this.writeUTFBytes(payload);
			this.flush();
		}
		/**
		 * 缓存向服务器发送的包裹
		 */
		protected var buffer:Array = [];
		
		private function sendsocketData(plen:int, hlen:int, ver:int, operation:int, seq:int = 1, b:ByteArray = null):void
		{
			this.writeInt(plen);
			this.writeShort(hlen);
			this.writeShort(ver);
			this.writeInt(operation);
			this.writeInt(seq);
			b?this.writeBytes(b):'';
			this.flush();
		}
		
		private var _index:int = 0;
		private var _length:int = 0;
		private var _bufferLength:int = 0;
		private var _packageLength:int = 4;
		private var threshold:int = 1024*1024;//设定的一个阀值，缓冲区数据如果超过这个值那么应该是出问题了，所以要丢掉重新读包
		
		private var _data:ByteArray;
		public function readSocketData():void
		{
			_bufferLength += this.bytesAvailable;
			this.readBytes(_data, _data.length);
			packetParser();
		}
		
		public function destroy():void
		{
			removeEvent();
		}
		
		protected function packetParser():void
		{
			if (_bufferLength >= _packageLength){
				if (_bufferLength > threshold){
					_data.readUTFBytes(_bufferLength);
					_index = _length = _bufferLength = 0;
					_packageLength = 4;
					return;
				}
				
				if(_packageLength == 4)
				{
					_packageLength = _data.readInt() - 4;
					_bufferLength -= 4;
				}
				if(_bufferLength < _packageLength){
					return;
				}
				if (_index == 0){
					var hlen:int = _data.readShort();
					var ver:int = _data.readShort();
					_index = _data.readInt();	
					var seq:int = _data.readInt();	
					_bufferLength -= 12;
					_packageLength -= 12;
				}
				_length = _packageLength;
				
				if (_length <= _bufferLength){
					LogManager.log(_index);
					switch (_index){
						case 0x01:
							var _readInt:int=_data.readInt();
							break;
						case 0x02:
						case 0x03:
							_readInt=_data.readInt();
							break;
						case 0x04:
							BarrageModel.instance.normalBarrageAction(_data.readUTFBytes(_length));
							break;
						case 0x05://弹幕
							BarrageModel.instance.normalBarrageAction(_data.readUTFBytes(_length));
							break;
						case 0x06:
							LogManager.log(_data.readUTFBytes(_length));
							break;
						case 0x08:
							_data.readUTFBytes(_packageLength);
							break;
						case 0x11:
							return;
						default:
							_data.readUTFBytes(_length);
					}
					_bufferLength -= _length;
					_index = _length = 0;
					_packageLength = 4;
					if (_bufferLength> 4)
					{
						return packetParser();
					}
				}
			}
		}
	}
}