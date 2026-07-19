class Tasmota < Formula
  desc "Unofficial CLI for managing Tasmota smart devices over HTTP"
  homepage "https://github.com/rvben/tasmota-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.0/tasmota-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "deb3d5120bfc1bbbf1671dc6590357889d937b01e6310da3b4e421a10cebc56a"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.0/tasmota-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "28f7a3dbdd860cbc0c4cfcd84d16bd4843b35c45a1d00a286763834fd3160a3a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.0/tasmota-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6813a8752df840032aedbb12263920470114b753ab05ac0e8e1f358dfb32435c"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.0/tasmota-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c90fab476a1a10b89f99e7e41483fa72bd28b3c5cbb3a01ceb382f061c218d46"
    end
  end

  def install
    bin.install "tasmota"
  end

  test do
    system "#{bin}/tasmota", "--version"
  end
end
