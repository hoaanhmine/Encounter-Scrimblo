function onCreatePost()
	for ballsack=0,getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes',ballsack,'noteType')=='Note_Adam_com_retardo' then
			setPropertyFromGroup('unspawnNotes',ballsack,'texture','transparentNote')
			setPropertyFromGroup('unspawnNotes',ballsack,'noAnimation',true)
			setPropertyFromGroup('unspawnNotes',ballsack,'ignoreNote',true)
			if getPropertyFromGroup('unspawnNotes',ballsack,'mustPress')==true then
				setPropertyFromGroup('unspawnNotes',ballsack,'noteType','bgSinger_BF')
				setPropertyFromGroup('unspawnNotes',ballsack,'mustPress',false)
			end
		end
	end
end

function onUpdatePost(elapsed)
	for sack=0,getProperty('notes.length')-1 do
		if getPropertyFromGroup('notes',ballsack,'noteType')=='bgSinger_BF' then
			local noteData=getPropertyFromGroup('notes',ballsack,'noteData')
			local offx=getPropertyFromGroup('strumLineNotes',noteData+4,'x')-getPropertyFromGroup('strumLineNotes',noteData,'x')
			setPropertyFromGroup('notes',ballsack,'offsetX',offx)
		end
	end
	
	for nuts=0,getProperty('notes.length')-1 do
		if getPropertyFromGroup('notes',nuts,'noteType')=='Note_Adam_com_retardo' then
			local y=getPropertyFromGroup('notes',nuts,'y')
			local noteData=getPropertyFromGroup('notes',nuts,'noteData')
			local strumTime=getPropertyFromGroup('notes',nuts,'strumTime')
			if (strumTime-getSongPosition())/getProperty('songSpeed')<1 and getPropertyFromGroup('notes',nuts,'active') and getPropertyFromGroup('notes',nuts,'visible') then
				setPropertyFromGroup('notes',nuts,'visible',false)
				local mustHitChar=false
				if getPropertyFromGroup('notes',nuts,'noteType')=='bgSinger_BF' then mustHitChar=true end
				runHaxeCode([[
				adam.playAnim(game.singAnimations[]]..noteData..[[], true);
				adam.idleSuffix = "";
				game.vocals.volume = 1;
				]]);
			end
		end
	end
end