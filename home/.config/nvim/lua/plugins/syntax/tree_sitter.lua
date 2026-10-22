local api = require("utils.api")

local parsers = {
	asm = "asm",
	bash = "bash",
	c = "c",
	cmake = "cmake",
	cpp = "cpp",
	html = "html",
	lua = "lua",
	luadoc = "luadoc",
	make = "make",
	markdown = "markdown",
	markdown_inline = "markdown_inline",
	python = "python",
	regex = "regex",
	sql = "sql",
	typescript = "typescript",
	typescriptreact = "tsx",
	yaml = "yaml",
}

local treesitter = require("nvim-treesitter")

treesitter.install(vim.tbl_values(parsers))

api.autocmd("FileType", {
	pattern = vim.tbl_keys(parsers),
	callback = function(args)
		vim.treesitter.start(args.buf, parsers[vim.bo[args.buf].filetype])
	end,
})
