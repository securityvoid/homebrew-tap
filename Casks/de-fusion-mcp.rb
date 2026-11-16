cask "de-fusion-mcp" do
  version "0.1.5"
  sha256 "f5c48519bab2b30d8efa2aba947b87ff465fb7780d035713012159a40b2ed74d"

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
