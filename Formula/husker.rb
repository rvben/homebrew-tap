class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.34/husker-v0.4.34-aarch64-apple-darwin.tar.gz"
      sha256 "42061e66803a1ce9ec14b7fc57adf6604b5d0b7d63b362d86b787944feb180ee"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.34/husker-v0.4.34-x86_64-apple-darwin.tar.gz"
      sha256 "c933d194f922e0e3c21e7e7ff54df752cf9071a9d010716196e0b64ccca0f920"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.34/husker-v0.4.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a02330da2b44964e984226a0fcf2d8fff0b7abfa6e35763514c75b646358157c"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.34/husker-v0.4.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "951ede140633a21d62ef43d464b4acf0f1026a9f3a486ae13999953b217ccbb0"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
