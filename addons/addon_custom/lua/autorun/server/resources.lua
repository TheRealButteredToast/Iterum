RunConsoleCommand ("sv_tfa_jamming", "0")

if (SERVER) then

-- Internals --
AddCSLuaFile()

--Workshop--

--resource.AddWorkshop( "" )

resource.AddWorkshop( "754733932" )
resource.AddWorkshop( "1193261440" )
resource.AddWorkshop( "753972615" )
resource.AddWorkshop( "1304380255" )
resource.AddWorkshop( "831680603" )
resource.AddWorkshop( "771487490" )
resource.AddWorkshop( "1111662477" )
resource.AddWorkshop( "1542213432" )
resource.AddWorkshop( "927796059" )
resource.AddWorkshop( "1094499103" )
resource.AddWorkshop( "1547937047" )
resource.AddWorkshop( "1567705816" )
resource.AddWorkshop( "1579080972" )
resource.AddWorkshop( "434936477" )
resource.AddWorkshop( "1525218777" )
resource.AddWorkshop( "1802976822" )
resource.AddWorkshop( "974309392" )
resource.AddWorkshop( "1550978639" )
resource.AddWorkshop( "193207853" )
resource.AddWorkshop("2048232886")
resource.AddWorkshop("1306354792")
resource.AddWorkshop("1980598244")
resource.AddWorkshop("2055812099")
resource.AddWorkshop("104691717")
resource.AddWorkshop("842148457")
resource.AddWorkshop("803155029")
resource.AddWorkshop("803151001")
resource.AddWorkshop("380548098")
resource.AddWorkshop("842630939")
resource.AddWorkshop("1832181569")
resource.AddWorkshop("1810305449")
resource.AddWorkshop("1810304039")
resource.AddWorkshop("1810303016")
resource.AddWorkshop("1810299061")
resource.AddWorkshop("104607228")
resource.AddWorkshop("845272611")
resource.AddWorkshop("850119900")
resource.AddWorkshop("2492829531")
resource.AddWorkshop("104990330")
resource.AddWorkshop("948151094")
resource.AddWorkshop("1518144327")
resource.AddWorkshop("1496635500")
resource.AddWorkshop("2247371890")
----------------
--Materials--
----------------
resource.AddFile( "materials/skybox/iterumbk.vmt" )
resource.AddFile( "materials/skybox/iterumdn.vmt" )
resource.AddFile( "materials/skybox/iterumft.vmt" )
resource.AddFile( "materials/skybox/iterumlf.vmt" )
resource.AddFile( "materials/skybox/iterumrt.vmt" )
resource.AddFile( "materials/skybox/iterumup.vmt" )
resource.AddFile( "materials/skybox/iterumbk.vtf" )
resource.AddFile( "materials/skybox/iterumdn.vtf" )
resource.AddFile( "materials/skybox/iterumft.vtf" )
resource.AddFile( "materials/skybox/iterumlf.vtf" )
resource.AddFile( "materials/skybox/iterumrt.vtf" )
resource.AddFile( "materials/skybox/iterumup.vtf" )

resource.AddFile( "materials/skybox/iterumhdrbk.vmt" )
resource.AddFile( "materials/skybox/iterumhdrdn.vmt" )
resource.AddFile( "materials/skybox/iterumhdrft.vmt" )
resource.AddFile( "materials/skybox/iterumhdrlf.vmt" )
resource.AddFile( "materials/skybox/iterumhdrrt.vmt" )
resource.AddFile( "materials/skybox/iterumhdrup.vmt" )

resource.AddFile("materials/gasmask_fnl.vmt")
resource.AddFile("materials/gaskmask3.vtf")
resource.AddFile("materials/gastmask3_n.vtf")
resource.AddFile("materials/shtr.vtf")
resource.AddFile("materials/shtr_01.vmt")
resource.AddFile("materials/shtr_n.vtf")

resource.AddFile("sound/gasmaskoff.wav")
resource.AddFile("sound/gasmaskon.wav")
resource.AddFile("sound/gmsk_in.wav")
resource.AddFile("sound/gmsk_out.wav")

----------------
--HUD--
----------------
--[[
resource.AddFile( "materials/ODSTHud/compass.vmt" )
resource.AddFile( "materials/ODSTHud/compass.vtf" )
resource.AddFile( "materials/ODSTHud/compass1.vmt" )
resource.AddFile( "materials/ODSTHud/compass2.vtf" )
resource.AddFile( "materials/ODSTHud/objective.vmt" )
resource.AddFile( "materials/ODSTHud/objective.vtf" )
resource.AddFile( "materials/ODSTHud/objective2-1.vmt" )
resource.AddFile( "materials/ODSTHud/objective2-1.vtf" )
resource.AddFile( "materials/ODSTHud/objective1.vmt" )
resource.AddFile( "materials/ODSTHud/objective1.vtf" )
resource.AddFile( "materials/ODSTHud/objective2.vmt" )
resource.AddFile( "materials/ODSTHud/objective2.vtf" )
resource.AddFile( "materials/ODSTHud/objectiveoutline1.vmt" )
resource.AddFile( "materials/ODSTHud/objectiveoutline1.vtf" )
resource.AddFile( "materials/ODSTHud/bottom.png" )
resource.AddFile( "materials/ODSTHud/bottom back.png" )
resource.AddFile( "materials/ODSTHud/hp fill.png" )
resource.AddFile( "materials/ODSTHud/hp.png" )
resource.AddFile( "materials/ODSTHud/top back.png" )
resource.AddFile( "materials/ODSTHud/top front.png" )
resource.AddFile( "materials/ODSTHud/top.png" )--]]

----------------
--Map--
----------------
resource.AddFile( "maps/rp_iterum_a3.bsp" )
end