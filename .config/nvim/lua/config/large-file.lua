local max_bytes = 1024 * 1024
local max_lines = 20000

local function generated(name)
	return name:match("%.min%.[^/]+$")
		or name:match("%.generated%.[^/]+$")
		or name:match("_generated%.[^/]+$")
end

local function disable_highlighting(buf)
	if not vim.api.nvim_buf_is_valid(buf) or not vim.b[buf].large_file then
		return
	end
	if vim.bo[buf].syntax ~= "OFF" then
		vim.bo[buf].syntax = "OFF"
	end
	vim.bo[buf].indentexpr = ""
	vim.treesitter.stop(buf)
end

local group = vim.api.nvim_create_augroup("LargeFile", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
	group = group,
	callback = function(args)
		local stat = vim.uv.fs_stat(args.file)
		vim.b[args.buf].large_file = (stat and stat.size >= max_bytes or false)
			or not not generated(args.file)
	end,
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
	group = group,
	callback = function(args)
		local lines = vim.api.nvim_buf_line_count(args.buf)
		if lines >= max_lines or vim.api.nvim_buf_get_offset(args.buf, lines) >= max_bytes then
			vim.b[args.buf].large_file = true
		end
		disable_highlighting(args.buf)
	end,
})

-- FileType handlers can enable syntax, Treesitter, and indentexpr after BufReadPost.
vim.api.nvim_create_autocmd({ "FileType", "Syntax", "BufWinEnter" }, {
	group = group,
	callback = function(args)
		if vim.b[args.buf].large_file then
			vim.schedule(function()
				disable_highlighting(args.buf)
			end)
		end
	end,
})
