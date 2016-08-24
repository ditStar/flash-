package ya.component
{
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import ya.interfaces.IDestroy;
	
	public class YaTextField extends TextField implements IDestroy
	{
		public function destroy():void
		{
			
		}
		
		public static function getYaTextFiled(param:Object):YaTextField{
			var uTxt:YaTextField=new YaTextField();
			
			if(param.hasOwnProperty("filter")==true){
				uTxt.filters = [new GlowFilter(0x000000,1,2,2,10)];
			}
			
			var _textFormat:TextFormat = new TextFormat();
			if(param.hasOwnProperty("font")){
				_textFormat.font=param["font"];
			}else{
				_textFormat.font="黑体";
			}
			if(param.hasOwnProperty("color")){
				_textFormat.color=param["color"];
			}else{
				_textFormat.color=0xffffff;
			}
			if(param.hasOwnProperty("size")){
				_textFormat.size=param["size"];
			}else{
				_textFormat.size=12;
			}
			if(param.hasOwnProperty("align")){
				_textFormat.align=param["align"];
			}else{
				_textFormat.align=TextFieldAutoSize.LEFT;
			}
			if(param.hasOwnProperty("leading")){
				_textFormat.leading=param["leading"];
			}else{
				_textFormat.leading=8;
			}
			if(param.hasOwnProperty("width")){
				uTxt.width=param["width"];
			}
			if(param.hasOwnProperty("height")){
				uTxt.height=param["height"];
			}
			if(param.hasOwnProperty("x")){
				uTxt.x=param["x"];
			}
			if(param.hasOwnProperty("y")){
				uTxt.y=param["y"];
			}
			if(param.hasOwnProperty("multiline")){
				uTxt.multiline=param["multiline"];
			}else{
				uTxt.multiline=false;
			}
			if(param.hasOwnProperty("wordWrap")){
				uTxt.wordWrap=param["wordWrap"];
			}else{
				uTxt.wordWrap=false;
			}
			if(param.hasOwnProperty("autoSize")){
				uTxt.autoSize=param["autoSize"];
			}else{
				uTxt.autoSize=TextFieldAutoSize.LEFT;
			}
			if(param.hasOwnProperty("mouseEnabled")){
				uTxt.mouseEnabled=param["mouseEnabled"];
			}
			uTxt.defaultTextFormat = _textFormat;
			return uTxt;
		}
	}
}