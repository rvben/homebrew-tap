class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.53"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.53/husker-v0.4.53-aarch64-apple-darwin.tar.gz"
      sha256 "d947afadde32c5b45a690dd1855684a2498d9c4c7b3b5effccf3c501a0d0009b"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.53/husker-v0.4.53-x86_64-apple-darwin.tar.gz"
      sha256 "cd34c5c4437756276db67b4835009c3492b0710c1211b96a46959f39e364b3ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.53/husker-v0.4.53-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "69178adb59be0168d1dc05cec34dcd2893f3b7e8b01a82ab9e35ff125f2c9c5c"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.53/husker-v0.4.53-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f55ec7bf26aa0ff62b1b3c3e5eb99b5786021d1e41e7d30bb91e47c285c4f55"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
