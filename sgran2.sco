outskip = 0
dur = 2400
amp = 1

freqmid = makeconnection("inlet", 1, 440)

freqlo = freqmid - 5// maketable("line", "nonorm", 200, 0, 400, 1, 200)
freqhi = freqmid + 5//maketable("line", "nonorm", 200, 0, 440, 1, 460, 2, 800)
freqti = 6 // maketable("line", "nonorm", 200, 0, 6, 1, 0.2)

ratelo = irand(0.0004, 0.0008)
ratemid = ratelo * 10// maketable("line", "nonorm", 200, 0, 0.008, 1, 0.0008)
ratehi = ratelo * 20// maketable("line", "nonorm", 200, 0, 0.04, 1, 0.004)
rateti = 1// maketable("line", "nonorm", 200, 0, 8, 1, 0.2)
durlo = maketable("line", "nonorm", 200, 0, log(trand(2, 10)) / trand(20, 90), 1, log(trand(2, 10)) / trand(20, 90))

durmid = durlo * 5
durhi = durlo * 10
durti = 0.6

panlo = 0
panmid = 0.5
panhi = 1
panti = 0.6

wave = maketable("wave", 1000, "sine")

env = maketable("window", 1000, "hanning")

SGRAN2(outskip, dur, 800 * amp, ratelo, ratemid, ratehi, rateti, durlo, durmid, durhi, durti, 
freqlo, freqmid, freqhi, freqti, panlo, panmid, panhi, panti, wave, env)
