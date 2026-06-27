class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.23/husker-v0.4.23-aarch64-apple-darwin.tar.gz"
      sha256 "3dc9eaf4c6294645e027ecb714f5c71e3660bd04e8d5963e73c128f467d5cfdf"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.23/husker-v0.4.23-x86_64-apple-darwin.tar.gz"
      sha256 "cc203777d568d948c6e50c75d4876a9a7a9a85f1dc56805806f565a165e7870b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.23/husker-v0.4.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0b3b585117d68c8f15f0727b4e0f248aa9783e8ebb3270aafa2f936a999ddd44"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.23/husker-v0.4.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d0df8319394c8e1dabfbd7157f05ceb34962366305b2d2290cee4055c807258f"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
