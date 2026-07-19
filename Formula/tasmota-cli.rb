class TasmotaCli < Formula
  desc "Unofficial CLI for managing Tasmota smart devices over HTTP"
  homepage "https://github.com/rvben/tasmota-cli"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.3/tasmota-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "2028805fa2844bbe48b7da4f36fe411269a1459749c2adccaa7befef039efc81"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.3/tasmota-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "e4bfb7244d9457ad5f8f059c9f6c21248bc98046f452d7de4bc554c3d4a2a739"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.3/tasmota-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "22b11378d3eee5bd12dc7b9b9eb5ca7b33fe1c55e29e1980045f7b00b0209e34"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.3/tasmota-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6697059c36d783cf1f29d8c0c5cdc5703bbb1d317c3e041f4228677cd1f4350a"
    end
  end

  def install
    bin.install "tasmota"
  end

  test do
    system "#{bin}/tasmota", "--version"
  end
end
