package;

import flixel.FlxState;
import flixel.FlxG;

class IndyEndStateNew extends FlxState
{
	public var video:VideoPlayerD;
	public var curVideo:String = '';
	// public var isVideoCurrentlyPlaying:Bool;

	override function create()
	{
		super.create();
		

		playVideo1();
	}

	override function update(elapsed:Float)
	{
		// if(isVideoCurrentlyPlaying)
		// 	{
		// 		if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.ESCAPE)
		// 		{
		// 			video.skipVideo();
		// 			isVideoCurrentlyPlaying = false;
		// 		}
		// 	}
		super.update(elapsed);
	}

	function playVideo1():Void
	{
		if (ClientPrefs.subtitles)
		video = new VideoPlayerD('week2/subtitles/3');
		else
		video = new VideoPlayerD('week2/Week 2 Cutscene 3 GAME');	
		
	
		video.finishCallback = playVideo2; 
		curVideo = 'cutscene1';
		// isVideoCurrentlyPlaying = true;
	}

	function playVideo2():Void
	{
		
		if (ClientPrefs.subtitles)
		video = new VideoPlayerD('week2/subtitles/4');
		else
		video = new VideoPlayerD('week2/Week 2 Cutscene 4 GAME');
			
		
		video.finishCallback = playCredits;
		curVideo = 'cutscene2';
		// isVideoCurrentlyPlaying = true;
	}

	function playCredits():Void
	{
		video = new VideoPlayerD('week2/Week 2 Credits GAME');
		video.finishCallback = back2Menu;
		curVideo = 'credits';
		// isVideoCurrentlyPlaying = true;
	}

	function back2Menu():Void
	{
		video.finishCallback = function(){trace('huh');};
		FlxG.sound.playMusic(Paths.music('menu_variation_0'));
		FlxG.switchState(new StoryMenuState());
		

	}
}
/*package;

import flixel.FlxState;
import flixel.FlxG;

class IndyEndStateNew extends FlxState
{
	public var video:VideoPlayerD;
	private var isVideoCurrentlyPlaying:Bool;
	public var curVideo:String = '';

	override function create()
	{
		super.create();
		

		playVideo1();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ENTER && video != null) 
			switch (curVideo)
			{
				case 'credits':
					back2Menu();
			}
			if(isVideoCurrentlyPlaying)
				{
					if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.ESCAPE)
					{
						video.skipVideo();
						isVideoCurrentlyPlaying = false;
					}
				}
				super.update(elapsed);
	}

	function playVideo1():Void
	{
		trace('Playing vid 1');
		video = new VideoPlayerD(Paths.video('week2/Week 2 Cutscene 3 GAME'));
		video.finishCallback = playVideo2;
		curVideo = 'cutscene1';
		isVideoCurrentlyPlaying = true;
	}

	function playVideo2():Void
	{
		video = new VideoPlayerD(Paths.video('week2/Week 2 Cutscene 4 GAME'));
		video.finishCallback = playCredits;
		curVideo = 'cutscene2';
		isVideoCurrentlyPlaying = true;
	}

	function playCredits():Void
	{
		video = new VideoPlayerD(Paths.video('week2/Week 2 Credits GAME'));
		video.finishCallback = back2Menu;
		curVideo = 'credits';
		isVideoCurrentlyPlaying = true;
	}

	function back2Menu():Void
	{
		video.finishCallback = function(){trace('huh');};
		FlxG.sound.playMusic(Paths.music('menu_variation_0'));
		FlxG.switchState(new StoryMenuState());
		isVideoCurrentlyPlaying = true;

	}
}
*/