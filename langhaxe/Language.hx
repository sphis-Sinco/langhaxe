package langhaxe;

import lime.utils.Assets;
import haxe.Json;

class Language {
	public static var LANGUAGE_FILE_EXTENSION:String = 'langhx';
	public static var LANGUAGE_FOLDER:String = 'translations';

	public static function getLanguageFilePath(filename:String):String {
		return 'assets/$LANGUAGE_FOLDER/$filename.$LANGUAGE_FILE_EXTENSION';
	}

	public static function readLanguageFile(filename:String):LangHaxe {
		return Json.parse(Assets.getText(getLanguageFilePath(filename)));
	}
}
