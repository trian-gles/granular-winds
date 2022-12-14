{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 2,
			"revision" : 2,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 593.0, 292.0, 640.0, 480.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 237.0, 30.0, 34.0, 22.0 ],
					"text" : "flush"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 175.0, 76.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 8,
					"numoutlets" : 0,
					"patching_rect" : [ 229.0, 252.0, 115.0, 22.0 ],
					"text" : "dac~ 1 2 3 4 5 6 7 8"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 8,
					"numoutlets" : 9,
					"outlettype" : [ "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "" ],
					"patching_rect" : [ 229.0, 81.0, 103.0, 22.0 ],
					"save" : [ "#N", "rtcmix~", 8, 0, ";", "#X", "restore", 0, 1805, 1805, "        /* NEW Args:\n\t\tp0: inskip\n\t\tp1: dur\n\t\tp2: amp\n\t\tp3: grainRateVarLow\n\t\tp4: grainRateVarMid\n\t\tp5: grainRateVarHigh\n\t\tp6: grainRateVarTigh\n\t\tp7: grainDurLow\n\t\tp8: grainDurMid\n\t\tp9: grainDurHigh\n\t\tp10: grainDurTight\n\t\tp11: freqLow\n\t\tp12: freqMid\n\t\tp13: freqHigh\n\t\tp14: freqTight\n\t\tp15: angle\n\t\tp16: distance\n\t\tp17: radius\n\t\tp18: wavetable\n\t\tp19: grainEnv\n\t\tp20: grainLimit=1500\n\t*/\ninskip = 0\ndur = 120\n\namp = maketable(\"line\", 1000, 0, 0, 8, 0.8, 16, 1, 17, 0)\n\nratelo = 0.00008\nratemid = 0.0005//maketable(\"line\", \"nonorm\", 200, 0, 0.0008, 1, 0.00008)\nratehi = 0.002//maketable(\"line\", \"nonorm\", 200, 0, 0.04, 1, 0.00004)\nrateti = 100//maketable(\"line\", \"nonorm\", 200, 0, 8, 1, 0.2)\n\ndurlo = 0.0005\ndurmid = 0.005\ndurhi = 0.8\ndurti = 3\n\nfreqlo = maketable(\"line\", \"nonorm\", 200, 0, 400, 1, 200,4, 200)\nfreqmid = maketable(\"line\", \"nonorm\", 200, 0, 430, 1, 350, 2, 600, 4, 600)\nfreqhi = maketable(\"line\", \"nonorm\", 200, 0, 440, 1, 460, 2, 900, 4, 900)\nfreqti = 1//maketable(\"line\", \"nonorm\", 200, 0, 6, 1, 0.2, 2, 1)\n\nangle = maketable(\"curve\", \"nonorm\", 1000000, 0,0, 8, 1,1080000, 2, 1, 1080000)\ndistance = 1 //maketable(\"line\", \"nonorm\", 1000, 0,5, 1, 1)\nradius = 0//maketable(\"line\", \"nonorm\", 1000, 0,5, 4, 0, 8, .1)\n\nwave = maketable(\"wave\", 1000, \"square\")\nenv =  maketable(\"line\", \"nonorm\", 10000, 0,0, 1,1, 20, 0.1, 1600, 0.1, 1700, 0)\n\nSGRAN2_NPANspeakers(\"polar\",\n       45, 1,   // front left\n      -45, 1,   // front right\n       90, 1,   // side left\n      -90, 1,   // side right\n      135, 1,   // rear left\n     -135, 1,   // rear right rear\n        0, 1,   // front center\n      180, 1)   // rear center\n\nSGRAN2_NPAN(inskip, dur, 2000 * amp, ratelo, ratemid, ratehi, rateti, durlo, durmid, durhi, durti, \nfreqlo, freqmid, freqhi, freqti, angle, distance, radius, wave, env, \"polar\")", ";" ],
					"text" : "rtcmix~ 8"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 7 ],
					"source" : [ "obj-1", 7 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 6 ],
					"source" : [ "obj-1", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 5 ],
					"source" : [ "obj-1", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 4 ],
					"source" : [ "obj-1", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 3 ],
					"source" : [ "obj-1", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 2 ],
					"source" : [ "obj-1", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "rtcmix~.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
