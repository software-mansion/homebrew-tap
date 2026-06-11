# Software Mansion Homebrew Tap

Homebrew tap for Software Mansion tools, including SimCam.

## Install SimCam

```bash
brew tap software-mansion/tap
brew install --cask simcam
```

You can also install it in one command:

```bash
brew install --cask software-mansion/tap/simcam
```

## CI Setup

```bash
brew tap software-mansion/tap
brew install --cask --appdir="$HOME/Applications" simcam
simcamctl license activate "$SIMCAM_LICENSE_KEY"
simcamctl
```

Run `simcamctl` before launching the simulator app that should use SimCam.
