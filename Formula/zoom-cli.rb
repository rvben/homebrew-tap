class ZoomCli < Formula
  desc "CLI for Zoom"
  homepage "https://github.com/rvben/zoom-cli"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.4/zoom-cli-v0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "0518c0b5d8bbf8c69745798156ae19cf06721538804bb190398674a30c98e623"
    else
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.4/zoom-cli-v0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "bb5e1ae4de7016753fd0a134aa8cd435c0707ee92717ebc2fa5a83263d0744aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.4/zoom-cli-v0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8a8e88143d02d85e4abe56f6a65839f0b896189d230589e59ea92f35eb0dc6b1"
    else
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.4/zoom-cli-v0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c3bd7f0429d062e6f4389fc219274f542fdc778e6be9232c0b3cfc3fa4e9e2c"
    end
  end

  def install
    bin.install "zoom"
  end

  test do
    system "#{bin}/zoom", "--version"
  end
end
