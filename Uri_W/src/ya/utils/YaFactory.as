package ya.utils
{
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	public class YaFactory
	{
		public static function getTextFied(param:Object=null):TextField{
			var txt:TextField=new TextField();
			if(param==null)return txt;

			if(param.hasOwnProperty("filter")==true){
				txt.filters = [new GlowFilter(0x000000,1,2,2,10)];
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
				txt.width=param["width"];
			}
			if(param.hasOwnProperty("height")){
				txt.height=param["height"];
			}
			if(param.hasOwnProperty("x")){
				txt.x=param["x"];
			}
			if(param.hasOwnProperty("y")){
				txt.y=param["y"];
			}
			if(param.hasOwnProperty("multiline")){
				txt.multiline=param["multiline"];
			}else{
				txt.multiline=false;
			}
			if(param.hasOwnProperty("wordWrap")){
				txt.wordWrap=param["wordWrap"];
			}else{
				txt.wordWrap=false;
			}
			if(param.hasOwnProperty("autoSize")){
				txt.autoSize=param["autoSize"];
			}else{
				txt.autoSize=TextFieldAutoSize.LEFT;
			}
			if(param.hasOwnProperty("mouseEnabled")){
				txt.mouseEnabled=param["mouseEnabled"];
			}
			txt.defaultTextFormat = _textFormat;
			return txt;
		}
	}
}