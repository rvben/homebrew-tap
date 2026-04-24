class HomeassistantCli < Formula
  desc "CLI for Home Assistant"
  homepage "https://github.com/rvben/homeassistant-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.0/homeassistant-cli-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "d63e2b9ebb7282376d375f822b2a89ac4df5b7f7214b8e06ecddf82e0805d1e6"
    else
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.0/homeassistant-cli-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "cdffe72358a03bb2e0b72af371651a738e5237f4acff7657d49e90a160b85e7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.0/homeassistant-cli-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dcbf8dba5ecbdfccca35c37a20ef9661ff70fd0e1399c464f60943553e96c855"
    else
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.0/homeassistant-cli-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2849d16dcc7f083a9b55b6dca2c57cb96e00f6b2d4697b2df649f63ca9c58beb"
    end
  end

  def install
    bin.install "ha"
  end

  test do
    system "#{bin}/ha", "--version"
  end
end
