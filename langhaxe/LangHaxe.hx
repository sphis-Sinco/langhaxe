package langhaxe;

using StringTools;

typedef LangHaxe =
{
	var name:String;
	var ?asset_suffix:String;
	var ?lang_ver:Float;
	var ?phrases:haxe.DynamicAccess<String>;
}

class PhraseManager
{
	public static var PHRASES_REQUIRING_FALLBACK:Array<String> = [];

	public static var languageList:LangHaxe = null;

	public static function init()
	{
		// Avoid loading the language file everytime getPhrase is called.
		try
		{
			languageList = Language.readLang(LanguageManager.LANGUAGE);
		}
		catch (e)
		{
			trace("Failed loading language: " + LanguageManager.LANGUAGE + " // " + e.message);
			languageList = Language.readLang("english"); // Use english.
			return;
		}
		trace("Language \"" + LanguageManager.LANGUAGE + "\" loaded.");
	}

	public static function getPhrase(phrase:Dynamic, ?fb:Dynamic = null):Dynamic
	{
		var json:haxe.DynamicAccess<String> = languageList.phrases;
		var fallback:Dynamic = (fb != null ? fb : phrase);
		var returnValue:Dynamic;

		try
		{
			returnValue = json.get(Std.string(phrase).toLowerCase().replace(' ', '_'));
		}
		catch (e)
		{
			if (!PHRASES_REQUIRING_FALLBACK.contains(phrase))
			{
				trace('[PHRASE MANAGER] Phrase "$phrase" required fallback');
				PHRASES_REQUIRING_FALLBACK.push(phrase);
			}
			returnValue = fallback;
		}

		return returnValue;
	}
}