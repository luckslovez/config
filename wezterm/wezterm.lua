-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "AdventureTime"

config.font = wezterm.font("JetBrains Mono")

local direction_keys = {
  Left = "h",
  Down = "j",
  Up = "k",
  Right = "l",
  -- reverse lookup
  h = "Left",
  j = "Down",
  k = "Up",
  l = "Right",
}

local function split_nav(resize_or_move, key)
  return {
    key = key,
    mods = resize_or_move == "resize" and "META" or "CTRL",
    action = wezterm.action_callback(function(win, pane)
      if resize_or_move == "resize" then
        win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
      else
        win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
      end
    end),
  }
end

-- Leader is the same as my old tmux prefix
config.leader = { key = "v", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  -- splitting
  {
    mods = "LEADER",
    key = '"',
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    mods = "LEADER",
    key = "%",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    mods = "LEADER",
    key = "z",
    action = wezterm.action.TogglePaneZoomState,
  },
  -- rotate panes
  {
    mods = "LEADER",
    key = "Space",
    action = wezterm.action.RotatePanes("Clockwise"),
  },
  -- show the pane selection mode, but have it swap the active and selected panes
  {
    mods = "LEADER",
    key = "0",
    action = wezterm.action.PaneSelect({
      mode = "SwapWithActive",
    }),
  },
  -- move between split panes
  split_nav("move", "h"),
  split_nav("move", "j"),
  split_nav("move", "k"),
  split_nav("move", "l"),
  -- resize panes
  split_nav("resize", "h"),
  split_nav("resize", "j"),
  split_nav("resize", "k"),
  split_nav("resize", "l"),
  -- activate copy mode or vim mode
  {
    key = "Enter",
    mods = "LEADER",
    action = wezterm.action.ActivateCopyMode,
  },
  -- show launcher menu
  {
    key = "s",
    mods = "LEADER",
    action = wezterm.action.ShowLauncher,
  },
}

local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
  -- allow `wezterm start -- something` to affect what we spawn
  -- in our initial window
  local args = {}
  if cmd then
    args = cmd.args
  end

  -- Set a workspace for coding on a current project
  -- Top pane is for the editor, bottom pane is for the build tool
  local tab, build_pane, window = mux.spawn_window({
    workspace = "main",
    cwd = "~/Projects/new-relic/logging/",
    args = args,
  })

  -- A workspace for interacting with a local machine that
  -- runs some docker containners for home automation
  local tab, pane, window = mux.spawn_window({
    workspace = "worklog",
    cwd = "~/Documents/worklog/",
    args = args,
  })

  -- A workspace for interacting with a local machine that
  -- runs some docker containners for home automation
  local tab, pane, window = mux.spawn_window({
    workspace = "learn",
    cwd = "~/.config/nvim/lua/user/",
    args = args,
  })

  -- We want to startup in the coding workspace
  mux.set_active_workspace("main")
end)

-- and finally, return the configuration to wezterm
return config
