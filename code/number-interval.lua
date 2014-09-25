--[[
@title Intervalometer
@param a = interval (sec)
@default a 5
@param b = number of photos
@default -1
--]]
repeat
    start = get_tick_count()
	shoot()
    sleep(a*1000 - (get_tick_count() - start))
    b = b - 1
until ( b = 0)


