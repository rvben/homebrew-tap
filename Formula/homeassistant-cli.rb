class HomeassistantCli < Formula
  desc "CLI for Home Assistant"
  homepage "https://github.com/rvben/homeassistant-cli"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.5/homeassistant-cli-v0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "b345b8f2a7178fef64d0e993016df22dbd629c36351b747639e17cc870099ac1"
    else
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.5/homeassistant-cli-v0.2.5-x86_64-apple-darwin.tar.gz"
      sha256 "da1447bcf0f56005567f1aa75befc14d0030a415f6099fe0c8feee360ca1ebbf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.5/homeassistant-cli-v0.2.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7fd452bc886899a8da5f211b17525eb3513829b1814a6ecb276e434b1aea3def"
    else
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.5/homeassistant-cli-v0.2.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b6c4c63d3e2d117a1bb2a50cce29e909204ced0246c599ddc9dbdca0c95de74"
    end
  end

  def install
    bin.install "ha"
  end

  test do
    system "#{bin}/ha", "--version"
  end
end
