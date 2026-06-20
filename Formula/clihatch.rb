class Clihatch < Formula
  desc "Scaffold a clispec-compliant, agent-facing Rust CLI in seconds"
  homepage "https://github.com/rvben/clihatch"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clihatch/releases/download/v0.1.0/clihatch-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "ce722cbb70cec1b0e05c3b9fea0f64cf55c7880ad2174eb890d7e48e3b885001"
    else
      url "https://github.com/rvben/clihatch/releases/download/v0.1.0/clihatch-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "2db603d91c0ee929d44806772632441a375af177726cdba4029819d8a4cff3eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clihatch/releases/download/v0.1.0/clihatch-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "65d19e2389e3241020a6eb1ab67a1b7594cb7d8c86294a5a9aa0e396a1b55f60"
    else
      url "https://github.com/rvben/clihatch/releases/download/v0.1.0/clihatch-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c9552b04be48bc1c6af103c8ffd18c7590d7a7f2c9e952a4ac1dc5b0a50d9b2e"
    end
  end

  def install
    bin.install "clihatch"
  end

  test do
    system "#{bin}/clihatch", "--version"
  end
end
