local QBCore = exports['qb-core']:GetCoreObject()
Main = {}


RegisterNetEvent('bbv-drone:openmenu',function()
    if Config.Settings.Menu == "OX" then 
        exports['ox_lib']:registerContext({
            id = 'Rockstar Editor',
            title = 'Rockstar Editor',
            menu = 'Rockstar Editor',
            options = {
              {
                title = Lang.buttonRecord,
                event = 'Main:Record()',
              },
              {
                title = Lang.buttonSaveClip,
                event = 'Main:Save()',
              },
              {
                title = Lang.buttonDelClip,
                event = 'Main:Stop()',
              },
              {
                title = Lang.buttonEditor,
                event = 'Main:Editor()',
              },
            }
          })
         
          exports['ox_lib']:showContext('Rockstar Editor')
    end
    if Config.Settings.Menu == "QB" then 
        exports['qb-menu']:openMenu({
            {
                header = "Rockstar Editor",
                isMenuHeader = true, -- Set to true to make a nonclickable title
            },
            {
                header = Lang.buttonRecord,
                params = {
                    event = 'Main:Record()',
                }
            },
            {
                header = Lang.buttonSaveClip,
                params = {
                    event = 'Main:Save()',
                }
            },
            {
                header = Lang.buttonDelClip,
                params = {
                    event = 'Main:Stop()',
                }
            },
            {
                header = Lang.buttonEditor,
                params = {
                    event = 'Main:Editor()',
                }
            },
        })
    end
end)

RegisterNetEvent('Main:Record()',function()
    StartRecording(1) 
    Main:Notify(Lang.record)
end)

RegisterNetEvent('Main:Stop()',function()
    StartRecording(0) 
    StopRecordingAndSaveClip() 
    Main:Notify(Lang.saveclip)
end)

RegisterNetEvent('Main:Save()',function()
    StopRecordingAndDiscardClip() 
    Main:Notify(Lang.delclip)
end)

RegisterNetEvent('Main:Editor()',function()
    Main:Notify(Lang.editor)
    NetworkSessionLeaveSinglePlayer()
    ActivateRockstarEditor() 
end)

function Main:Notify(txt)
    QBCore.Functions.Main:Notify(txt, 'inform', 3000)
end