class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.3/vership-v0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "3535adb8402940331ec632648f394ce04e1c6f8628d0b8363c4ca16a6a9cefc8"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.3/vership-v0.5.3-x86_64-apple-darwin.tar.gz"
      sha256 "536e00c1da47d060d16c5fcb70d6ec97f29ef96e36fc7123034b6a8ed9d6f755"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.3/vership-v0.5.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f5fe812d7571aa4bc132be337f92e5ed33abc0d66f423768fb6833bf6af4c1be"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.3/vership-v0.5.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dda9dd8eeb9a76ab51d9eaffe48eb7973746d372c5f73095ac0ba0ee898f9882"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
