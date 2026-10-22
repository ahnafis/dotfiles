local api = require("utils.api")

api.nmap("<A-c>", "<Plug>CommentaryLine", { desc = "Comment out a line" })
api.vmap("<A-c>", "<Plug>Commentary", { desc = "Comment out selected line(s)" })
