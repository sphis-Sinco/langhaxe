package langhaxe;

import lime.utils.Assets;
import haxe.Json;

class Language {
	public static var LANGUAGE_FILE_EXTENSION:String = 'langhx';
	public static var LANGUAGE_FOLDER:String = 'translations';

	// Returns the language file with the name passed through `lang` path.
	public static function getLanguageFilePath(filename:String):String return 'assets/$LANGUAGE_FOLDER/$filename.$LANGUAGE_FILE_EXTENSION';

	// Returns the read language file with the name passed through `lang`.
	public static function readLang(lang:String):LangHaxe return Json.parse(Assets.getText(getLanguageFilePath(lang)));
}
