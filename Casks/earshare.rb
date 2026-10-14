# Homebrew cask published in https://github.com/tauruslabsofficial-tech/homebrew-tap
# Install: brew install --cask tauruslabsofficial-tech/tap/earshare
cask "earshare" do
  version "1.1.1"
  sha256 "68623da48b5149ad3e4e86a61ea6524eb83c5b3a5374bf55b7f25735f03d5611"

  url "https://github.com/tauruslabsofficial-tech/EarShare-releases/releases/download/v#{version}/EarShare.dmg"
  name "EarShare"
  desc "Play audio on several Bluetooth headphones at once"
  homepage "https://github.com/tauruslabsofficial-tech/EarShare-releases"

  auto_updates true
  depends_on macos: :ventura

  app "EarShare.app"

  # EarShare is free but not yet notarized (no paid Apple Developer ID), so Gatekeeper would
  # block the first launch. Clearing the download quarantine lets it open normally.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/EarShare.app"],
        writable_paths: ["EarShare.app"],
        writable_base:  :appdir
  end

  uninstall quit: "com.tauruslabs.earshare"

  zap trash: "~/Library/Preferences/com.tauruslabs.earshare.plist"
end
