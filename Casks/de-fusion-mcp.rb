cask "de-fusion-mcp" do
  version "0.1.3"
  sha256 "7b93d9973562a9d200afac415e8364831f580308f72f2a14f1296e331d231ca1"

  url "https://github.com/securityvoid/de-fusion-mcp/releases/download/v#{version}/de-fusion-mcp-#{version}.tar.gz"
  name "De-Fusion MCP"
  desc "Model Context Protocol (MCP) server add-in for Autodesk Fusion CAD"
  homepage "https://github.com/securityvoid/de-fusion-mcp"

  depends_on :macos
  depends_on formula: "python@3.13"

  installer script: {
    executable: "#{HOMEBREW_PREFIX}/opt/python@3.13/bin/python3.13",
    args:       ["#{staged_path}/de-fusion-mcp-#{version}/install.py", "--copy"],
  }

  uninstall script: {
    executable:   "#{HOMEBREW_PREFIX}/opt/python@3.13/bin/python3.13",
    args:         ["#{staged_path}/de-fusion-mcp-#{version}/install.py", "--uninstall"],
    must_succeed: false,
  }

  caveats <<~EOS
    In Fusion, open Utilities > Add-Ins and tick "Run on Startup" for De-Fusion (brew cannot tick it).
    Use the "De-Fusion Setup" button to write MCP client configs.
  EOS
end
