class TasmotaCli < Formula
  desc "Unofficial CLI for managing Tasmota smart devices over HTTP"
  homepage "https://github.com/rvben/tasmota-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.2.0/tasmota-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "923ef4e4c9595e4a7f204f357d388ce9c5a431efd8db7bb639fccdfd6e305b3c"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.2.0/tasmota-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "953e499e72059322ab37e8f9eafc5fc554f01df1935149676ead28e622ddee1f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.2.0/tasmota-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "04790c772e881ba5dd305e03a37eeaaebe51f46a39ec1e40edd1c5a6856f2ba5"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.2.0/tasmota-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "81536c0858c0eb80d8ad52690fd52589302acd7a3f9e720292dcca9e34cf9d05"
    end
  end

  def install
    bin.install "tasmota"
  end

  test do
    system "#{bin}/tasmota", "--version"
  end
end
