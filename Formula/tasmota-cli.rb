class TasmotaCli < Formula
  desc "Unofficial CLI for managing Tasmota smart devices over HTTP"
  homepage "https://github.com/rvben/tasmota-cli"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.2/tasmota-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "ae312353b78c3f10a67283be097a2abf71e5b737b5e3c1e6f890ad044f13c025"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.2/tasmota-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "a28c958d3532f97acf352b41ab6c555d5161bad5c69fdabfe0a40207078ccc1b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.2/tasmota-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "08860bce0ec965ddc0cd5284663f9ebc847160ce8ac4b1dc6116b473dd66a8ed"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.2/tasmota-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a43ba22514819c0b8472c44935bb0a386ae9afd1ad1b4109847b35742c5bc6b"
    end
  end

  def install
    bin.install "tasmota"
  end

  test do
    system "#{bin}/tasmota", "--version"
  end
end
