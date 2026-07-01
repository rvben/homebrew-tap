class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.29/husker-v0.4.29-aarch64-apple-darwin.tar.gz"
      sha256 "0de80d57e145d6022ebd9d774ccd149be719e6848f3ab0479ff155b1cb6e6c02"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.29/husker-v0.4.29-x86_64-apple-darwin.tar.gz"
      sha256 "6998e2d1781acd461845e8b7df0a09131e923ca6ea257e4bb9abdf2c8ad936ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.29/husker-v0.4.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3da141bc64e4b2540e1d4c9b312cf131e8fb47cf61f12d143faef8afa905d328"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.29/husker-v0.4.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "caa0e5f497644f564c27d68b1b86390eb09f5af66d799ce8bf3b342e848f8f3c"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
