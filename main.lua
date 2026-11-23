--[[pod_format="raw",created="2026-11-21 17:24:40",modified="2026-11-22 15:55:16",revision=44,xstickers={}]]
local gui

function _init()
	gui = create_gui{}
	local name = gui:attach_text_editor{
		x = 5,
		y = 5,
		width = 100,
		height = 13,
		max_lines = 1,
	}
	local desc = gui:attach_text_editor{
		x = 5,
		y = 20,
		width = 100,
		height = 15*4,
	}


	local uuid = gui:attach_text_editor{
		x = 110,
		y = 5,
		width = 180,
		height = 13,
		max_lines = 1,
	}
	gui:attach_button{
		x=5,
		y= 37+15*3,
		label="Submit",
		tap = function()
			fetch("http://localhost:8090/init_project", {
				method= "POST",
				on_complete = function (res)
					notify(table.concat(res:split(":"), ";"))
					uuid:set_text(res:split(":")[2])
				end,
				body= name:get_text()[1]..";"..table.concat(desc:get_text(), "\n")
			})
		end
	}
	local response = gui:attach_text_editor{
		x = 110,
		y = 20,
		width = 180,
		height = 15*4,
	}
	gui:attach_button {
		x = 110,
		y = 37+15*3,
		label = "Get project",
		tap = function ()
			fetch("http://localhost:8090/get_project?uuid="..uuid:get_text()[1], {
				method = "GET",
				on_complete=function (res)
					response:set_text(res:split("\n"))
				end,
			})
		end
	}

	
	window {
		width = 200,
		height = 100
	}
end
function _draw()
	window {
		width = 300,
		height = 100
	}
	cls(13)
	gui:draw_all()
end
function _update()
	
	gui:update_all()
end