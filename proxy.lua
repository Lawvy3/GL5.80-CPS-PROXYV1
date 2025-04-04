function on_sendpacket(type, packet)
inputt = "action|input\n|text|"

function command(str)
    if packet:find(inputt .. str) then
        LogToConsole("`6" .. str)
        return true
    end
end

function log(str)
LogToConsole("[`2Law`3Proxy`0] `9"..str)
end

if command("/command") or command("/help") then
growtopia.sendDialog("add_label_with_icon|big|`2Lawvy`3Proxy|left|242|\nembed_data|x|100\nembed_data|y|100/3\nadd_spacer|small|\nadd_label_with_icon|small|`2/reme|left|758|\nadd_textbox|`9Turn on/off reme roulette|left|\nadd_quick_exit")
return true
end

end
AddHook (on_sendpacket, "OnSendPacket")
AddHook (variantlist, "OnVariant")
