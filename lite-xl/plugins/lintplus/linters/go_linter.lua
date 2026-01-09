-- staticcheck plugin for lint+

--- CONFIG ---

-- config.lint.staticcheck_args: table[string]
--   passes the specified arguments to staticcheck

--- IMPLEMENTATION ---

local lintplus = require "plugins.lintplus"

lintplus.add("staticcheck") {
    filename = "%.go$",
    procedure = {
        command = lintplus.args_command(
            { "staticcheck",
                "-f", "text",
                lintplus.filename },
                "staticcheck_args"
        ),
        interpreter = lintplus.interpreter {
            error = "(.-):(%d+):(%d+): (.+)",
            warning = "(.-):(%d+):(%d+): (.+)",
        }
    },
}
