local ls = require("luasnip")

-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local ts_post = require("luasnip.extras.treesitter_postfix").treesitter_postfix
local postfix_builtin = require("luasnip.extras.treesitter_postfix").builtin

ls.add_snippets("java", {
  s("try_catch", {
    t({ "try {" }),
    t({ "", "\t" }),
    i(1),
    t({ "", "} catch (" }),
    i(2, "Throwable"),
    t({ " e) {" }),
    t({ "", "\t" }),
    i(3),
    t({ "", "}" }),
  }),
  s("try_finally", {
    t({ "try {" }),
    t({ "", "\t" }),
    i(1),
    t({ "", "} finally {" }),
    t({ "", "\t" }),
    i(2),
    t({ "", "}" }),
  }),
  s("try_catch_finally", {
    t({ "try {" }),
    t({ "", "\t" }),
    i(1),
    t({ "", "} catch (" }),
    i(2, "Throwable"),
    t({ " e) {" }),
    t({ "", "\t" }),
    i(3),
    t({ "", "} finally {" }),
    t({ "", "\t" }),
    i(4),
    t({ "", "}" }),
  }),
  s("sout", {
    t({ "System.out.println(" }),
    i(1),
    t({ ");" }),
  }),
  -- ts_post({
  --   matchTSNode = postfix_builtin.tsnode_matcher.find_topmost_types({
  --     "identifier",
  --     "method_invocation",
  --     "field_access",
  --     "string_literal",
  --     "decimal_integer_literal",
  --     "decimal_floating_point_literal",
  --   }),
  --   trig = ".println",
  -- }, {
  --   l("System.out.println(" .. l.LS_TSMATCH .. ");"),
  -- }),
  postfix({
    trig = ".info",
    name = "log info",
    match_pattern = '"?[%w%.%_%-%%(%)%[%] "%\']+$',
  }, {
    d(1, function(_, parent)
      if parent.snippet.env.POSTFIX_MATCH == nil then
        return nil
      end
      local node_sp = parent.snippet.env.POSTFIX_MATCH:match("^%s+")
      local node_content = parent.snippet.env.POSTFIX_MATCH:gsub("^%s*(.-)%s*$", "%1")
      return sn(nil, {
        t({ node_sp }),
        t({ 'log.info("' }),
        i(1),
        t({ ': {}", ' }),
        t({ node_content }),
        t({ ");" }),
      })
    end),
  }),

  s("main", {
    t({ "public static void main(String[] args) {" }),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),
  s("field", {
    c(1, {
      t("private"),
      t("public"),
      t("protected"),
    }),
    t(" "),
    c(2, {
      t(""),
      t({ "static " }),
      t({ "final " }),
      t({ "final static " }),
    }),
    i(3, "String"),
    t(" "),
    i(4, "name"),
    t({ ";" }),
  }),
  s("fn", {
    c(1, {
      t("public"),
      t("protected"),
      t("private"),
    }),
    t(" "),
    c(2, {
      t(""),
      t({ "static " }),
      t({ "final " }),
    }),
    i(3, "void"),
    t(" "),
    i(4, "name"),
    t("("),
    c(5, {
      t(""),
      sn(nil, {
        i(1, { "String" }),
        t(" "),
        i(2, { "arg1" }),
      }),
      sn(nil, {
        i(1, { "String" }),
        t(" "),
        i(2, { "arg1" }),
        t(", "),
        i(3, { "String" }),
        t(" "),
        i(4, { "arg2" }),
      }),
      sn(nil, {
        i(1, { "String" }),
        t(" "),
        i(2, { "arg1" }),
        t(", "),
        i(3, { "String" }),
        t(" "),
        i(4, { "arg2" }),
        t(", "),
        i(5, { "String" }),
        t(" "),
        i(6, { "arg3" }),
      }),
      sn(nil, {
        i(1, { "String" }),
        t(" "),
        i(2, { "arg1" }),
        t(", "),
        i(3, { "String" }),
        t(" "),
        i(4, { "arg2" }),
        t(", "),
        i(5, { "String" }),
        t(" "),
        i(6, { "arg3" }),
        t(", "),
        i(7, { "String" }),
        t(" "),
        i(8, { "arg4" }),
      }),
    }),
    t(")"),
    c(6, {
      t(""),
      sn(nil, {
        t({ " throws " }),
        i(1, "Exception"),
      }),
    }),
    t(" {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("afn", {
    c(1, {
      t("protected"),
      t("public"),
    }),
    t(" abstract "),
    i(2, "void"),
    t(" "),
    i(3, "name"),
    t("("),
    c(4, {
      t(""),
      sn(nil, {
        i(1, { "String" }),
        t(" "),
        i(2, { "arg1" }),
      }),
      sn(nil, {
        i(1, { "String" }),
        t(" "),
        i(2, { "arg1" }),
        t(", "),
        i(3, { "String" }),
        t(" "),
        i(4, { "arg2" }),
      }),
      sn(nil, {
        i(1, { "String" }),
        t(" "),
        i(2, { "arg1" }),
        t(", "),
        i(3, { "String" }),
        t(" "),
        i(4, { "arg2" }),
        t(", "),
        i(5, { "String" }),
        t(" "),
        i(6, { "arg3" }),
      }),
      sn(nil, {
        i(1, { "String" }),
        t(" "),
        i(2, { "arg1" }),
        t(", "),
        i(3, { "String" }),
        t(" "),
        i(4, { "arg2" }),
        t(", "),
        i(5, { "String" }),
        t(" "),
        i(6, { "arg3" }),
        t(", "),
        i(7, { "String" }),
        t(" "),
        i(8, { "arg4" }),
      }),
    }),
    t(")"),
    c(5, {
      t(""),
      sn(nil, {
        t({ " throws " }),
        i(1, "Exception"),
      }),
    }),
    t(";"),
  }),

  s("ifn", {
    i(1, "void"),
    t(" "),
    i(2, "name"),
    t("("),
    c(3, {
      t(""),
      sn(nil, {
        i(1, { "String" }),
        t(" "),
        i(2, { "arg1" }),
      }),
      sn(nil, {
        i(1, { "String" }),
        t(" "),
        i(2, { "arg1" }),
        t(", "),
        i(3, { "String" }),
        t(" "),
        i(4, { "arg2" }),
      }),
      sn(nil, {
        i(1, { "String" }),
        t(" "),
        i(2, { "arg1" }),
        t(", "),
        i(3, { "String" }),
        t(" "),
        i(4, { "arg2" }),
        t(", "),
        i(5, { "String" }),
        t(" "),
        i(6, { "arg3" }),
      }),
      sn(nil, {
        i(1, { "String" }),
        t(" "),
        i(2, { "arg1" }),
        t(", "),
        i(3, { "String" }),
        t(" "),
        i(4, { "arg2" }),
        t(", "),
        i(5, { "String" }),
        t(" "),
        i(6, { "arg3" }),
        t(", "),
        i(7, { "String" }),
        t(" "),
        i(8, { "arg4" }),
      }),
    }),
    t(")"),
    c(4, {
      t(""),
      sn(nil, {
        t({ " throws " }),
        i(1, "Exception"),
      }),
    }),
    t(";"),
  }),
})

