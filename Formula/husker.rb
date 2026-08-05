class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.40/husker-v0.4.40-aarch64-apple-darwin.tar.gz"
      sha256 "8ea9f21536fc446a1125ed543247b94cfd2e6b6785f1b5870cca4935ca0c8bbc"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.40/husker-v0.4.40-x86_64-apple-darwin.tar.gz"
      sha256 "c94aad048b85be193aec6db0e052d2eb4c18eeed514fd3b07294cbb23dfefb82"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.40/husker-v0.4.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2e3a475098d975f421d61fbfb5992d57ff89c8ba583fc35b4769fef3f4b2130a"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.40/husker-v0.4.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5e6a53d61cf2f1d5de0c1344f2cf76e10edcff4193fc482fd5d327cc0a45741"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
