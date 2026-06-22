class Clihatch < Formula
  desc "Scaffold a clispec-compliant, agent-facing Rust CLI in seconds"
  homepage "https://github.com/rvben/clihatch"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clihatch/releases/download/v0.1.5/clihatch-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "7cb756c09d1ef8aa9bc88283e5a4815b17cc9413b4ebb7cfef6e6fa80320fc17"
    else
      url "https://github.com/rvben/clihatch/releases/download/v0.1.5/clihatch-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "0df308f52a6cea7f5bfe1720351bbb5e528cf938f784cb0e1040132d94cc8241"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clihatch/releases/download/v0.1.5/clihatch-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7907bb737b07e4510d8be2b0a7182f5ed466259005dd90a7a88d6cf7483589bb"
    else
      url "https://github.com/rvben/clihatch/releases/download/v0.1.5/clihatch-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c1e686be11fe6c3eae613fd8594f814802f5df2ec4f6cb0822bed3c02b87d99"
    end
  end

  def install
    bin.install "clihatch"
  end

  test do
    system "#{bin}/clihatch", "--version"
  end
end
