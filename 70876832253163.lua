local allowedPlace = game.PlaceId == 70876832253163

if allowedPlace then
    local p=game:GetService("Players").LocalPlayer
    local v=game:GetService("VirtualInputManager")
    
    while true do
        task.wait(1)
        local g=p:FindFirstChild("PlayerGui")
        if not g then continue end
    
        for _,b in pairs(g:GetDescendants()) do
            if b:IsA("TextButton") then
                local t=(b.Text or ""):lower()
                if t:find("play again") and b.Visible and b.AbsoluteSize.X>0 then
                    local pos=b.AbsolutePosition+Vector2.new(b.AbsoluteSize.X/2,b.AbsoluteSize.Y)
                    v:SendMouseButtonEvent(pos.X,pos.Y,0,true,game,0)
                    v:SendMouseButtonEvent(pos.X,pos.Y,0,false,game,0)
                    task.wait(5)
                end
            end
        end
    end
    
    local p=game:GetService("Players").LocalPlayer
    local r=game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Universe"):WaitForChild("Network"):WaitForChild("RemoteEvent"):WaitForChild("Actionable")
    
    local START,END=1200,2100
    local TIME=180
    local ON=true
    
    task.spawn(function()
        local t=tick()
        while ON do
            if tick()-t>=TIME then
                ON=false
                local c=p.Character
                if c then c:BreakJoints() end
                break
            end
            for i=START,END do
                if not ON then break end
                r:FireServer(i)
                task.wait(0.02)
            end
            task.wait(0.2)
        end
    end)
end
