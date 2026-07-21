class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.38/husker-v0.4.38-aarch64-apple-darwin.tar.gz"
      sha256 "fa9d3e73824cb5a1f736b985ae06b330bd64631b6b671a1d463723d7ad9cb7e3"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.38/husker-v0.4.38-x86_64-apple-darwin.tar.gz"
      sha256 "0d094c23a9f31dbbf67930ee6debb2c09a3725853fb8b4ea4d25cb0eb4434127"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.38/husker-v0.4.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1b5b5d3cf9a9653605fc4fcb5fdc0a184aad65755b431b678e11901b2e286c41"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.38/husker-v0.4.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd3f26304f8b4ee3b5da59efb65ec53e68d0ec1ee1944922fc75ad2e977f6399"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
