local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node


ls.add_snippets(nil, {
    tex = {
        snip({
            trig = "item",
        },
        {
            text( {"\\item","\t"}),
        }),
    },
    cmake = {
        snip({
            trig = "header",
        },
        {
            text({ "cmake_minimum_required(VERSION 3.10)", "project(", }),
            insert(1, "project name"),
            text({
                ")",
                "set(CMAKE_EXPORT_COMPILE_COMMANDS ON)"
            }),
        }),
    }
})

