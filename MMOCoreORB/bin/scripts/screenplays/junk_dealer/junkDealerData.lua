junkWareType = {
	armor = 1,
	weapon = 2,
	uniform = 3,
	furniture = 4,
	container = 5,
	terminal = 6,
	installation = 7,
	hireling = 8,
	schematic = 9,
}

genericJunkData = {

    junkWeapon = {
        --Pistoleer Weapons
        { template = "object/weapon/ranged/pistol/pistol_d18.iff", cost = 5000, displayName = "@weapon_name:pistol_d18" },
        { template = "object/weapon/ranged/pistol/pistol_dl44.iff", cost = 7500, displayName = "@weapon_name:pistol_dl44" },
        { template = "object/weapon/ranged/pistol/pistol_dl44_metal.iff", cost = 7500, displayName = "@weapon_name:pistol_dl44_metal" },
        { template = "object/weapon/ranged/pistol/pistol_scout_blaster.iff", cost = 10000, displayName = "@weapon_name:pistol_scout_blaster" },
        { template = "object/weapon/ranged/pistol/pistol_dh17.iff", cost = 10000, displayName = "@weapon_name:pistol_dh17" },
        { template = "object/weapon/ranged/pistol/pistol_striker.iff", cost = 15000, displayName = "@weapon_name:pistol_striker" },
        { template = "object/weapon/ranged/pistol/pistol_power5.iff", cost = 15000, displayName = "@weapon_name:pistol_power5" },
        { template = "object/weapon/ranged/pistol/pistol_srcombat.iff", cost = 20000, displayName = "@weapon_name:pistol_srcombat" },
        { template = "object/weapon/ranged/pistol/pistol_tangle.iff", cost = 20000, displayName = "@weapon_name:pistol_tangle" },
        { template = "object/weapon/ranged/pistol/pistol_fwg5.iff", cost = 20000, displayName = "@weapon_name:pistol_fwg5"},
        { template = "object/weapon/ranged/pistol/pistol_dx2.iff", cost = 100000, displayName = "@weapon_name:pistol_dx2"},
        { template = "object/weapon/ranged/pistol/pistol_republic_blaster.iff", cost = 100000, displayName = "@weapon_name:pistol_republic_blaster"},
        --{ template = "object/weapon/ranged/pistol/pistol_de_10.iff", cost = 1000000, displayName = "@weapon_name:pistol_de_10"},

        --Rifleman Weapons
        { template = "object/weapon/ranged/rifle/rifle_dlt20.iff", cost = 5000, displayName = "@weapon_name:rifle_dlt20"},
        { template = "object/weapon/ranged/rifle/rifle_dlt20a.iff", cost = 7500, displayName = "@weapon_name:rifle_dlt20a"},
        { template = "object/weapon/ranged/rifle/rifle_tusken.iff", cost = 7500, displayName = "@weapon_name:rifle_tusken"},
        { template = "object/weapon/ranged/rifle/rifle_sg82.iff", cost = 10000, displayName = "@weapon_name:rifle_sg82"},
        { template = "object/weapon/ranged/rifle/rifle_laser.iff", cost = 10000, displayName = "@weapon_name:rifle_laser"},
        { template = "object/weapon/ranged/rifle/rifle_spraystick.iff", cost = 15000, displayName = "@weapon_name:rifle_spraystick"},
        { template = "object/weapon/ranged/rifle/rifle_jawa_ion.iff", cost = 15000, displayName = "@weapon_name:rifle_jawa_ion"},
        { template = "object/weapon/ranged/rifle/rifle_e11.iff", cost = 20000, displayName = "@weapon_name:rifle_e11"},
        { template = "object/weapon/ranged/rifle/rifle_t21.iff", cost = 100000, displayName = "@weapon_name:rifle_t21"},
        { template = "object/weapon/ranged/rifle/rifle_bowcaster.iff", cost = 100000, displayName = "@weapon_name:rifle_bowcaster"},
        --{ template = "object/weapon/ranged/rifle/rifle_berserker.iff", cost = 1000000, displayName = "@weapon_name:rifle_berserker"},


        --Carbineer Weapons
        { template = "object/weapon/ranged/carbine/carbine_dh17.iff", cost = 5000, displayName = "@weapon_name:carbine_dh17"},
        { template = "object/weapon/ranged/carbine/carbine_dh17_snubnose.iff", cost = 7500, displayName = "@weapon_name:carbine_dh17_snubnose"},
        { template = "object/weapon/ranged/carbine/carbine_e11.iff", cost = 10000, displayName = "@weapon_name:carbine_e11"},
        { template = "object/weapon/ranged/carbine/carbine_laser.iff", cost = 15000, displayName = "@weapon_name:carbine_laser"},
        { template = "object/weapon/ranged/carbine/carbine_dxr6.iff", cost = 20000, displayName = "@weapon_name:carbine_dxr6"},
        { template = "object/weapon/ranged/carbine/carbine_ee3.iff", cost = 20000, displayName = "@weapon_name:carbine_ee3"},
        { template = "object/weapon/ranged/carbine/carbine_elite.iff", cost = 100000, displayName = "@weapon_name:carbine_elite"},
        { template = "object/weapon/ranged/carbine/carbine_nym_slugthrower.iff", cost = 100000, displayName = "@weapon_name:carbine_nym_slugthrower"},

        --Fencer Weapons
        { template = "object/weapon/melee/sword/sword_01.iff", cost = 7500, displayName = "@weapon_name:sword_01"},
        { template = "object/weapon/melee/sword/sword_02.iff", cost = 7500, displayName = "@weapon_name:sword_02"},
        { template = "object/weapon/melee/knife/knife_vibroblade.iff", cost = 7500, displayName = "@weapon_name:knife_vibroblade"},
        { template = "object/weapon/melee/baton/baton_gaderiffi.iff", cost = 10000, displayName = "@weapon_name:baton_gaderiffi"},
        { template = "object/weapon/melee/sword/sword_blade_ryyk.iff", cost = 15000, displayName = "@weapon_name:sword_blade_ryyk"},
        { template = "object/weapon/melee/sword/sword_rantok.iff", cost = 20000, displayName = "@weapon_name:sword_blade_rantok"}, 
        { template = "object/weapon/melee/sword/baton_stun.iff", cost = 100000, displayName = "@weapon_name:baton_stun"}, 

        --Swordsman Weapons
        { template = "object/weapon/melee/axe/axe_heavy_duty.iff", cost = 7500, displayName = "@weapon_name:axe_heavy_duty"},
        { template = "object/weapon/melee/2h_sword/2h_sword_katana.iff", cost = 10000, displayName = "@weapon_name:sword_2h_katana"},--Works, but display is broken
        { template = "object/weapon/melee/axe/axe_vibroaxe.iff", cost = 15000, displayName = "@weapon_name:axe_vibro"},
        { template = "object/weapon/melee/2h_sword/2h_sword_cleaver.iff", cost = 20000, displayName = "@weapon_name:2h_cleaver"}, --Works, but display is broken
        { template = "object/weapon/melee/2h_sword/2h_sword_maul.iff", cost = 100000, displayName = "@weapon_name:sword_2h_maul"},

        --Polearm Weapons
        { template = "object/weapon/melee/polearm/lance_staff_metal.iff", cost = 7500, displayName = "@weapon_name:lance_staff_metal"},
        { template = "object/weapon/melee/polearm/lance_controllerfp.iff", cost = 10000, displayName = "@weapon_name:lance_controllerfp"},
        { template = "object/weapon/melee/polearm/polearm_vibro_axe.iff", cost = 15000, displayName = "@weapon_name:polearm_vibro_axe"},
        { template = "object/weapon/melee/polearm/lance_vibrolance.iff", cost = 100000, displayName = "@weapon_name:lance_vibrolance"},

        --Teras Kasi Weapons
        { template = "object/weapon/melee/special/vibroknuckler.iff", cost = 100000, displayName = "@weapon_name:vibroknuckler"},

        --Commando weapons
        { template = "object/weapon/ranged/pistol/pistol_launcher.iff", cost = 100000, displayName = "@weapon_name:pistol_launcher"},
        { template = "object/weapon/ranged/heavy/heavy_rocket_launcher.iff", cost = 100000, displayName = "@weapon_name:rocket_launcher"},
        { template = "object/weapon/ranged/rifle/rifle_flame_thrower.iff", cost = 100000, displayName = "@weapon_name:rifle_flame_thrower"},
        { template = "object/weapon/ranged/rifle/rifle_acid_beam.iff", cost = 100000, displayName = "@weapon_name:rifle_acid_beam"},
       
        --Commando Grenades
        { template = "object/weapon/ranged/grenade/grenade_fragmentation_light.iff", cost = 1000, displayName = "@weapon_name:grenade_fragmentation_light"}, --Base combat
        { template = "object/weapon/ranged/grenade/grenade_fragmentation.iff", cost = 100000, displayName = "@weapon_name:grenade_fragmentation"}, --CM Novice
        { template = "object/weapon/ranged/grenade/grenade_cryoban.iff", cost = 100000, displayName = "@weapon_name:grenade_cryoban"}, --CM 1
        { template = "object/weapon/ranged/grenade/grenade_glop.iff", cost = 100000, displayName = "@weapon_name:grenade_glop"}, --CM 2
        { template = "object/weapon/ranged/grenade/grenade_imperial_detonator.iff", cost = 100000, displayName = "@weapon_name:grenade_imperial_detonator"}, --CM 3
        { template = "object/weapon/ranged/grenade/grenade_thermal_detonator.iff", cost = 100000, displayName = "@weapon_name:grenade_thermal_detonator"}, --CM 4
        { template = "object/weapon/ranged/grenade/grenade_proton.iff", cost = 100000, displayName = "@weapon_name:grenade_proton"}, --CM Master
        { template = "object/weapon/ranged/heavy/heavy_particle_beam.iff", cost = 100000, displayName = "@weapon_name:heavy_particle_beam"}, -- CM1
        { template = "object/weapon/ranged/heavy/heavy_acid_beam.iff", cost = 100000, displayName = "@weapon_name:heavy_acid_beam"}, -- CM2
        { template = "object/weapon/ranged/heavy/heavy_lightning_beam.iff", cost = 100000, displayName = "@weapon_name:heavy_lightning_beam"}, --CM3

        --Bounty Hunter Weapons
        { template = "object/weapon/ranged/rifle/rifle_lightning.iff", cost = 100000, displayName = "@weapon_name:rifle_lightning"}, --BH Novice
        { template = "object/weapon/ranged/pistol/pistol_scatter.iff", cost = 100000, displayName = "@weapon_name:pistol_scatter"}, --BH Novice
        --{ template = "object/weapon/ranged/rifle/rifle_beam.iff", cost = 100000, displayName = "@weapon_name:rifle_beam"}, --Not sure if this is a legit weapon
        { template = "object/intangible/pet/dz70_fugitive_tracker_droid.iff", cost = 1000, displayName = "@droid_name:dz_70_fugitive_tracker_crafted_advanced"}, --TEST: Droid deed

    },

    junkArmor = {
        --Bone Armor (50k)
        { template = "object/tangible/wearables/armor/bone/armor_bone_s01_helmet.iff", cost = 7000, displayName = "@wearables_name:armor_bone_s01_helmet" },
        { template = "object/tangible/wearables/armor/bone/armor_bone_s01_chest_plate.iff", cost = 7000, displayName = "@wearables_name:armor_bone_s01_chest_plate" },
        { template = "object/tangible/wearables/armor/bone/armor_bone_s01_leggings.iff", cost = 7000, displayName = "@wearables_name:armor_bone_s01_leggings" },
        { template = "object/tangible/wearables/armor/bone/armor_bone_s01_boots.iff", cost = 5000, displayName = "@wearables_name:armor_bone_s01_boots" },
        { template = "object/tangible/wearables/armor/bone/armor_bone_s01_gloves.iff", cost = 4000, displayName = "@wearables_name:armor_bone_s01_gloves" },
        { template = "object/tangible/wearables/armor/bone/armor_bone_s01_bicep_l.iff", cost = 5000, displayName = "@wearables_name:armor_bone_s01_bicep_l" },
        { template = "object/tangible/wearables/armor/bone/armor_bone_s01_bicep_r.iff", cost = 5000, displayName = "@wearables_name:armor_bone_s01_bicep_r" },
        { template = "object/tangible/wearables/armor/bone/armor_bone_s01_bracer_l.iff", cost = 5000, displayName = "@wearables_name:armor_bone_s01_bracer_l" },
        { template = "object/tangible/wearables/armor/bone/armor_bone_s01_bracer_r.iff", cost = 5000, displayName = "@wearables_name:armor_bone_s01_bracer_r" },

        --Mabari Armor (100k)
        { template = "object/tangible/wearables/armor/zam/armor_zam_wesell_helmet.iff", cost = 25000, displayName = "@wearables_name:armor_zam_wesell_helmet" },
        { template = "object/tangible/wearables/armor/zam/armor_zam_wesell_chest_plate.iff", cost = 25000, displayName = "@wearables_name:armor_zam_wesell_chest_plate" },
        { template = "object/tangible/wearables/armor/zam/armor_zam_wesell_pants.iff", cost = 25000, displayName = "@wearables_name:armor_zam_wesell_pants" },
        { template = "object/tangible/wearables/armor/zam/armor_zam_wesell_boots.iff", cost = 10000, displayName = "@wearables_name:armor_zam_wesell_boots" },
        { template = "object/tangible/wearables/armor/zam/armor_zam_wesell_gloves.iff", cost = 10000, displayName = "@wearables_name:armor_zam_wesell_gloves" },
        { template = "object/tangible/wearables/armor/zam/armor_zam_wesell_belt.iff", cost = 5000, displayName = "@wearables_name:armor_zam_wesell_belt" },

        --Chitin Armor (150k)
        { template = "object/tangible/wearables/armor/chitin/armor_chitin_s01_helmet.iff", cost = 20000, displayName = "@wearables_name:armor_chitin_s01_helmet" },
        { template = "object/tangible/wearables/armor/chitin/armor_chitin_s01_chest_plate.iff", cost = 20000, displayName = "@wearables_name:armor_chitin_s01_chest_plate" },
        { template = "object/tangible/wearables/armor/chitin/armor_chitin_s01_leggings.iff", cost = 20000, displayName = "@wearables_name:armor_chitin_s01_leggings" },
        { template = "object/tangible/wearables/armor/chitin/armor_chitin_s01_boots.iff", cost = 15000, displayName = "@wearables_name:armor_chitin_s01_boots" },
        { template = "object/tangible/wearables/armor/chitin/armor_chitin_s01_gloves.iff", cost = 15000, displayName = "@wearables_name:armor_chitin_s01_gloves" },
        { template = "object/tangible/wearables/armor/chitin/armor_chitin_s01_bicep_l.iff", cost = 15000, displayName = "@wearables_name:armor_chitin_s01_bicep_l" },
        { template = "object/tangible/wearables/armor/chitin/armor_chitin_s01_bicep_r.iff", cost = 15000, displayName = "@wearables_name:armor_chitin_s01_bicep_r" },
        { template = "object/tangible/wearables/armor/chitin/armor_chitin_s01_bracer_l.iff", cost = 15000, displayName = "@wearables_name:armor_chitin_s01_bracer_l" },
        { template = "object/tangible/wearables/armor/chitin/armor_chitin_s01_bracer_r.iff", cost = 15000, displayName = "@wearables_name:armor_chitin_s01_bracer_r" },

        --Tantel Armor (200k)
        { template = "object/tangible/wearables/armor/tantel/armor_tantel_skreej_helmet.iff", cost = 90000, displayName = "@wearables_name:armor_tantel_skreej_helmet" },
        { template = "object/tangible/wearables/armor/tantel/armor_tantel_skreej_chest_plate.iff", cost = 90000, displayName = "@wearables_name:armor_tantel_skreej_chest_plate" },
        { template = "object/tangible/wearables/armor/tantel/armor_tantel_skreej_boots.iff", cost = 20000, displayName = "@wearables_name:armor_tantel_skreej_boots" },

        --Ubese Armor (250k)
        { template = "object/tangible/wearables/armor/ubese/armor_ubese_helmet.iff", cost = 50000, displayName = "@wearables_name:armor_ubese_helmet" },
        { template = "object/tangible/wearables/armor/ubese/armor_ubese_jacket.iff", cost = 100000, displayName = "@wearables_name:armor_ubese_jacket" },
        { template = "object/tangible/wearables/armor/ubese/armor_ubese_pants.iff", cost = 50000, displayName = "@wearables_name:armor_ubese_pants" },
        { template = "object/tangible/wearables/armor/ubese/armor_ubese_boots.iff", cost = 10000, displayName = "@wearables_name:armor_ubese_boots" },
        { template = "object/tangible/wearables/armor/ubese/armor_ubese_gloves.iff", cost = 10000, displayName = "@wearables_name:armor_ubese_gloves" },
        { template = "object/tangible/wearables/armor/ubese/armor_ubese_bracer_l.iff", cost = 10000, displayName = "@wearables_name:armor_ubese_bracer_l" },
        { template = "object/tangible/wearables/armor/ubese/armor_ubese_bracer_r.iff", cost = 10000, displayName = "@wearables_name:armor_ubese_bracer_r" },
        { template = "object/tangible/wearables/armor/ubese/armor_ubese_shirt.iff", cost = 5000, displayName = "@wearables_name:armor_ubese_shirt" },
        { template = "object/tangible/wearables/armor/ubese/armor_ubese_bandolier.iff", cost = 5000, displayName = "@wearables_name:armor_ubese_bandolier" },

        --Padded Armor (350k)
        { template = "object/tangible/wearables/armor/padded/armor_padded_s01_helmet.iff", cost = 75000, displayName = "@wearables_name:armor_padded_s01_helmet" },
        { template = "object/tangible/wearables/armor/padded/armor_padded_s01_chest_plate.iff", cost = 75000, displayName = "@wearables_name:armor_padded_s01_chest_plate" },
        { template = "object/tangible/wearables/armor/padded/armor_padded_s01_leggings.iff", cost = 75000, displayName = "@wearables_name:armor_padded_s01_leggings" },
        { template = "object/tangible/wearables/armor/padded/armor_padded_s01_boots.iff", cost = 25000, displayName = "@wearables_name:armor_padded_s01_boots" },
        { template = "object/tangible/wearables/armor/padded/armor_padded_s01_gloves.iff", cost = 20000, displayName = "@wearables_name:armor_padded_s01_gloves" },
        { template = "object/tangible/wearables/armor/padded/armor_padded_s01_bicep_l.iff", cost = 20000, displayName = "@wearables_name:armor_padded_s01_bicep_l" },
        { template = "object/tangible/wearables/armor/padded/armor_padded_s01_bicep_r.iff", cost = 20000, displayName = "@wearables_name:armor_padded_s01_bicep_r" },
        { template = "object/tangible/wearables/armor/padded/armor_padded_s01_bracer_l.iff", cost = 20000, displayName = "@wearables_name:armor_padded_s01_bracer_l" },
        { template = "object/tangible/wearables/armor/padded/armor_padded_s01_bracer_r.iff", cost = 20000, displayName = "@wearables_name:armor_padded_s01_bracer_r" },

        --Composite Armor (500k)
        { template = "object/tangible/wearables/armor/composite/armor_composite_helmet.iff", cost = 100000, displayName = "@wearables_name:armor_composite_helmet" },
        { template = "object/tangible/wearables/armor/composite/armor_composite_chest_plate.iff", cost = 100000, displayName = "@wearables_name:armor_composite_chest_plate" },
        { template = "object/tangible/wearables/armor/composite/armor_composite_leggings.iff", cost = 100000, displayName = "@wearables_name:armor_composite_leggings" },
        { template = "object/tangible/wearables/armor/composite/armor_composite_boots.iff", cost = 50000, displayName = "@wearables_name:armor_composite_boots" },
        { template = "object/tangible/wearables/armor/composite/armor_composite_gloves.iff", cost = 50000, displayName = "@wearables_name:armor_composite_gloves" },
        { template = "object/tangible/wearables/armor/composite/armor_composite_bicep_l.iff", cost = 25000, displayName = "@wearables_name:armor_composite_bicep_l" },
        { template = "object/tangible/wearables/armor/composite/armor_composite_bicep_r.iff", cost = 25000, displayName = "@wearables_name:armor_composite_bicep_r" },
        { template = "object/tangible/wearables/armor/composite/armor_composite_bracer_l.iff", cost = 25000, displayName = "@wearables_name:armor_composite_bracer_l" },
        { template = "object/tangible/wearables/armor/composite/armor_composite_bracer_r.iff", cost = 25000, displayName = "@wearables_name:armor_composite_bracer_r" },

        --Ithorian Guardian (150k)
        { template = "object/tangible/wearables/armor/ithorian_guardian/ith_armor_s02_helmet.iff", cost = 20000, displayName = "@wearables_name:ith_armor_s02_helmet" },
        { template = "object/tangible/wearables/armor/ithorian_guardian/ith_armor_s02_chest_plate.iff", cost = 20000, displayName = "@wearables_name:ith_armor_s02_chest_plate" },
        { template = "object/tangible/wearables/armor/ithorian_guardian/ith_armor_s02_leggings.iff", cost = 20000, displayName = "@wearables_name:ith_armor_s02_leggings" },
        { template = "object/tangible/wearables/armor/ithorian_guardian/ith_armor_s02_boots.iff", cost = 15000, displayName = "@wearables_name:ith_armor_s02_boots" },
        { template = "object/tangible/wearables/armor/ithorian_guardian/ith_armor_s02_gloves.iff", cost = 15000, displayName = "@wearables_name:ith_armor_s02_gloves" },
        { template = "object/tangible/wearables/armor/ithorian_guardian/ith_armor_s02_bicep_l.iff", cost = 15000, displayName = "@wearables_name:ith_armor_s02_bicep_l" },
        { template = "object/tangible/wearables/armor/ithorian_guardian/ith_armor_s02_bicep_r.iff", cost = 15000, displayName = "@wearables_name:ith_armor_s02_bicep_r" },
        { template = "object/tangible/wearables/armor/ithorian_guardian/ith_armor_s02_bracer_l.iff", cost = 15000, displayName = "@wearables_name:ith_armor_s02_bracer_l" },
        { template = "object/tangible/wearables/armor/ithorian_guardian/ith_armor_s02_bracer_r.iff", cost = 15000, displayName = "@wearables_name:ith_armor_s02_bracer_r" },

        --Ithorian Defender Armor (350k)
        { template = "object/tangible/wearables/armor/ithorian_defender/ith_armor_s01_helmet.iff", cost = 75000, displayName = "@wearables_name:ith_armor_s01_helmet" },
        { template = "object/tangible/wearables/armor/ithorian_defender/ith_armor_s01_chest_plate.iff", cost = 75000, displayName = "@wearables_name:ith_armor_s01_chest_plate" },
        { template = "object/tangible/wearables/armor/ithorian_defender/ith_armor_s01_leggings.iff", cost = 75000, displayName = "@wearables_name:ith_armor_s01_leggings" },
        { template = "object/tangible/wearables/armor/ithorian_defender/ith_armor_s01_boots.iff", cost = 25000, displayName = "@wearables_name:ith_armor_s01_boots" },
        { template = "object/tangible/wearables/armor/ithorian_defender/ith_armor_s01_gloves.iff", cost = 20000, displayName = "@wearables_name:ith_armor_s01_gloves" },
        { template = "object/tangible/wearables/armor/ithorian_defender/ith_armor_s01_bicep_l.iff", cost = 20000, displayName = "@wearables_name:ith_armor_s01_bicep_l" },
        { template = "object/tangible/wearables/armor/ithorian_defender/ith_armor_s01_bicep_r.iff", cost = 20000, displayName = "@wearables_name:ith_armor_s01_bicep_r" },
        { template = "object/tangible/wearables/armor/ithorian_defender/ith_armor_s01_bracer_l.iff", cost = 20000, displayName = "@wearables_name:ith_armor_s01_bracer_l" },
        { template = "object/tangible/wearables/armor/ithorian_defender/ith_armor_s01_bracer_r.iff", cost = 20000, displayName = "@wearables_name:ith_armor_s01_bracer_r" },

        --Ithorian Sentinel Armor (500k)
        { template = "object/tangible/wearables/armor/ithorian_sentinel/ith_armor_s02_helmet.iff", cost = 100000, displayName = "@wearables_name:ith_armor_s02_helmet" },
        { template = "object/tangible/wearables/armor/ithorian_sentinel/ith_armor_s02_chest_plate.iff", cost = 100000, displayName = "@wearables_name:ith_armor_s02_chest_plate" },
        { template = "object/tangible/wearables/armor/ithorian_sentinel/ith_armor_s02_leggings.iff", cost = 100000, displayName = "@wearables_name:ith_armor_s02_leggings" },
        { template = "object/tangible/wearables/armor/ithorian_sentinel/ith_armor_s02_boots.iff", cost = 50000, displayName = "@wearables_name:ith_armor_s02_boots" },
        { template = "object/tangible/wearables/armor/ithorian_sentinel/ith_armor_s02_gloves.iff", cost = 50000, displayName = "@wearables_name:ith_armor_s02_gloves" },
        { template = "object/tangible/wearables/armor/ithorian_sentinel/ith_armor_s02_bicep_l.iff", cost = 25000, displayName = "@wearables_name:ith_armor_s02_bicep_l" },
        { template = "object/tangible/wearables/armor/ithorian_sentinel/ith_armor_s02_bicep_r.iff", cost = 25000, displayName = "@wearables_name:ith_armor_s02_bicep_r" },
        { template = "object/tangible/wearables/armor/ithorian_sentinel/ith_armor_s02_bracer_l.iff", cost = 25000, displayName = "@wearables_name:ith_armor_s02_bracer_l" },
        { template = "object/tangible/wearables/armor/ithorian_sentinel/ith_armor_s02_bracer_r.iff", cost = 25000, displayName = "@wearables_name:ith_armor_s02_bracer_r" },

        --Kashyyykian Ceremonial Armor (150k)
        { template = "object/tangible/wearables/armor/kashyyykian_ceremonial/armor_kashyyykian_ceremonial_chest_plate.iff", cost = 50000, displayName = "@wearables_name:armor_kashyyykian_ceremonial_chest_plate" },
        { template = "object/tangible/wearables/armor/kashyyykian_ceremonial/armor_kashyyykian_ceremonial_leggings.iff", cost = 50000, displayName = "@wearables_name:armor_kashyyykian_ceremonial_leggings" },
        { template = "object/tangible/wearables/armor/kashyyykian_ceremonial/armor_kashyyykian_ceremonial_bracer_l.iff", cost = 25000, displayName = "@wearables_name:armor_kashyyykian_ceremonial_bracer_l" },
        { template = "object/tangible/wearables/armor/kashyyykian_ceremonial/armor_kashyyykian_ceremonial_bracer_r.iff", cost = 25000, displayName = "@wearables_name:armor_kashyyykian_ceremonial_bracer_r" },

        --Kashyyykian Black Mountain Armor (325k)
        { template = "object/tangible/wearables/armor/kashyyykian_black_mtn/armor_kashyyykian_black_mtn_chest_plate.iff", cost = 100000, displayName = "@wearables_name:armor_kashyyykian_black_mtn_chest_plate" },
        { template = "object/tangible/wearables/armor/kashyyykian_black_mtn/armor_kashyyykian_black_mtn_leggings.iff", cost = 100000, displayName = "@wearables_name:armor_kashyyykian_black_mtn_leggings" },
        { template = "object/tangible/wearables/armor/kashyyykian_black_mtn/armor_kashyyykian_black_mtn_bracer_l.iff", cost = 100000, displayName = "@wearables_name:armor_kashyyykian_black_mtn_bracer_l" },
        { template = "object/tangible/wearables/armor/kashyyykian_black_mtn/armor_kashyyykian_black_mtn_bracer_r.iff", cost = 25000, displayName = "@wearables_name:armor_kashyyykian_black_mtn_bracer_r" },

        --Kashyyykian Hunting Armor (500k)
        { template = "object/tangible/wearables/armor/kashyyykian_hunting/armor_kashyyykian_hunting_chest_plate.iff", cost = 150000, displayName = "@wearables_name:armor_kashyyykian_hunting_chest_plate" },
        { template = "object/tangible/wearables/armor/kashyyykian_hunting/armor_kashyyykian_hunting_leggings.iff", cost = 150000, displayName = "@wearables_name:armor_kashyyykian_hunting_leggings" },
        { template = "object/tangible/wearables/armor/kashyyykian_hunting/armor_kashyyykian_hunting_bracer_l.iff", cost = 100000, displayName = "@wearables_name:armor_kashyyykian_hunting_bracer_l" },
        { template = "object/tangible/wearables/armor/kashyyykian_hunting/armor_kashyyykian_hunting_bracer_r.iff", cost = 100000, displayName = "@wearables_name:armor_kashyyykian_hunting_bracer_r" },


    },

    junkHireling = {
        { template = "gurrcat_be", cost = 1000, displayName = "gurrcat" },
        { template = "dz70_crafted_advanced", cost = 1000, displayName = "@droid_name:dz_70_fugitive_tracker_crafted_advanced" },
    },
}
