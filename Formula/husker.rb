class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.37/husker-v0.4.37-aarch64-apple-darwin.tar.gz"
      sha256 "25b5c997ef8b3f1727d75585c67ba3410a5b1d1652b8b5bd94f4de0dd3bbc55e"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.37/husker-v0.4.37-x86_64-apple-darwin.tar.gz"
      sha256 "fbc1d6ab2e8f76d33cc3414c3e87b140ecb7479b10b6abb95fc3abd38047a289"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.37/husker-v0.4.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6ef9a78e700232d58a2d193952df067b8e0c7270d6b71bad98011dbf23a2e417"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.37/husker-v0.4.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "695777ce5a2e198de0e6b699925323b94ea625f603fbfb0cf68ee2dac8423623"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
