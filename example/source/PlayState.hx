package;

import langhaxe.LanguageManager;
import lime.utils.Assets;
import haxe.Json;
import langhaxe.LangHaxe;
import flixel.FlxG;
import langhaxe.Language;
import flixel.text.FlxText;
import flixel.FlxState;

class PlayState extends FlxState
{
	var cooltext:FlxText = new FlxText(0,0,0,"Hello World", 32);
	var lang:String = 'es';

	override public function create()
	{
		add(cooltext);
		cooltext.alignment = CENTER;
		updateText();

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justReleased.ANY)
			updateText();

		super.update(elapsed);
	}

	function updateText() {
		if (lang == 'es') lang = 'en';
		else lang = 'es';
		LanguageManager.LANGUAGE = lang;
		PhraseManager.init();

		var newtext:Dynamic = PhraseManager.getPhrase("yo dude");
		newtext += '\n' + PhraseManager.getPhrase("what are you doing");
		cooltext.text = newtext.toString();
		cooltext.screenCenter();
	}
}
