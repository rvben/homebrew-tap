class HomeassistantCli < Formula
  desc "CLI for Home Assistant"
  homepage "https://github.com/rvben/homeassistant-cli"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.4/homeassistant-cli-v0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "8d6cc2d959d4ca41c8a2ea7263f270faaec58d6ea3efd4893039b4cfe8dc138e"
    else
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.4/homeassistant-cli-v0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "a6205a00445c5d07ec491b5b36c01434b5151b0c3a7402ba8db15f27e70f04e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.4/homeassistant-cli-v0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4638669bd1f78d7fd7985f6412394dacfe0df209aa92a0bf8e7699862e475603"
    else
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.4/homeassistant-cli-v0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "087165a3b3fd6e759ce668147561d8240125fa8a63f1aba71bbdcec3b5728c1b"
    end
  end

  def install
    bin.install "ha"
  end

  test do
    system "#{bin}/ha", "--version"
  end
end
