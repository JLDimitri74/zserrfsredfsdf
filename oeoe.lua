local a
local b

getfenv()["This is the key check library used by Luarmor, documentation can be viewed at https://docs.luarmor.net/luarmor-user-manual-and-f.a.q#key-check-library"]

do
    local function c(d)
        return d % 4294967296
    end

    local function e(f, g)
        local h, i = 0, 1

        while f > 0 or g > 0 do
            local j = f % 2
            local k = g % 2

            if j ~= k then
                h = h + i
            end

            f = math.floor(f / 2)
            g = math.floor(g / 2)
            i = i * 2
        end

        return h
    end

    local function l(d, m)
        return c(d * 2 ^ m)
    end

    local function n(d, m)
        return math.floor(d / 2 ^ m) % 4294967296
    end

    function a(o)
        local p = {
            [1] = 0x5ad69b68,
            [2] = 0x03b7222a,
            [3] = 0x2d074df6,
            [4] = 0xcb4fff2d
        }

        local q = {
            [1] = 0x01c3,
            [2] = 0xa408,
            [3] = 0x964d,
            [4] = 0x4320
        }

        local r = #o
        local s = 1

        while s <= r do
            local t = 0

            for u = 0, 3 do
                local v = s - 1 + u

                if v < r then
                    local w = o:byte(v + 1)
                    t = t + w * 2 ^ (8 * u)
                end
            end

            t = c(t)

            for x = 1, 4 do
                local y = e(p[x], t)
                local z = p[x % 4 + 1]

                y = e(y, z)
                y = c(l(y, 5) + n(y, 2) + q[x])

                local A = (x - 1) * 5 % 32
                local B = n(t, A)

                y = e(y, B)
                y = c(y)

                local C = p[(x + 1) % 4 + 1]

                y = c(y + C)
                p[x] = c(y)
            end

            s = s + 4
        end

        for x = 1, 4 do
            local y = p[x]
            local D = p[x % 4 + 1]
            local E = p[(x + 2) % 4 + 1]

            y = c(y + D)
            y = e(y, E)

            local A = x * 7 % 32

            y = c(l(y, A) + n(y, 32 - A))
            p[x] = y
        end

        local F = {}

        for x = 1, 4 do
            F[x] = string.format("%08X", p[x])
        end

        return table.concat(F)
    end
end


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

local folder = "static_content_130525"
local id = "74c74f95fd0-marbeg"
local G = "5a395d0af6d69e9959d0371c1e291eb8"
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
