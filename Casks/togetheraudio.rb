# Homebrew cask published in https://github.com/tauruslabsofficial-tech/homebrew-tap
# Install: brew install --cask tauruslabsofficial-tech/tap/togetheraudio
cask "togetheraudio" do
  version "1.0.0"
  sha256 "03c482e416dfba7f4f6423e87f5da2b8b7bcac9473c94490260fe0277660ea4c"

  url "https://github.com/tauruslabsofficial-tech/TogetherAudio/releases/download/v#{version}/TogetherAudio.dmg"
  name "TogetherAudio"
  desc "Play audio on several Bluetooth headphones at once"
  homepage "https://github.com/tauruslabsofficial-tech/TogetherAudio"

  depends_on macos: :ventura

  app "TogetherAudio.app"

  # The app is open source but not notarized (no paid Apple Developer ID yet), so Gatekeeper
  # would block the first launch. Clearing the download quarantine lets it open normally.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/TogetherAudio.app"],
        writable_paths: ["TogetherAudio.app"],
        writable_base:  :appdir
  end

  uninstall quit: "com.tauruslabs.togetheraudio"

  zap trash: "~/Library/Preferences/com.tauruslabs.togetheraudio.plist"
end
