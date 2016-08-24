package ya.component
{
	import avmplus.getQualifiedClassName;
	
	import flash.display.DisplayObject;
	import flash.system.ApplicationDomain;
	
	public class YaReflection
	{
		public static function createInstance(link:String, domain:ApplicationDomain=null):*
		{
			var linkClass:Class = getClass(link, domain);
			if (linkClass != null)
			{
				return new linkClass(); 
			}
			return null;
		}
		
		public static function getClass(link:String, domain:ApplicationDomain=null):Class
		{
			if (domain == null)
			{
				domain = ApplicationDomain.currentDomain;
			}
			var result:Class = domain.getDefinition(link) as Class;
			return result;
		}
		
		public static function createBitmapDataInstance(link:String, domain:ApplicationDomain=null):*
		{
			var linkClass:Class = getClass(link, domain);
			if (linkClass != null)
			{
				return new linkClass(0,0);
			}
			return null;
		}
		
		public static function createDisplayObjectInstance(link:String, domain:ApplicationDomain=null):DisplayObject
		{
			return createInstance(link, domain) as DisplayObject;
		}
		
		public static function getPackageName(obj:*):String
		{
			var fullClassName:String = getFullClassName(obj);
			var index:int = fullClassName.lastIndexOf(".");
			if (index >= 0)
			{
				return fullClassName.substring(0, index);
			}
			return "";
		}
		
		public static function getClassName(obj:*):String
		{
			var fullClassName:String = getFullClassName(obj);
			var index:int = fullClassName.lastIndexOf(":");
			if (index >= 0)
			{
				fullClassName = fullClassName.substr(index + 1);
			}
			return fullClassName;
		}
		
		public static function getFullClassName(obj:*):String
		{
			return getQualifiedClassName(obj);
		}
	}
}