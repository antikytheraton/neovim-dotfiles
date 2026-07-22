-- ~/.config/nvim/ftplugin/java.lua
local jdtls = require("jdtls")

local mason_registry = require("mason-registry")
local jdtls_pkg = mason_registry.get_package("jdtls")
local jdtls_path = jdtls_pkg:get_install_path()

local java_debug = mason_registry.get_package("java-debug-adapter"):get_install_path()
local java_test = mason_registry.get_package("java-test"):get_install_path()

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

local capabilities = require("blink.cmp").get_lsp_capabilities()

local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-jar", vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration", jdtls_path .. "/config_linux",
    "-data", workspace_dir,
  },
  root_dir = require("jdtls.setup").find_root({ "pom.xml", "gradlew", ".git", "mvnw" }),
  capabilities = capabilities,
  settings = {
    java = {
      configuration = {
        runtimes = {
          -- point this at whatever JAVA_HOME your flake shell exports
          { name = "JavaSE-25", path = os.getenv("JAVA_HOME") },
        },
      },
    },
  },
  init_options = {
    bundles = {
      vim.fn.glob(java_debug .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", true),
      unpack(vim.split(vim.fn.glob(java_test .. "/extension/server/*.jar", true), "\n")),
    },
  },
}

jdtls.start_or_attach(config)

-- Java-specific keymaps once jdtls attaches
vim.keymap.set("n", "<leader>jo", jdtls.organize_imports, { buffer = 0 })
vim.keymap.set("n", "<leader>jv", jdtls.extract_variable, { buffer = 0 })
vim.keymap.set("n", "<leader>jc", jdtls.extract_constant, { buffer = 0 })
vim.keymap.set("v", "<leader>jm", function() jdtls.extract_method(true) end, { buffer = 0 })
