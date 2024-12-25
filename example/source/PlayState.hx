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
		langFile = Json.parse(Assets.getText(Language.getLanguageFilePath(lang)));

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

		var newtext:String = langFile.phrases.get('hello_world');
		newtext += '\n' + langFile.phrases.get('how_are_you');
		cooltext.text = newtext.toString();
		cooltext.screenCenter();
	}
}
