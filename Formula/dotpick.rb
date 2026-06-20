class Dotpick < Formula
  desc "Token-minimal field projection over JSON, YAML, TOML and NDJSON"
  homepage "https://github.com/rvben/dotpick"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/dotpick/releases/download/v0.1.0/dotpick-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "4e4651326599f54147cc23258208c46e980e61bd7eb755c03143a71fb46e83d2"
    else
      url "https://github.com/rvben/dotpick/releases/download/v0.1.0/dotpick-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "5f44a6d5b72d146cdc93f1bc1c27377d08c87c1fcc77a8d527f7e495bd317a71"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/dotpick/releases/download/v0.1.0/dotpick-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "be16e3e7a7a43d5a937d27ddee0526369a8f9022c94280fe3db84eadb47508dd"
    else
      url "https://github.com/rvben/dotpick/releases/download/v0.1.0/dotpick-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "103f77763e3914ee1aafc1b914ae7f503fa5176a655979be7e3c1a47dc34b936"
    end
  end

  def install
    bin.install "dotpick"
  end

  test do
    system "#{bin}/dotpick", "--version"
  end
end
