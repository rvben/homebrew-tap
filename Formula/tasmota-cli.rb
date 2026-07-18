class TasmotaCli < Formula
  desc "Unofficial CLI for managing Tasmota smart devices over HTTP"
  homepage "https://github.com/rvben/tasmota-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.1/tasmota-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "c554070373e5cba7f5ce4d60bd5d54135cb180e0a413d576ab05062b56b97018"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.1/tasmota-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "c061da2f93ee79f3f1d389c3d9cc98d0b668cc2d819efd28d1f1a00d0c3abd8e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.1/tasmota-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "33d57ea35af5dab5946a0b1a4da16acb22ae68561d914257088ba5f71c18a207"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.1/tasmota-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f5597ebb11154258b531e6b15a1b73c8d49a240de0222192919ca80154bf3747"
    end
  end

  def install
    bin.install "tasmota"
  end

  test do
    system "#{bin}/tasmota", "--version"
  end
end
