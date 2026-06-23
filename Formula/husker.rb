class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.17/husker-v0.4.17-aarch64-apple-darwin.tar.gz"
      sha256 "8e42ef5db3cf9e7b1d276a5c3edb5d0eb8e87d3d89b027de0fef533ee2a89ea1"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.17/husker-v0.4.17-x86_64-apple-darwin.tar.gz"
      sha256 "07dca322a3536a54bd2368bc6f01a68ba47312f0b21c485ba25723b80c6e07fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.17/husker-v0.4.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4f90f2a52f3bb1a9d57ccf9d2c6063c17a0c3ffca54c5f5a1064891577f49d5b"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.17/husker-v0.4.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c956ec6569eb85982b9628d8aaf47a1bd389eaec1aa7b5cd622dc1e69d26e527"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
