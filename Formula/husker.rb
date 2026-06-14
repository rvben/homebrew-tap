class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.14/husker-v0.4.14-aarch64-apple-darwin.tar.gz"
      sha256 "3ac1e6fe3019efe029dbaaaa48a3ab38e9fa123522f7a4ff0d4189a1a50c01a8"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.14/husker-v0.4.14-x86_64-apple-darwin.tar.gz"
      sha256 "5660a7ec5a455f894da10370e433b25c74f569aa33d9bf0755259e222f15d2fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.14/husker-v0.4.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a95e79f6c2cb63ddfabe083d88d3c18f89d7dbf9eab9c18c7f536b833883414e"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.14/husker-v0.4.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ebfdb6f73bba9c93ee3b3a136d81e99c96242fa811f104d951b3e617ef189ec"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
