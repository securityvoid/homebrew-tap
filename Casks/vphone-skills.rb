cask "vphone-skills" do
  version "2.17.2"
  sha256 "4227953acf640f00726cf13f41225e0d9a0314e263cad552f4d1962630fc19f1"

  url "https://github.com/securityvoid/vphone-cli/releases/download/#{version}/vphone-skills-#{version}.zip"
  name "vphone-skills"
  desc "Agent skills for vphone"
  homepage "https://github.com/securityvoid/vphone-cli"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  binary "Skills/vphone-guest-control", target: "#{Dir.home}/.claude/skills/vphone-guest-control"
  binary "Skills/vphone-guest-control", target: "#{Dir.home}/.codex/skills/vphone-guest-control"
  binary "Skills/authoring-patch-sets", target: "#{Dir.home}/.claude/skills/authoring-patch-sets"
  binary "Skills/authoring-patch-sets", target: "#{Dir.home}/.codex/skills/authoring-patch-sets"
  binary "Skills/kernel-analysis-vphone600", target: "#{Dir.home}/.claude/skills/kernel-analysis-vphone600"
  binary "Skills/kernel-analysis-vphone600", target: "#{Dir.home}/.codex/skills/kernel-analysis-vphone600"
end
