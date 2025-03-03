
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
-- Examples of Greek letter snippets, autotriggered for efficiency
s({trig=";a", snippetType="autosnippet"},
  {
    t("\\alpha"),
  }
),
s({trig=";b", snippetType="autosnippet"},
  {
    t("\\beta"),
  }
),
s({trig=";g", snippetType="autosnippet"},
  {
    t("\\gamma"),
  }
),
s({trig=";t", snippetType="autosnippet"},
  {
    t("\\theta"),
  }
),
s({trig=";p", snippetType="autosnippet"},
  {
    t("\\phi"),
  }
),
}
