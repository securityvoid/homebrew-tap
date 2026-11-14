cask "de-fusion-mcp" do
  version "0.1.0"
  sha256 "87711be8481946c6b8a604b8b14c9c5639d7519cdcf51addef681a71cb7b1ce0"

  url "https://github.com/securityvoid/de-fusion-mcp/releases/download/v#{version}/de-fusion-mcp-#{version}.tar.gz"
  name "De-Fusion MCP"
  desc "MCP server add-in for Autodesk Fusion"
  homepage "https://github.com/securityvoid/de-fusion-mcp"

  depends_on :macos
  depends_on formula: "python@3.13"

  postflight do
    system_command "#{HOMEBREW_PREFIX}/opt/python@3.13/bin/python3.13",
                   args:         ["#{staged_path}/de-fusion-mcp-#{version}/install.py"],
                   must_succeed: true
  end

  uninstall_preflight do
    system_command "#{HOMEBREW_PREFIX}/opt/python@3.13/bin/python3.13",
                   args: ["#{staged_path}/de-fusion-mcp-#{version}/install.py", "--uninstall"]
  end

  caveats <<~EOS
    In Fusion, open Utilities > Add-Ins and tick "Run on Startup" for De-Fusion (brew cannot tick it).
    Use the "De-Fusion Setup" button to write MCP client configs.
  EOS
end
