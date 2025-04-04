-- VARIABLE SECTION=================
TitleHelp = "add_label_with_icon|big|`2Proxy Commands|left|1790|"

Pembatas = "\nadd_smalltext|======================================================================================|left|"

infoTitle = "\nadd_label_with_icon|small|`2Info:|left|660|"

mainFTitle = "\nadd_label_with_icon|small|`2Main Features:|left|12264|"

-- FUNCTION SECTION================
function on_sendpacket(type, packet)
inputt = "action|input\n|text|"

function command(str)
    if packet:find(inputt .. str) then
        LogToConsole("`6" .. str)
        return true
    end
end

function log(str)
LogToConsole("`0[`2Law`3Proxy`0] `9"..str)
end

function checkitm(id)
for _, inv in pairs(GetInventory()) do 
if inv.id == id then 
return inv.amount 
end 
end 
return 0 
end

function wear(id)
pkt = {}
pkt.type = 10
pkt.value = id
SendPacketRaw(false, pkt)
end


-- COMMAND SECTION =================


-- /HELP
if command("/command") or command("/help") or command("/proxy") then
growtopia.sendDialog(TitleHelp.."\nadd_spacer|small|"..Pembatas.."\nadd_spacer|small|"..infoTitle.."\nadd_smalltext|`2/help `9(Show All Proxy Commands/This Page)|left|\nadd_smalltext|`2/proxy `9(Show All Proxy Commands/This Page)|left|\nadd_smalltext|`2/command `9(Show All Proxy Commands/This Page)|left|\nadd_spacer|small|"..mainFTitle.."\nadd_smalltext|`2/bfg (on/off) `9(Turn On/Off Bfg & Auto Farm Mode Cps)|\nadd_smalltext|`2/wd (amount) `9(Drop World Locks With lSpesific Amount)|\nadd_smalltext|`2/dd (amount) `9(Drop Diamond Locks With Spesific Amount)|\nadd_smalltext|`2/bd (amount) `9(Drop Blue Gem Locks With Spesific Amount)|\nadd_smalltext|`2/bal `9(Show All Your WL, DL, BGL Amount)|\nadd_smalltext|`2/balance `9(Show All Your WL, DL, BGL Amount)|\nadd_smalltext|`2/spin `9(Roulette Spin Settings Page)|\nadd_smalltext|`2/moderator (on/off) `9(Trough The Wall And Invisible, But Its Just Visual)|\nadd_smalltext|`2/fast (pull/kick/ban)`9(Auto Pull/Kick/Ban When Wrench To Other Player)|\nadd_quick_exit")
return true
end


-- BFG
nyala = command("/bfg on") or command("/Bfg on") or command("/bfg On") or command ("/Bfg On")

mati = command("/bfg off") or command("/Bfg off") or command("/bfg Off") or command ("/Bfg Off")

if nyala then
SendPacket(2, "action|dialog_return\ndialog_name|cheats\ncheck_autofarm|1\ncheck_bfg|1")
log("Bfg & AutoFarm `2On")
return true
end

if mati then
SendPacket(2, "action|dialog_return\ndialog_name|cheats\ncheck_autofarm|0\ncheck_bfg|0")
log("Bfg & AutoFarm `4Off")
return true
end

if command("/bfg") then
log("Select mode `2on`9/`4off`9, Example /bfg on")
return true
end


-- Drop

 local dlockID = 1796
if command("/dd") then
 txt = packet:gsub("action|input\n|text|/dd", "")
if txt == "" then
log("`2Write Amount")
else
dl = math.floor(txt) 
if checkitm(1796) < dl then
wear(7188)
end
SendPacket(2, "action|drop\n|itemID|"..dlockID)
SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|"..dlockID.."\nitem_count|"..txt)
log("`2Succes Drop`0"..txt.." `2Diamond Lock")
end
return true
end    

local ITEM_ID = 242
if command("/wd") then
txt = packet:gsub("action|input\n|text|/wd", "")
if txt == "" then
log("`2Write Amount")
else
wl = math.floor(txt) 
if checkitm(242) < wl then
wear(1796) 
end
SendPacket(2, "action|drop\n|itemID|"..ITEM_ID)
SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|"..ITEM_ID.."\nitem_count|"..txt)
log("`2Succes Drop`0"..txt.." `2World Lock")
end
return true
end


local ITEM_ID2 = 7188
if command("/bd") then
txt = packet:gsub("action|input\n|text|/bd", "")
if txt == "" then
log("`2Write Amount")
else
SendPacket(2, "action|drop\n|itemID|"..ITEM_ID2)
SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|"..ITEM_ID2.."\nitem_count|"..txt)
log("`2Succes Drop`0"..txt.." `2Blue Gem Lock")
end
return true
end

if command("/balance") or command("/bal") then
function checkamount(id)
for _, inv in pairs(GetInventory()) do
if inv.id == id then
return inv.amount
end
end
return 0
end
log("`0Your World Locks`0 : "..checkamount(242).." `9World Lock`0, "..checkamount(1796).." `cDiamond Lock`0, "..checkamount(7188).." `qBGL")
return true
end



end
-- VARIANT SECTION===============
function variantlist(var)    
        
-- DROP
        if var.v1 == "OnDialogRequest" then
        if var.v2:find("drop") and var.v2:find("242") then
        return true
        end
        end

        if var.v1 == "OnDialogRequest" then
        if var.v2:find("drop") and var.v2:find("1796") then
        return true
        end
        end

        if var.v1 == "OnDialogRequest" then
        if var.v2:find("drop") and var.v2:find("7188") then
        return true
        end
        end


-- REME
end
AddHook (on_sendpacket, "OnSendPacket")
AddHook (variantlist, "OnVariant")