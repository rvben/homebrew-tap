class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.18/vership-v0.5.18-aarch64-apple-darwin.tar.gz"
      sha256 "4196ded7562773d2dab541763449942d288abe67cbcd1829ecdb6f3c18c42d62"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.18/vership-v0.5.18-x86_64-apple-darwin.tar.gz"
      sha256 "19114e9ffe5814b1e12456112abfd93717fced009183c2b6be99a0d3bf21b635"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.18/vership-v0.5.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "833ec47d8a7ffb8b911e5d024a239c28961629db3ec95d45c1a2b886fc6a6de9"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.18/vership-v0.5.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7103f42549dfd4941ab94b799565924199dc63587117b3973bc0a461cfe7c58"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
