--[[pod_format="raw",created="2026-11-21 17:24:40",modified="2026-11-22 11:23:54",revision=18,xstickers={}]]
local gui
function _init()
	gui = create_gui()
	gui:attach_button{
		x=5,
		y=5,
		label="hello world",
		tap = function(self, msg)
			notify("button "..tostring(self)
			.." with msg "..tostring(msg)
			.." pressed")
		end
	}
	window {
		width = 100,
		height = 100
	}
end
function _draw()
	cls()
	gui:draw_all()
end
function _update()
	gui:update_all()
end