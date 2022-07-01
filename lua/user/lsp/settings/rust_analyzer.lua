return {
 settings = {
    ["rust-analyzer"] = {
      workspace = {
        -- assist = {
        --             importMergeBehaviour = "last",
        --             importPrefix = "by_self",
        --         },
        -- cargo = {
        --             loadOutDirsFromCheck = true
        --         },
        -- symbol = {
        --   search = {
        --     kind = "all_symbols"
        --   }
        -- },
        -- procMacro = {
        --             enable = true
        --         },
        checkOnSave = {
                    command = "clippy"
                }
      }
    },
  }
}
