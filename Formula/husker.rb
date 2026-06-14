class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.13/husker-v0.4.13-aarch64-apple-darwin.tar.gz"
      sha256 "efcb419c299e209ba93c2c786fa35960a6d99adc9871dfc62604c4c71829d5d3"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.13/husker-v0.4.13-x86_64-apple-darwin.tar.gz"
      sha256 "e5b40eb44c9ae8e3b50e42c7e06b05cbec9342cfa2d6f13163dbe5e6055345c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.13/husker-v0.4.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "80157d1db1fd1e06f28fe13d624d2d2b1ce46b92beaacea3d67bc4f5a87e0f8d"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.13/husker-v0.4.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d6c14ca8a017cba4f075738de56b3c6246cf08e9d372a569b565eb7dad14c5c"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
