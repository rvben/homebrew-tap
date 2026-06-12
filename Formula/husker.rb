class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.8/husker-v0.4.8-aarch64-apple-darwin.tar.gz"
      sha256 "40b4be9265c9b94c24289b88c30e72cf01e3daef593854b33397af33d2b382b2"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.8/husker-v0.4.8-x86_64-apple-darwin.tar.gz"
      sha256 "7b62c4ae9852716bacccf6a4798e890bbb7586d4cb79afdc17922f8bb2c01031"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.8/husker-v0.4.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "881438b7f72f21a1037c4b39c49e4d8f589df1cf52d714e877fa7a3f42a591a1"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.8/husker-v0.4.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d3bfdada659e543e04253c674a7f39211e395e3cfa4fd9c2dfd4a439ce3b71fc"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
