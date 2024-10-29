return {
  version = "19.1.2",
  cmd = {
    "clangd-19",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders=0",
  },
  filetypes = { "h", "hpp", "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  single_file_support = true,
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    offsetEncoding = { "utf-8", "utf-16" },
  },
  setup = {
    require "clangd_extensions",
  },
}
