class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.21/husker-v0.4.21-aarch64-apple-darwin.tar.gz"
      sha256 "7f71b6cb4e60410341f84bb2fb90429cd242bb7491c7b646cf33d734ba388de1"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.21/husker-v0.4.21-x86_64-apple-darwin.tar.gz"
      sha256 "d57bc4d03b27e4f8539041bd9cf09d65f51d0cbbbb4713a647f05445dd7b08fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.21/husker-v0.4.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b6c2b6c32699b60d4921f20cda1a851b5bb68dab6d45b18b0b129015ce1d62e3"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.21/husker-v0.4.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "28b67dfd2d40ec77e87dee45c4b0c76b004b3ab497dd1312abeb87355ed31a3c"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
