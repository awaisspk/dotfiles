-- Attaches to every FileType mode
-- require 'colorizer'.setup(
-- )
require'colorizer'.setup({'*'}, {
    RGB = true,
    RRGGBB = true,
    RRGGBBAA = true,
    rgb_fn = true,
    hsl_fn = true,
    css = true,
    css_fn = true
})
