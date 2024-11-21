function initUi()
  -- Shortcut to increase Pen Size
  app.registerUi({
    ["menu"] = "Increase Pen Thickness",
    ["callback"] = "increasePenSize",
    ["accelerator"] = "<Alt>S"
  })

  -- Shortcut to decrease Pen Size
  app.registerUi({
    ["menu"] = "Decrease Pen Thickness",
    ["callback"] = "decreasePenSize",
    ["accelerator"] = "<Alt>Z"
  })
end

-- Table to manage Pen Sizes in order
local penSizes = {
  "ACTION_TOOL_PEN_SIZE_FINE",
  "ACTION_TOOL_PEN_SIZE_MEDIUM",
  "ACTION_TOOL_PEN_SIZE_THICK"
}

-- Track the current pen size
local currentPenSizeIndex = 2 -- Start with Medium (index 2)

-- Callback to cycle through Pen Sizes upwards
function increasePenSize()
  currentPenSizeIndex = currentPenSizeIndex + 1
  if currentPenSizeIndex > #penSizes then
    currentPenSizeIndex = 1 -- Wrap around to the first size
  end
  app.uiAction({action = penSizes[currentPenSizeIndex]})
end

-- Callback to cycle through Pen Sizes downwards
function decreasePenSize()
  currentPenSizeIndex = currentPenSizeIndex - 1
  if currentPenSizeIndex < 1 then
    currentPenSizeIndex = #penSizes -- Wrap around to the last size
  end
  app.uiAction({action = penSizes[currentPenSizeIndex]})
end
