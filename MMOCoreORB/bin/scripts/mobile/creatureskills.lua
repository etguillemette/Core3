--This is the Skill trees for NPC's
--to modify this for hybrids you can create a name for your hybrid tree and insert it at the bottom of the list
--in the Server Administrator NPC Skill section
-- command usage inside npc templates is attacks = merge(skilltreename1,skilltreename2,ect,ect)

--creature level 1 to 10
brawlernovice = { {"melee1hlunge1",""},{"melee2hlunge1",""},{"polearmlunge1",""},{"unarmedlunge1",""} }
marksmannovice = { {"overchargeshot1",""},{"pointblanksingle1",""},{"pointblankarea1",""} }

--creature level 11 to 15
brawlermid = { {"melee1hlunge1",""},{"melee1hhit1",""},{"melee1hbodyhit1",""},{"melee2hlunge1",""},{"melee2hhit1",""},{"melee2hheadhit1",""},{"polearmlunge1",""},{"polearmhit1",""},{"polearmleghit1",""},{"unarmedlunge1",""},{"unarmedhit1",""},{"unarmedstun1",""} }
marksmanmid = { {"overchargeshot1",""},{"pointblanksingle1",""},{"pointblankarea1",""},{"headshot1",""},{"bodyshot1",""},{"legshot1",""},{"fullautosingle1",""},{"diveshot",""},{"kipupshot",""},{"rollshot",""} }

--creature level 16 to 20
marksmanmaster = { {"overchargeshot2",""},{"pointblanksingle1",""},{"pointblankarea1",""},{"diveshot",""},{"kipupshot",""},{"rollshot",""},{"bodyshot2",""},{"healthshot1",""},{"legshot2",""},{"fullautosingle1",""},{"actionshot1",""},{"headshot2",""},{"mindshot1",""},{"warningshot",""},{"suppressionfire1",""} }
brawlermaster = { {"unarmedlunge2",""},{"unarmedhit1",""},{"unarmedstun1",""},{"unarmedblind1",""},{"unarmedspinattack1",""},{"melee1hspinattack1",""},{"melee1hlunge2",""},{"melee1hdizzyhit1",""},{"melee1hhit1",""},{"melee1hbodyhit1",""},{"melee2hhit1",""},{"melee2hlunge2",""},{"melee2hheadhit1",""},{"melee2hsweep1",""},{"melee2hspinattack1",""},{"polearmlunge2",""},{"polearmhit1",""},{"polearmleghit1",""},{"polearmstun1",""},{"polearmspinattack1",""} }

--creature level 21 to 25 use base profession master with these depending on weapons in thier weapons groups
bountyhunternovice = { {"firelightningsingle1",""},{"bleedingshot",""},{"underhandshot",""} }
commandonovice = { {"flamesingle1",""},{"fireacidsingle1",""} }
carbineernovice = { {"actionshot2",""},{"fullautosingle2",""},{"fullautoarea1",""},{"scattershot1",""},{"legshot3",""},{"burstshot1",""} }
pistoleernovice = { {"healthshot2",""},{"pointblanksingle2",""},{"pistolmeleedefense1",""},{"disarmingshot1",""} }
riflemannovice = { {"strafeshot1",""},{"mindshot2",""},{"flushingshot1",""},{"flurryshot1",""} }
fencernovice = { {"melee1hhit2",""},{"melee1hscatterhit1",""},{"melee1hhealthhit1",""},{"melee1hbodyhit2",""},{"melee1hblindhit1",""} }
swordsmannovice = { {"melee2hhit2",""},{"melee2harea1",""},{"melee2hheadhit2",""},{"melee2hspinattack2",""},{"melee2hmindhit1",""} }
pikemannovice = { {"polearmactionhit1",""},{"polearmhit2",""},{"polearmleghit2",""},{"polearmstun2",""},{"polearmsweep1",""} }
tkanovice = { {"unarmedhit2",""},{"unarmedbodyhit1",""},{"unarmeddizzy1",""},{"unarmedknockdown1",""} }

--creature level 26 to 30 use base profession master with these depending on weapons in their weapons groups
bountyhuntermid = { {"firelightningcone1",""},{"firelightningsingle1",""},{"bleedingshot",""},{"underhandshot",""},{"eyeshot",""},{"knockdownfire",""} }
commandomid = { {"flamecone1",""},{"flamesingle1",""},{"fireacidcone1",""},{"fireacidsingle1",""} }
carbineermid = { {"actionshot2",""},{"fullautosingle2",""},{"fullautoarea2",""},{"scattershot2",""},{"legshot3",""},{"burstshot2",""},{"wildshot1",""},{"chargeshot1",""},{"cripplingshot",""} }
pistoleermid = { {"bodyshot3",""},{"healthshot2",""},{"pointblanksingle2",""},{"pistolmeleedefense2",""},{"disarmingshot1",""},{"doubletap",""},{"stoppingshot",""} }
riflemanmid = { {"headshot3",""},{"strafeshot1",""},{"mindshot2",""},{"flushingshot2",""},{"flurryshot2",""},{"startleshot1",""} }
fencermid = { {"melee1hhit2",""},{"melee1hscatterhit1",""},{"melee1hhealthhit1",""},{"melee1hbodyhit3",""},{"melee1hblindhit2",""},{"melee1hdizzyhit2",""},{"melee1hspinattack2",""} }
swordsmanmid = { {"melee2hhit2",""},{"melee2harea2",""},{"melee2hheadhit3",""},{"melee2hspinattack2",""},{"melee2hmindhit2",""},{"melee2hsweep2",""} }
pikemanmid = { {"polearmactionhit2",""},{"polearmhit2",""},{"polearmleghit3",""},{"polearmstun2",""},{"polearmsweep2",""},{"polearmarea1",""},{"polearmspinattack2",""} }
tkamid = { {"unarmedhit2",""},{"unarmedbodyhit1",""},{"unarmeddizzy1",""},{"unarmedknockdown1",""},{"unarmedleghit1",""},{"unarmedcombo1",""},{"unarmedspinattack2",""} }

--creature level 31 and above use combinations of base profesion mastery and these
bountyhuntermaster = { {"firelightningcone1",""},{"firelightningcone2",""},{"firelightningsingle1",""},{"firelightningsingle2",""},{"bleedingshot",""},{"underhandshot",""},{"eyeshot",""},{"knockdownfire",""},{"torsoshot",""},{"confusionshot",""},{"fastblast",""},{"sprayshot",""} }
commandomaster = { {"flamecone1",""},{"flamecone2",""},{"flamesingle1",""},{"flamesingle2",""},{"fireacidcone1",""},{"fireacidcone2",""},{"fireacidsingle1",""},{"fireacidsingle2",""} }
carbineermaster = { {"actionshot2",""},{"fullautosingle2",""},{"fullautoarea2",""},{"wildshot2",""},{"scattershot2",""},{"legshot3",""},{"cripplingshot",""},{"burstshot2",""},{"suppressionfire2",""},{"chargeshot2",""} }
pistoleermaster = { {"healthshot2",""},{"pointblanksingle2",""},{"bodyshot3",""},{"pistolmeleedefense2",""},{"disarmingshot2",""},{"doubletap",""},{"stoppingshot",""},{"fanshot",""},{"pointblankarea2",""},{"multitargetpistolshot",""} }
riflemanmaster = { {"headshot3",""},{"strafeshot2",""},{"mindshot2",""},{"flushingshot2",""},{"startleshot2",""},{"flurryshot2",""} }
fencermaster = { {"melee1hhit3",""},{"melee1hscatterhit2",""},{"melee1hdizzyhit2",""},{"melee1hhealthhit2",""},{"melee1hspinattack2",""},{"melee1hbodyhit2",""},{"melee1hblindhit2",""} }
swordsmanmaster = { {"melee2hhit3",""},{"melee2harea3",""},{"melee2hspinattack2",""},{"melee2hsweep2",""},{"melee2hmindhit2",""},{"melee2hheadhit3",""} }
pikemanmaster = { {"polearmactionhit2",""},{"polearmarea2",""},{"polearmhit3",""},{"polearmleghit3",""},{"polearmspinattack2",""},{"polearmstun2",""},{"polearmsweep2",""} }
tkamaster = { {"unarmedhit3",""},{"unarmedleghit1",""},{"unarmedbodyhit1",""},{"unarmedheadhit1",""},{"unarmedspinattack2",""},{"unarmedcombo2",""},{"unarmedknockdown2",""},{"unarmeddizzy1",""} }

--npc jedi skills
lightsabermaster = { {"saber1hheadhit1",""},{"saber1hheadhit2",""},{"saber1hhit3",""},{"saber1hcombohit3",""},{"saber1hflurry",""},{"saber1hflurry2",""},{"saber2hbodyhit2",""},{"saber2hbodyhit3",""},{"saber2hfrenzy",""},{"saber2hhit3",""},{"saber2hphantom",""},{"saber2hsweep3",""},
				{"saberpolearmdervish",""},{"saberpolearmdervish2",""},{"saberpolearmhit3",""},{"saberpolearmleghit3",""},{"saberpolearmspinattack3",""},{"saberslash1",""},{"saberslash2",""},{"saberthrow2",""} }
forcepowermaster = { {"forcelightningsingle2",""},{"forcelightningcone2",""},{"mindblast2",""},{"forceknockdown2",""},{"forceweaken2",""},{"forcethrow2",""},{"forcechoke",""},{"forceintimidate2",""} }

-- npc force wielders use standard profession mastery with the addition of this command
forcewielder = { {"forcelightningsingle1",""},{"mindblast1",""},{"forceweaken1",""},{"forceknockdown1",""},{"forcelightningcone1",""},{"forceintimidate1",""} }
--Server Administrator NPC skill trees place below

--Ethan edit 5-18-24 (HIRELING) adding medic class:
medicnovice = {{"totalhealself",""},{"healallother2", ""},{"healallself2",""}}
medicmaster = {{"healdamagenpc",""}}

--Ethan edit 11-26-24 (HIRELING) adding tank class:
tanknovice = {{"taunt",""},{"warcry1",""},{"melee1hlunge1",""},{"melee2hlunge1",""},{"polearmlunge1",""},{"unarmedlunge1",""}}
tankmid = {{"taunt",""},{"warcry1",""},{"melee1hdizzyhit1",""},{"unarmedstun1",""},{"unarmedblind1",""},{"polearmstun1",""},{"melee2hsweep1",""},}
tankmaster = {{"taunt",""},{"warcry2",""},{"warcry2",""},{"melee1hdizzyhit1",""},{"melee1hspinattack1",""},{"melee2hsweep1",""},{"melee2hspinattack1",""},{"unarmedstun1",""},{"unarmedblind1",""},{"unarmedspinattack1",""},{"polearmstun1",""}}
ccnovice = {{"taunt",""},{"warcry2",""},{"warcry2",""},{"melee1hdizzyhit1",""},{"melee1hspinattack1",""},{"melee1hblindhit1",""},{"melee2hsweep1",""},{"melee2hspinattack1",""},{"unarmedstun1",""},{"unarmedblind1",""},{"unarmedspinattack1",""},{"unarmeddizzy1",""},{"unarmedknockdown1",""},{"polearmstun2",""},{"polearmsweep1",""}}
ccmid = {{"taunt",""},{"warcry2",""},{"warcry2",""},{"melee1hdizzyhit2",""},{"melee1hspinattack1",""},{"melee1hblindhit2",""},{"melee2hsweep2",""},{"melee2hspinattack1",""},{"unarmedstun1",""},{"unarmedblind1",""},{"unarmedspinattack1",""},{"unarmeddizzy1",""},{"unarmedknockdown1",""},{"polearmstun2",""},{"polearmsweep2",""}}
ccmaster = {{"taunt",""},{"warcry2",""},{"warcry2",""},{"melee1hdizzyhit2",""},{"melee1hspinattack1",""},{"melee1hblindhit2",""},{"melee2hsweep2",""},{"melee2hspinattack1",""},{"unarmedstun1",""},{"unarmedblind1",""},{"unarmedspinattack1",""},{"unarmeddizzy1",""},{"unarmedknockdown2",""},{"polearmstun2",""},{"polearmsweep2",""}}

--Ethan edit 12-12-24 (HIRELING) adding new base classes:
pistoleer01 = {{"overchargeshot1",""},{"pointblanksingle1",""},{"pointblankarea1",""},{"bodyshot1",""},{"diveshot",""},{"kipupshot",""},{"rollshot",""}}
pistoleer02 = {{"overchargeshot2",""},{"pointblanksingle1",""},{"pointblankarea1",""},{"diveshot",""},{"kipupshot",""},{"rollshot",""},{"bodyshot2",""},{"healthshot1",""},{"warningshot",""},{"suppressionfire1",""} }
pistoleer03 = {{"healthshot2",""},{"pointblanksingle2",""},{"pistolmeleedefense1",""},{"disarmingshot1",""}}
pistoleer04 = { {"bodyshot3",""},{"healthshot2",""},{"pointblanksingle2",""},{"pistolmeleedefense2",""},{"disarmingshot1",""},{"doubletap",""},{"stoppingshot",""} }
pistoleer05 = { {"healthshot2",""},{"pointblanksingle2",""},{"bodyshot3",""},{"pistolmeleedefense2",""},{"disarmingshot2",""},{"doubletap",""},{"stoppingshot",""},{"fanshot",""},{"pointblankarea2",""},{"multitargetpistolshot",""} }
carbineer01 = {{"overchargeshot1",""},{"pointblanksingle1",""},{"pointblankarea1",""},{"legshot1",""},{"fullautosingle1",""},{"diveshot",""},{"kipupshot",""},{"rollshot",""}}
carbineer02 = {{"overchargeshot2",""},{"pointblanksingle1",""},{"pointblankarea1",""},{"diveshot",""},{"kipupshot",""},{"rollshot",""},{"legshot2",""},{"fullautosingle1",""},{"actionshot1",""},{"warningshot",""},{"suppressionfire1",""} }
carbineer03 = { {"actionshot2",""},{"fullautosingle2",""},{"fullautoarea1",""},{"scattershot1",""},{"legshot3",""},{"burstshot1",""} }
carbineer04 = { {"actionshot2",""},{"fullautosingle2",""},{"fullautoarea2",""},{"scattershot2",""},{"legshot3",""},{"burstshot2",""},{"wildshot1",""},{"chargeshot1",""},{"cripplingshot",""} }
carbineer05 = { {"actionshot2",""},{"fullautosingle2",""},{"fullautoarea2",""},{"wildshot2",""},{"scattershot2",""},{"legshot3",""},{"cripplingshot",""},{"burstshot2",""},{"suppressionfire2",""},{"chargeshot2",""} }
rifleman01 = {{"overchargeshot1",""},{"pointblanksingle1",""},{"pointblankarea1",""},{"headshot1",""},{"diveshot",""},{"kipupshot",""},{"rollshot",""}}
rifleman02 = {{"overchargeshot2",""},{"pointblanksingle1",""},{"pointblankarea1",""},{"diveshot",""},{"kipupshot",""},{"rollshot",""},{"headshot2",""},{"mindshot1",""},{"warningshot",""},{"suppressionfire1",""} }
rifleman03 = { {"strafeshot1",""},{"mindshot2",""},{"flushingshot1",""},{"flurryshot1",""} }
rifleman04 = { {"headshot3",""},{"strafeshot1",""},{"mindshot2",""},{"flushingshot2",""},{"flurryshot2",""},{"startleshot1",""} }
rifleman05 = { {"headshot3",""},{"strafeshot2",""},{"mindshot2",""},{"flushingshot2",""},{"startleshot2",""},{"flurryshot2",""} }
fencer01 = {{"taunt",""},{"warcry1",""},{"melee1hlunge1",""},{"melee1hhit1",""},{"melee1hbodyhit1",""}}
fencer02 = {{"taunt",""},{"warcry1",""},{"melee1hspinattack1",""},{"melee1hlunge2",""},{"melee1hdizzyhit1",""},{"melee1hhit1",""},{"melee1hbodyhit1",""} }
fencer03 = { {"taunt",""},{"warcry2",""},{"melee1hhit2",""},{"melee1hscatterhit1",""},{"melee1hhealthhit1",""},{"melee1hbodyhit2",""},{"melee1hblindhit1",""} }
fencer04 = { {"taunt",""},{"warcry2",""},{"melee1hhit2",""},{"melee1hscatterhit1",""},{"melee1hhealthhit1",""},{"melee1hbodyhit3",""},{"melee1hblindhit2",""},{"melee1hdizzyhit2",""},{"melee1hspinattack2",""} }
fencer05 = { {"taunt",""},{"warcry2",""},{"melee1hhit3",""},{"melee1hscatterhit2",""},{"melee1hdizzyhit2",""},{"melee1hhealthhit2",""},{"melee1hspinattack2",""},{"melee1hbodyhit2",""},{"melee1hblindhit2",""} }
swordsman01 = {{"taunt",""},{"warcry1",""},{"melee2hlunge1",""},{"melee2hhit1",""},{"melee2hheadhit1",""}}
swordsman02 = {{"taunt",""},{"warcry1",""},{"melee2hhit1",""},{"melee2hlunge2",""},{"melee2hheadhit1",""},{"melee2hsweep1",""},{"melee2hspinattack1",""} }
swordsman03 = { {"taunt",""},{"warcry2",""},{"melee2hhit2",""},{"melee2harea1",""},{"melee2hheadhit2",""},{"melee2hspinattack2",""},{"melee2hmindhit1",""} }
swordsman04 = { {"taunt",""},{"warcry2",""},{"melee2hhit2",""},{"melee2harea2",""},{"melee2hheadhit3",""},{"melee2hspinattack2",""},{"melee2hmindhit2",""},{"melee2hsweep2",""} }
swordsman05 = { {"taunt",""},{"warcry2",""},{"melee2hhit3",""},{"melee2harea3",""},{"melee2hspinattack2",""},{"melee2hsweep2",""},{"melee2hmindhit2",""},{"melee2hheadhit3",""} }
pikeman01 = {{"taunt",""},{"warcry1",""},{"polearmlunge1",""},{"polearmhit1",""},{"polearmleghit1",""}}
pikeman02 = {{"taunt",""},{"warcry1",""},{"polearmlunge2",""},{"polearmhit1",""},{"polearmleghit1",""},{"polearmstun1",""},{"polearmspinattack1",""} }
pikeman03 = { {"taunt",""},{"warcry2",""},{"polearmactionhit1",""},{"polearmhit2",""},{"polearmleghit2",""},{"polearmstun2",""},{"polearmsweep1",""} }
pikeman04 = { {"taunt",""},{"warcry2",""},{"polearmactionhit2",""},{"polearmhit2",""},{"polearmleghit3",""},{"polearmstun2",""},{"polearmsweep2",""},{"polearmarea1",""},{"polearmspinattack2",""} }
pikeman05 = { {"taunt",""},{"warcry2",""},{"polearmactionhit2",""},{"polearmarea2",""},{"polearmhit3",""},{"polearmleghit3",""},{"polearmspinattack2",""},{"polearmstun2",""},{"polearmsweep2",""} }
teraskasi01 = {{"taunt",""},{"warcry1",""},{"unarmedlunge1",""},{"unarmedhit1",""},{"unarmedstun1",""}}
teraskasi02 = {{"taunt",""},{"warcry1",""},{"unarmedlunge2",""},{"unarmedhit1",""},{"unarmedstun1",""},{"unarmedblind1",""},{"unarmedspinattack1",""} }
teraskasi03 = { {"taunt",""},{"warcry2",""},{"unarmedhit2",""},{"unarmedbodyhit1",""},{"unarmeddizzy1",""},{"unarmedknockdown1",""} }
teraskasi04 = { {"taunt",""},{"warcry2",""},{"unarmedhit2",""},{"unarmedbodyhit1",""},{"unarmeddizzy1",""},{"unarmedknockdown1",""},{"unarmedleghit1",""},{"unarmedcombo1",""},{"unarmedspinattack2",""} }
teraskasi05 = { {"taunt",""},{"warcry2",""},{"unarmedhit3",""},{"unarmedleghit1",""},{"unarmedbodyhit1",""},{"unarmedheadhit1",""},{"unarmedspinattack2",""},{"unarmedcombo2",""},{"unarmedknockdown2",""},{"unarmeddizzy1",""} }
bountyhunter03 = { {"firelightningsingle1",""},{"bleedingshot",""},{"underhandshot",""} }
bountyhunter04 = { {"firelightningcone1",""},{"firelightningsingle1",""},{"bleedingshot",""},{"underhandshot",""},{"eyeshot",""},{"knockdownfire",""} }
bountyhunter05 = { {"headshot3",""},{"strafeshot2",""},{"mindshot2",""},{"flushingshot2",""},{"startleshot2",""},{"flurryshot2",""} }
commando03 = { {"flamesingle1",""},{"fireacidsingle1",""} }
commando04 = { {"flamecone1",""},{"flamesingle1",""},{"fireacidcone1",""},{"fireacidsingle1",""} }
commando05 = { {"firelightningcone1",""},{"firelightningcone2",""},{"firelightningsingle1",""},{"firelightningsingle2",""},{"bleedingshot",""},{"underhandshot",""},{"eyeshot",""},{"knockdownfire",""},{"torsoshot",""},{"confusionshot",""},{"fastblast",""},{"sprayshot",""} }

--Ethan edit 12-19-24 (HIRELING) Adding squad leader abilities
squadleadernovice = {{"rally",""},{"steadyaim",""},}
squadleadermid = {{"rally",""},{"steadyaim",""},{"volleyfire",""}}
squadleadermaster = {{"rally",""},{"steadyaim",""},{"volleyfire",""},{"boostmorale",""}}