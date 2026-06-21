class Clihatch < Formula
  desc "Scaffold a clispec-compliant, agent-facing Rust CLI in seconds"
  homepage "https://github.com/rvben/clihatch"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clihatch/releases/download/v0.1.4/clihatch-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "74905d8303a9905379560b86e3a4932e7f9e87768312fe6e0c9f26cf2076c1a6"
    else
      url "https://github.com/rvben/clihatch/releases/download/v0.1.4/clihatch-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "0e20bf2104ac31744aaa06675f1d82931718a1d734d13a3b8809a50e62696fee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clihatch/releases/download/v0.1.4/clihatch-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b11979c25648788f66d719af6d2e5cb226a2262865b0c2616d86601092c98013"
    else
      url "https://github.com/rvben/clihatch/releases/download/v0.1.4/clihatch-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5fa37abeded661bdf20271b983bdeb887bef0fb9167448fa9668b69401b0627"
    end
  end

  def install
    bin.install "clihatch"
  end

  test do
    system "#{bin}/clihatch", "--version"
  end
end
