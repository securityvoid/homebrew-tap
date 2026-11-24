cask "vphone-launchpad" do
  version "2.17.0"
  sha256 "ebe3f61ce34cb74745049556a3a9749cc6cd701783320e07493f7ec652ba53ba"

  url "https://github.com/securityvoid/vphone-cli/releases/download/#{version}/vphone-launchpad-#{version}-notarized.zip"
  name "vphone-launchpad"
  desc "Launchpad for the vphone virtual iPhone"
  homepage "https://github.com/securityvoid/vphone-cli"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on cask: "securityvoid/tap/vphone-skills"

  app "vphone-launchpad.app"
  binary "#{appdir}/vphone-launchpad.app/Contents/MacOS/vphone-launchpad-cli"

  caveats <<~EOS
    Open Launchpad once to complete Host Setup, then run:
      vphone-launchpad-cli bundle install-release #{version}
  EOS
end
