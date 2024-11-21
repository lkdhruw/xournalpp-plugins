function initUi()
  -- Shortcut to toggle Fill
  app.registerUi({
    ["menu"] = "Toggle Fill",
    ["callback"] = "toggleFill",
    ["accelerator"] = "<Ctrl><Alt>F"
  })
end

local isEnabled = false
-- Callback to toggle Fill
function toggleFill()
 if isEnabled == false then
	app.uiAction({action = "ACTION_TOOL_FILL"})
	isEnabled = true
 else
	app.uiAction({action = "ACTION_TOOL_FILL", enabled = false})
	isEnabled = false
 end
end
