-- Render-markdown.nvim: Render markdown as rich text in-place
-- Supports headings, lists, code blocks, etc.
return {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
        file_types = { 'markdown', 'Avante' },
    },
    ft = { 'markdown', 'Avante' },
}
