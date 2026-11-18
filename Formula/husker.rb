class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.58"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.58/husker-v0.4.58-aarch64-apple-darwin.tar.gz"
      sha256 "dcccd6f045d0dcbc5f42fbc1aa914eec84b9290e4b9390e3fce7b8b802e8463a"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.58/husker-v0.4.58-x86_64-apple-darwin.tar.gz"
      sha256 "90348eb2e37347d2875260df3cbbfdbcc7cf9d4de6562dff06f169e77f3d0682"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.58/husker-v0.4.58-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a3883ba7b94eec9652ec7a2ebd318a254935cdd54ead629819040bb364ff5764"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.58/husker-v0.4.58-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "320b9054b2808a3c6157d461776c91ae04ace4c3acff2d9bdae33369c15b8167"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
