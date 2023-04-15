function onCreatePost()
    runHaxeCode([[
		jonah = new Character(1160, 115, 'Jonah');
		jonah.scrollFactor.set(0.97, 0.97);
        jonah.alpha = 0;
        game.add(jonah);

        adam = new Character(640, 115, 'adam');
		adam.scrollFactor.set(0.97, 0.97);
        adam.alpha = 0;
        game.add(adam);
	]]);
    makeLuaSprite('preto')
    makeGraphic('preto', screenWidth + 1000, screenHeight + 1000, '000000')
    setProperty('preto.alpha', 0)
    setObjectCamera('preto', 'hud')
    addLuaSprite('preto')
    makeLuaSprite('shrek', 's')
    setProperty('shrek.alpha', 0)
    setObjectCamera('shrek', 'other')
    addLuaSprite('shrek', true)
end

function onStepHit()
    if curStep == 1464  then
        doTweenAlpha('hudalpha', 'camHUD', 0, 1)
    end
    if curStep == 1675 then
        doTweenAlpha('hudalpha', 'camHUD', 1, 0.5)
        runHaxeCode([[
            tween = FlxTween.tween(jonah, {alpha: 1}, 0.7);
            tweena = FlxTween.tween(adam, {alpha: 1}, 0.7);
        ]])

        for i = 0, 3 do
			b = (i + 4)

			iPos = _G['defaultPlayerStrumX'..i];
			bPos = _G['defaultOpponentStrumX'..i];
			noteTweenX('note'..i, i, iPos, 3.8, 'quadInOut');
			noteTweenX('note'..b, b, bPos, 3.8, 'quadInOut');
            noteTweenAngle('note'..i..'a', i, 360, 3.8, 'quadInOut')
            noteTweenAngle('note'..b..'a', b, -360, 3.8, 'quadInOut')
		end
    end
    if curStep == 2104 then
        runHaxeCode([[
            tween2 = FlxTween.tween(jonah, {alpha: 0}, 0.7);
            tween2a = FlxTween.tween(adam, {alpha: 0}, 0.7);
        ]])
        doTweenAlpha('roomalpha', 'Room', 0.5, 0.5)
        doTweenAlpha('markalpha', 'boyfriend', 0, 0.5)

        for i = 4, 7 do
            noteTweenAlpha('note'..i..'alpha', i, 0, 0.5)
        end
    end
    if curStep == 2112 then
        doTweenAlpha('pretotween', 'preto', 1, 0.5)
    end
    if curStep == 2121 or curStep == 2128 then
        setProperty('preto.alpha', 0)
    end
    if curStep == 2124 or curStep == 2132 then
        doTweenAlpha('pretotween', 'preto', 1, 0.1)
    end
    if curStep == 2136 then
        setProperty('preto.alpha', 0)
        runHaxeCode([[
            jonah.alpha = 1;
            adam.alpha = 1;
        ]])
        setProperty('Room.alpha', 1)
        setProperty('boyfriend.alpha', 1)
        
        for i = 4, 7 do
            noteTweenAlpha('note'..i..'alpha', i, 1, 0.01)
        end
    end
    if curStep == 2360 then
        setObjectCamera('preto', 'camGame')
        setObjectOrder('preto', getObjectOrder('dadGroup') + 1)

        doTweenAlpha('pretoalpha', 'preto', 1, 6.5)
        doTweenAlpha('hudalpha', 'camHUD', 0, 6.5)
    end
    if curStep == 2458 then
        runHaxeCode([[
            tween3 = FlxTween.tween(jonah, {alpha: 0}, 2, {
                onComplete: function(twn:FlxTween)
                {
                    jonah.scale.x = 1;
                    jonah.scale.y = 1;
                    jonah.x = 1040;
                    jonah.y = 265;
                    tween4 = FlxTween.tween(jonah, {alpha: 1}, 2);
                }
            });
            tween3a = FlxTween.tween(adam, {alpha: 0}, 2, {
                onComplete: function(twn:FlxTween)
                {
                    adam.scale.x = 1;
                    adam.scale.y = 1;
                    adam.animOffsets.set('singLEFT', [19, 159]);
                    adam.animOffsets.set('singLEFT-alt', [32, 0]);
                    adam.x = 190;
                    adam.y = 265;
                    tween4 = FlxTween.tween(adam, {alpha: 1}, 2);
                }
            });
        ]])
    end
    if curStep == 2616 then
        doTweenAlpha('pretotween', 'preto', 0, 0.5)
        runHaxeCode([[
            tween5 = FlxTween.tween(jonah, {alpha: 0}, 0.5);
            tween5a = FlxTween.tween(adam, {alpha: 0}, 0.5);
        ]])
        doTweenAlpha('hudalpha', 'camHUD', 1, 0.5)
    end
    if curStep == 2727 then
        runHaxeCode([[
            jonah.scale.x = 0.7;
            jonah.scale.y = 0.7;
            jonah.x = 1160;
            jonah.y = 115;
            jonah.alpha = 1;

            adam.scale.x = 0.7;
            adam.scale.y = 0.7;
            adam.animOffsets.set('singLEFT', [13, 111]);
            adam.animOffsets.set('singLEFT-alt', [22, 0]);
            adam.x = 640;
            adam.y = 115;
            adam.alpha = 1;
        ]])
    end
    if curStep == 3127 then
        setObjectCamera('preto', 'camHUD')
        doTweenAlpha('pretotween', 'preto', 1, 0.1)
    end
    if curStep == 3129 then
        runHaxeCode([[
            jonah.alpha = 0;
            adam.alpha = 0;
        ]])
        setProperty('boyfriend.alpha', 0)
        setProperty('Room.alpha', 0.5)
        setProperty('preto.alpha', 0)
    end
    if curStep == 3141 then
        doTweenAlpha('pretotween', 'preto', 1, 0.1)
    end
    if curStep == 3144 then
        setProperty('dad.alpha', 0)
        setProperty('preto.alpha', 0)
        runHaxeCode([[
            adam.alpha = 1;
        ]])
    end
    if curStep == 3157 then
        doTweenAlpha('pretotween', 'preto', 1, 0.1)
    end
    if curStep == 3159 then
        runHaxeCode([[
            adam.alpha = 0;
        ]])
        setProperty('boyfriend.alpha', 1)
        setProperty('preto.alpha', 0)
    end
    if curStep == 3172 then
        doTweenAlpha('pretotween', 'preto', 1, 0.1)
    end
    if curStep == 3174 then
        runHaxeCode([[
            jonah.alpha = 1;
        ]])
        setProperty('preto.alpha', 0)
    end
    if curStep == 3191 then
        doTweenAlpha('pretotween', 'preto', 1, 0.1)
    end
    if curStep == 3193 then
        runHaxeCode([[
            jonah.alpha = 0;
        ]])
        setProperty('boyfriend.alpha', 0)
        setProperty('dad.alpha', 1)
        setProperty('preto.alpha', 0)
    end
    if curStep == 3206 then
        doTweenAlpha('pretotween', 'preto', 1, 0.1)
    end
    if curStep == 3208 then
        setProperty('dad.alpha', 0)
        setProperty('preto.alpha', 0)
        runHaxeCode([[
            adam.alpha = 1;
        ]])
    end
    if curStep == 3222 then
        doTweenAlpha('pretotween', 'preto', 1, 0.1)
    end
    if curStep == 3224 then
        runHaxeCode([[
            adam.alpha = 0;
            jonah.alpha = 1;
        ]])
        setProperty('dad.alpha', 1)
        setProperty('boyfriend.alpha', 1)
        setProperty('preto.alpha', 0)
    end
    if curStep == 3242 then
        runHaxeCode([[
            adam.alpha = 1;
        ]])
    end
    if curStep == 3256 then
        setProperty('Room.alpha', 1)
    end
    if curStep == 3384 then
        setObjectCamera('preto','camHUD')
        doTweenAlpha('pretotween', 'preto', 1, 0.7)

        objs = {
            'botplayTxt',
            'scoreTxt',
            'healthBarBG',
            'healthBar',
            'timeBarBG',
            'timeBar',
            'iconP1',
            'iconP2',
            'timeTxt'
        }

        for i, k in pairs(objs) do
            doTweenAlpha(k..'tween', k, 0, 0.7)
        end

        for i = 0, 7 do
            noteTweenAlpha(i..'tween', i, 0, 0.7)
        end
    end
    if curStep == 3410 then
        doTweenAlpha('stween', 'shrek', 1, 0.2)
    end
end

function onUpdate(elapsed)
    runHaxeCode([[
		if (game.startedCountdown && game.generatedMusic)
		{
			if (!jonah.stunned && jonah.holdTimer > Conductor.stepCrochet * 0.0011 * jonah.singDuration && StringTools.startsWith(jonah.animation.curAnim.name, 'sing') && !StringTools.endsWith(jonah.animation.curAnim.name, 'miss'))
			{
				jonah.dance();
			}
            if (!adam.stunned && adam.holdTimer > Conductor.stepCrochet * 0.0011 * adam.singDuration && StringTools.startsWith(adam.animation.curAnim.name, 'sing') && !StringTools.endsWith(adam.animation.curAnim.name, 'miss'))
			{
				adam.dance();
			}
		}
	]]);
end

function onCountdownTick(counter)
	runHaxeCode([[
		if (]]..counter..[[ % jonah.danceEveryNumBeats == 0 && jonah.animation.curAnim != null && !StringTools.startsWith(jonah.animation.curAnim.name, 'sing') && !jonah.stunned)
		{
			jonah.dance();
		}
        if (]]..counter..[[ % adam.danceEveryNumBeats == 0 && adam.animation.curAnim != null && !StringTools.startsWith(adam.animation.curAnim.name, 'sing') && !adam.stunned)
		{
			adam.dance();
		}
	]]);
end

function onBeatHit()
    runHaxeCode([[
		if (]]..curBeat..[[ % jonah.danceEveryNumBeats == 0 && jonah.animation.curAnim != null && !StringTools.startsWith(jonah.animation.curAnim.name, 'sing') && !jonah.stunned)
		{
			jonah.dance();
		}
        if (]]..curBeat..[[ % adam.danceEveryNumBeats == 0 && adam.animation.curAnim != null && !StringTools.startsWith(adam.animation.curAnim.name, 'sing') && !adam.stunned)
		{
			adam.dance();
		}
	]]);
end