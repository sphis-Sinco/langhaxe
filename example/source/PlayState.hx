package;

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
	var langFile:LangHaxe;

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
		langFile = Language.readLang(lang);

		var newtext:Dynamic = langFile.phrases.yo_dude;
		newtext += '\n' + langFile.phrases.what_are_you_doing;
		cooltext.text = newtext.toString();
		cooltext.screenCenter();
	}
}
