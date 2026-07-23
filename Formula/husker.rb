class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.39/husker-v0.4.39-aarch64-apple-darwin.tar.gz"
      sha256 "3f9f17b26aeb77e020835221d472df441ee139fb4dc5268312d5d7c9e1c3cc56"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.39/husker-v0.4.39-x86_64-apple-darwin.tar.gz"
      sha256 "0c42a36c8dea3f1f6f4953f21f5bbf1975f2fd9ea649bf2b8dbd74708b4f198e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.39/husker-v0.4.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "669c0c93893dc5ca11974a56428b201c579936e46ada322c78a88ab0e6791ec6"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.39/husker-v0.4.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "73e6ac96bb902d0cf50f8171e8a3b4740549ae4dfb52feee69b25c1256002df8"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
