package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import openfl.utils.Assets as OpenFlAssets;

#if sys
import sys.FileSystem;
#end

class IndyEndState extends MusicBeatState
{
	private var videoCurrentlyPlaying:FlxVideo;
	private var isVideoCurrentlyPlaying:Bool;
	var skippedToCredits:Bool = false;

	override function create()
	{
		super.create();

		function playCredits(name:String):Void {
			#if VIDEOS_ALLOWED
			var foundFile:Bool = false;
			var fileName:String = #if MODS_ALLOWED Paths.mods('videos/' + name + '.' + Paths.VIDEO_EXT); #else ''; #end
			#if sys
			if(FileSystem.exists(fileName)) {
				foundFile = true;
			}
			#end
	
			if(!foundFile) {
				fileName = Paths.video(name);
				#if sys
				if(FileSystem.exists(fileName)) {
				#else
				if(OpenFlAssets.exists(fileName)) {
				#end
					foundFile = true;
				}
			}
	
			if(foundFile) {
				var bg = new FlxSprite(-FlxG.width, -FlxG.height).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
				bg.scrollFactor.set();
				add(bg);
				videoCurrentlyPlaying = new FlxVideo(fileName);
				isVideoCurrentlyPlaying = true;
	
				(videoCurrentlyPlaying).finishCallback = function() {
					remove(bg);
					FlxG.sound.playMusic(Paths.music('menu_variation_0'));
					MusicBeatState.switchState(new StoryMenuState());
					isVideoCurrentlyPlaying = false;
				}
				return;
			} else {
				FlxG.log.warn('Couldnt find video file: ' + fileName);
			}
			#end
			FlxG.sound.playMusic(Paths.music('menu_variation_0'));
			MusicBeatState.switchState(new StoryMenuState());
		}

		function videoIntroPart2(name:String):Void {
			#if VIDEOS_ALLOWED
			var foundFile:Bool = false;
			var fileName:String = #if MODS_ALLOWED Paths.mods('videos/' + name + '.' + Paths.VIDEO_EXT); #else ''; #end
			#if sys
			if(FileSystem.exists(fileName)) {
				foundFile = true;
			}
			#end
	
			if(!foundFile) {
				fileName = Paths.video(name);
				#if sys
				if(FileSystem.exists(fileName)) {
				#else
				if(OpenFlAssets.exists(fileName)) {
				#end
					foundFile = true;
				}
			}
	
			if(foundFile) {
				var bg = new FlxSprite(-FlxG.width, -FlxG.height).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
				bg.scrollFactor.set();
				add(bg);
				videoCurrentlyPlaying = new FlxVideo(fileName);
				isVideoCurrentlyPlaying = true;
	
				(videoCurrentlyPlaying).finishCallback = function() {
					playCredits('week2/Week 2 Credits GAME');
				}
				return;
			} else {
				FlxG.log.warn('Couldnt find video file: ' + fileName);
			}
			#end
			playCredits('week2/Week 2 Credits GAME');
		}

		function videoIntro(name:String):Void {
			#if VIDEOS_ALLOWED
			var foundFile:Bool = false;
			var fileName:String = #if MODS_ALLOWED Paths.mods('videos/' + name + '.' + Paths.VIDEO_EXT); #else ''; #end
			#if sys
			if(FileSystem.exists(fileName)) {
				foundFile = true;
			}
			#end
	
			if(!foundFile) {
				fileName = Paths.video(name);
				#if sys
				if(FileSystem.exists(fileName)) {
				#else
				if(OpenFlAssets.exists(fileName)) {
				#end
					foundFile = true;
				}
			}
	
			if(foundFile) {
				var bg = new FlxSprite(-FlxG.width, -FlxG.height).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
				bg.scrollFactor.set();
				add(bg);
				videoCurrentlyPlaying = new FlxVideo(fileName);
				isVideoCurrentlyPlaying = true;
	
				(videoCurrentlyPlaying).finishCallback = function() {
					if (skippedToCredits)
					{
						playCredits('week2/Week 2 Credits GAME');
					}
					else
					{
						videoIntroPart2('week2/Week 2 Cutscene 4 GAME');
					}
				}
				return;
			} else {
				FlxG.log.warn('Couldnt find video file: ' + fileName);
			}
			#end
			if (skippedToCredits)
			{
				playCredits('week2/Week 2 Credits GAME');
			}
			else
			{
				videoIntroPart2('week2/Week 2 Cutscene 4 GAME');
			}
		}

		videoIntro('week2/Week 2 Cutscene 3 GAME');
	}

	override function update(elapsed:Float)
	{		
		if(isVideoCurrentlyPlaying)
		{
			if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.ESCAPE)
			{
				skippedToCredits = true;
				videoCurrentlyPlaying.skipVideo();
			}
		}
		
		super.update(elapsed);
	}
}
