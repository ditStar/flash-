package ya.module.views.barrage.manager
{
	import ya.manages.ConfigManager;
	import ya.module.views.barrage.BarrageBaseItem;
	
	public class BarrageManager
	{
		private static var _instance:BarrageManager;
		public static function get instance():BarrageManager{
			if(_instance==null){
				_instance=new BarrageManager();
			}
			return _instance;
		}
		
		private var _rightToArr:Array=[];
		private var _len:int=13;
		private var _h:int=24;
		private var _gapW:int=30;
		private var _gapH:int=12;
		public function addRight(item:BarrageBaseItem):Boolean{
			var itemTemp:BarrageBaseItem;
			var index:int;
			
			var tempIndexArr:Array=[];
			for(index=0;index<_len;index++){
				if(_rightToArr[index]==null){
					_rightToArr[index]=item;
					this.setY(item,index);
					return true;
				}else{
					itemTemp=_rightToArr[index];
					var timeTemp:Number=(itemTemp.width+itemTemp.x+_gapW)/itemTemp.vo.speed;
					var timeThis:Number=(item.x)/item.vo.speed;
					if(timeThis>timeTemp){
						if((itemTemp.width+itemTemp.x)>ConfigManager.W_video){
							tempIndexArr.push(index);
						}else{
							_rightToArr[index]=item;
							this.setY(item,index);
							return true;
						}
					}
				}
			}
			if(tempIndexArr.length>0){
				index=tempIndexArr[int(Math.random()*tempIndexArr.length)];
				_rightToArr[index]=item;
				this.setY(item,index);
				return true;
			}
			return false;
			var val:Number=9999999;
			var indexVal:int=0;
			for(index=0;index<_len;index++){
				itemTemp=_rightToArr[index];
				timeTemp=(itemTemp.width+itemTemp.x+_gapW)/itemTemp.vo.speed;
				if(val>timeTemp){
					val=timeTemp;
					indexVal=index;
				}
			}
			_rightToArr[indexVal]=item;
			this.setY(item,indexVal);
			return true;
		}
		public function removeRight(item:BarrageBaseItem):void{
			var index:int=_rightToArr.indexOf(item);
			if(index!=-1){
				_rightToArr[index]=null;
			}
		}
		public function setY(barrage:BarrageBaseItem,index:int):void{
			barrage.setY((_h+_gapH)*index);
		}
	}
}