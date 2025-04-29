-- https://github.com/mpeterv/luacheck config file.
-- Simply copy this file to the root of the project.
-- luacheck:ignore 111

std = {
  globals = {
    "vim",
    "require",
    "strategy",
    "query",
    "globals",
    "math",
    "pcall",
    "os",
    "pairs",
    "string",
    "table",
    "ipairs",
  },
}

codes = true
ranges = true
