-- Auto-selects dark or light based on vim.o.background (respects OS preference)
local variant = vim.o.background == "light" and "light" or "dark"
require("zorn").load(variant)
