cask "simcam@1.12" do
  version "1.12,31"
  sha256 "6527a0db39c1b35cd31b8af7ecda63abc70f46192ca0e465addaded5c7d5fb8b"

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
