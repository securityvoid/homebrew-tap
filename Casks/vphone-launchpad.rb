cask "vphone-launchpad" do
  version "2.17.1"
  sha256 "0e7d6cb2d26efa9d980d23801a24d987c793dece5f8e2111e291d4f271c99ebd"

  url "https://github.com/securityvoid/vphone-cli/releases/download/#{version}/vphone-launchpad-#{version}.zip"
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
