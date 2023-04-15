
--fazer a hud sumir e camera tbm

function onCreatePost()
    setObjectCamera('banana', 'camHUD')
    addLuaSprite('banana', true)
    setProperty('banana.alpha', 0)
    setProperty('camGame.alpha', 0) 
    doTweenAlpha('camHUD.alpha', 0)
    doTweenAlpha('camHUD.alpha',0)
    setProperty('camHUD.alpha',0)
end
 
function onSongStart()
    doTweenAlpha('batata', 'camGame',1,4)
    doTweenAlpha('banana2', 'banana', 1, 1)
    doTweenZoom('preto', 'camGame', 0.76,5)
    doTweenAlpha('branco', 'camHUD', 1,5)
end

function onCreate()
    setProperty("defaultCamZoom",0.75) 
end

function onTweenCompleted(tag)
    if tag == 'preto' then
        setProperty("defaultCamZoom",0.76) 
    end
    
end


