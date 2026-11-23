cask "simcam" do
  version "2.0,36"
  sha256 "e34c140f3ce81b8c71540e843eccb4a14bd296bc4de0bec2f694210129d94f2c"

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
