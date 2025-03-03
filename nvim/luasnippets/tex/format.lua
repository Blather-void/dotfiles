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

local get_visual = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

local line_begin = require("luasnip.extras.expand_conditions").line_begin


return {
  s(
    {trig="tii", descr="italics", snippetType="autosnippet"},
    fmta(
      [[\textit{<>}<>]],
      {i(1, "text"), i(0)}
    )
  ),
  s(
    {trig="([^%a])mm", regTrig=true, wordTrig=false,  snippetType="autosnippet"},
    fmta(
      "<>$<>$",
      {
        f( function(_, snip) return snip.captures[1] end),
        d(1, get_visual)
      }
    )
  ),
  s(
    {trig="notesdoc"},
    fmta(
      [[
        \documentclass{article}
        \usepackage{graphicx}
        \usepackage{multicol}

        \title{<>}
        \author{Brig C.D. Putnam}

        \begin{document}
        \maketitle
        \begin{multicols}{2}

        <>
        
        \end{multicols}
        \end{document}
      ]],
      {i(1, "Title"), i(0)}
    )
  ),


  -- eq, al, enum, item
  s({trig="benv", snippetType="autosnippet"},
    fmta(
      [[
      \begin{<>}
      <>
      \end{<>}
      ]],
      {i(1), i(2), rep(1)}
    ),
    { condition = line_begin }
  ),
}
