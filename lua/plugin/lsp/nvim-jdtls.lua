-- NOTE: Java LSP support via jdtls

return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  opts = {
    cmd = { "jdtls" },
    root_dir = function()
      return require("jdtls.setup").find_root({ "gradlew", ".git", "mvnw" })
    end,
    settings = {
      java = {
        signatureHelp = { enabled = true },
        completion = {
          favoriteStaticMembers = {
            "org.junit.jupiter.api.Assertions.*",
            "java.util.Objects.requireNonNull",
            "java.util.stream.Collectors.toList",
          },
        },
      },
    },
    init_options = {
      bundles = {},
    },
  },
  config = function(_, opts)
    require("jdtls").start_or_attach(opts)
  end,
}
