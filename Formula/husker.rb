class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.15/husker-v0.4.15-aarch64-apple-darwin.tar.gz"
      sha256 "159ecce1e9a3fe59d4632e3344fb7a0bb84aadac760821780ab89835236fefbb"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.15/husker-v0.4.15-x86_64-apple-darwin.tar.gz"
      sha256 "3532fd19e23bb27e389c39fd16c8040d23ef24ac3b815085801d58dc04a6c93e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.15/husker-v0.4.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e43fe1263763e7dbefea005a936b48df8bfe5a74d0ee20f12af6122d5ae2366a"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.15/husker-v0.4.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "954ca82c519c35a7056b63d34b7729e9b757311ba4ddb746b3040050a8406e6c"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
