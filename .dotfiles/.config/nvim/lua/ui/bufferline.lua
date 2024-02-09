local bufferline = require("bufferline")

bufferline.setup({
    options = {
        numbers = function (opts)
            return string.format("%s", opts.id)
        end,
    },
})
