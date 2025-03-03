local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
  --Arithmetic
  s({trig="([^%a])ff", regTrig=true, wordTrig=false, snippetType="autosnippet"},
    fmta(
      [[<>\frac{<>}{<>}]],
      {f( function(_, snip) return snip.captures[1] end ), i(1), i(2)}
    ),
    {condition = in_mathzone}
  ),

  s({trig="^", snippetType="autosnippet"},
    fmta(
      [[
        ^{<>}
      ]],
      {i(1)}
    ),
    {condition = in_mathzone}
  ),
  s({trig="([^%a])sq", snippetType="autosnippet"},
    fmta(
      [[\sqrt{<>}]],
      {i(1)}
    ),
    {condition = in_mathzone}
  ),
  s({trig="ii", snippetType="autosnippet"},
    t("\\infty"),
    {condition = in_mathzone}
  ),

  -- Limits and sums
  s({trig="lim", snippetType="autosnippet"},
    fmta(
      [[\lim_{<>\to\infty}]],
      {i(1)}
    ),
    {condition = in_mathzone}
  ),
  s({trig="s0", snippetType="autosnippet"},
    t("\\sum_{n=0}^{\\infty}"),
    {condition = in_mathzone}
  ),
}

