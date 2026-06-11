cask "simcam" do
  version "1.7,26"
  sha256 "346499ed657f75962467c2502b20b129cb2a00a00f96af041ccc84f55695f7d6"

  url "https://updates.simcam.swmansion.com/artifacts/SimCam-#{version.csv.first}-#{version.csv.second}.dmg"
  name "SimCam"
  desc "Control virtual camera of your iOS Simulator using menubar app or a CLI: stream your Mac's webcam, inject an image, or generate a QR code."
  homepage "https://simcam.swmansion.com/"

  livecheck do
    url "https://updates.simcam.swmansion.com/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sequoia

  app "SimCam.app"
  binary "#{appdir}/SimCam.app/Contents/MacOS/simcamctl"

  uninstall quit: "com.swmansion.SimCam"

  zap trash: [
    "~/Library/Application Support/com.swmansion.SimCam",
    "~/Library/Caches/com.swmansion.SimCam",
    "~/Library/HTTPStorages/com.swmansion.SimCam",
    "~/Library/Preferences/com.swmansion.SimCam.plist",
    "~/Library/Saved Application State/com.swmansion.SimCam.savedState",
  ]
end
