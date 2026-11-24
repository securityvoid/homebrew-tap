cask "vphone-skills" do
  version "2.17.0"
  sha256 "ed407d425793a8aaf14f2167479b11f621d26686e6fef810d8bf27c8f319c8bf"

  url "https://github.com/securityvoid/vphone-cli/releases/download/#{version}/vphone-skills-#{version}.zip"
  name "vphone-skills"
  desc "Agent skills for vphone"
  homepage "https://github.com/securityvoid/vphone-cli"

  depends_on arch: :arm64
  depends_on macos: ">= :sequoia"

  livecheck do
    url :url
    strategy :github_latest
  end

  artifact "Skills/vphone-guest-control", target: "#{Dir.home}/.claude/skills/vphone-guest-control"
  artifact "Skills/vphone-guest-control", target: "#{Dir.home}/.codex/skills/vphone-guest-control"
  artifact "Skills/authoring-patch-sets", target: "#{Dir.home}/.claude/skills/authoring-patch-sets"
  artifact "Skills/authoring-patch-sets", target: "#{Dir.home}/.codex/skills/authoring-patch-sets"
  artifact "Skills/kernel-analysis-vphone600", target: "#{Dir.home}/.claude/skills/kernel-analysis-vphone600"
  artifact "Skills/kernel-analysis-vphone600", target: "#{Dir.home}/.codex/skills/kernel-analysis-vphone600"
end
