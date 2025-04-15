-- https://github.com/mpeterv/luacheck config file.
-- Simply copy this file to the root of the project.
-- luacheck:ignore 111

std = {
  globals = { "vim", "require", "strategy", "query", "globals", "math" }, -- these globals can be set and accessed.
}
codes = true
ranges = true
