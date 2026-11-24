cask "vphone-launchpad" do
  version "2.17.1"
  sha256 "ebe3f61ce34cb74745049556a3a9749cc6cd701783320e07493f7ec652ba53ba"

  url "https://github.com/securityvoid/vphone-cli/releases/download/#{version}/vphone-launchpad-#{version}-notarized.zip"
  name "vphone-launchpad"
  desc "Launchpad for the vphone virtual iPhone"
  homepage "https://github.com/securityvoid/vphone-cli"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on cask: "securityvoid/tap/vphone-skills"
  depends_on macos: :sequoia

  app "vphone-launchpad.app"
  binary "#{appdir}/vphone-launchpad.app/Contents/MacOS/vphone-launchpad-cli"

  uninstall_postflight_steps do
    run "/bin/echo", print_stdout: true, args: [
      "To also remove the vphone agent skills:",
      "brew uninstall --cask securityvoid/tap/vphone-skills",
    ]
  end

  caveats <<~EOS
    Open Launchpad once to complete Host Setup, then run:
      vphone-launchpad-cli bundle install-release #{version}
  EOS
end
