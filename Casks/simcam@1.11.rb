cask "simcam@1.11" do
  version "1.11,30"
  sha256 "496e905c2329f3a59cd52f16c5082ab36f700af88a08cc810ab62ec8997f4f0e"

  url "https://updates.simcam.swmansion.com/artifacts/SimCam-#{version.csv.first}-#{version.csv.second}.dmg"
  name "SimCam"
  desc "Control virtual camera of your iOS Simulator using menubar app or a CLI: stream your Mac's webcam, inject an image, or generate a QR code."
  homepage "https://simcam.swmansion.com/"

  conflicts_with cask: "simcam"
  depends_on macos: :sequoia

  app "SimCam.app"
  binary "#{appdir}/SimCam.app/Contents/MacOS/simcamctl"

  postflight do
    system_command "/usr/bin/defaults",
                   args: ["write", "com.swmansion.SimCam", "SUEnableAutomaticChecks", "-bool", "false"]
    system_command "/usr/bin/defaults",
                   args: ["write", "com.swmansion.SimCam", "SUAutomaticallyUpdate", "-bool", "false"]
  end

  uninstall quit: "com.swmansion.SimCam"

  zap trash: [
    "~/Library/Application Support/com.swmansion.SimCam",
    "~/Library/Caches/com.swmansion.SimCam",
    "~/Library/HTTPStorages/com.swmansion.SimCam",
    "~/Library/Preferences/com.swmansion.SimCam.plist",
    "~/Library/Saved Application State/com.swmansion.SimCam.savedState",
  ]
end
