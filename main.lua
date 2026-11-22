--[[pod_format="raw",created="2026-11-21 17:24:40",modified="2026-11-22 15:55:16",revision=44,xstickers={}]]
local gui

function _init()
	gui = create_gui{}
	local name = gui:attach_field{
		x = 5,
		y = 5,
		width = 50,
		height = 13,
		max_lines = 1,
	}
	gui:attach_button{
		x=5,
		y= 20,
		label="Submit",
		tap = function(self, msg)
			fetch("http://localhost:8090/init_project", {
				method= "POST",
				on_complete = function (res)
					-- notify(res)
					
				end,
				body= "asd;desc from picotron"
			})
			notify("text: "..tostr(name:get()))
		end
	}
	window {
		width = 200,
		height = 100
	}
end
function _draw()
	window {
		width = 200,
		height = 100
	}
	cls()
	gui:draw_all()
end
function _update()
	
	gui:update_all()
end