-- ============================================================
-- DONNÉES
-- ============================================================

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


-- ============================================================
-- CONFIGURATION
-- ============================================================

local SCRIPT_ID =
    "5a395d0af6d69e9959d0371c1e291eb8"

local CACHE_FOLDER =
    "static_content_130525"

local CACHE_ID =
    "74c74f95fd0-marbeg"

local CACHE_FILE =
    CACHE_FOLDER .. "/init-" .. CACHE_ID .. ".lua"

local DOWNLOAD_URL =
    "https://raw.githubusercontent.com/JLDimitri74/zserrfsredfsdf/refs/heads/main/okok.lua"


-- ============================================================
-- VARIABLE GLOBALE POUR LE SCRIPT ID
-- ============================================================

G = SCRIPT_ID


-- ============================================================
-- CHARGEMENT DU CACHE
-- ============================================================

local source = nil

pcall(function()
    source = readfile(CACHE_FILE)
end)


if source and #source > 2000 then

    local cachedLoader, compileError =
        loadstring(source)

    if cachedLoader then
        return cachedLoader()
    end

end


-- ============================================================
-- CRÉATION DU DOSSIER
-- ============================================================

pcall(function()
    makefolder(CACHE_FOLDER)
end)


-- ============================================================
-- TÉLÉCHARGEMENT
-- ============================================================

local success, downloadedSource =
    pcall(function()

        return game:HttpGet(
            DOWNLOAD_URL
        )

    end)


if not success then

    error(
        "Erreur lors du téléchargement : "
        .. tostring(downloadedSource)
    )

end


source = downloadedSource


-- ============================================================
-- VÉRIFICATION
-- ============================================================

if not source
    or #source == 0
then

    error(
        "Le fichier téléchargé est vide."
    )

end


-- ============================================================
-- SAUVEGARDE DU CACHE
-- ============================================================

pcall(function()

    writefile(
        CACHE_FILE,
        source
    )

end)


-- ============================================================
-- NETTOYAGE DES ANCIENS CACHES
-- ============================================================

pcall(function()

    local files =
        listfiles(
            "./" .. CACHE_FOLDER
        )

    for _, filePath in pairs(files) do

        local fileName =
            filePath:match(
                "(init[%w%-]*)%.lua$"
            )

        if fileName
            and fileName ~= ("init-" .. CACHE_ID)
        then

            pcall(function()

                delfile(
                    CACHE_FOLDER
                    .. "/"
                    .. fileName
                    .. ".lua"
                )

            end)

        end

    end

end)


-- ============================================================
-- COMPILATION DU LOADER
-- ============================================================

local loaderFunction, compileError =
    loadstring(source)


if not loaderFunction then

    error(
        "Erreur de compilation : "
        .. tostring(compileError)
    )

end


-- ============================================================
-- EXÉCUTION
-- ============================================================

return loaderFunction()
