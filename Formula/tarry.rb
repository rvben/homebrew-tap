class Tarry < Formula
  desc "Block until a condition holds, then print one compact verdict"
  homepage "https://github.com/rvben/tarry"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tarry/releases/download/v0.1.1/tarry-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "891b1529418ab7510b231daea140c02b0fda9382d5491827cc4c8be5e6dd6ad2"
    else
      url "https://github.com/rvben/tarry/releases/download/v0.1.1/tarry-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "ad3e2d1ce5fac16201664a704053d0f6cdbc93b745ce9b35f6ebff010ccdacde"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tarry/releases/download/v0.1.1/tarry-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d5ac6cb718f29ff04884c80f9ad9ac5df7e4b244337a0452c64903a52f85f062"
    else
      url "https://github.com/rvben/tarry/releases/download/v0.1.1/tarry-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3aa6586d58cfd0b33267cfe3999c4884e2041f378e6133ea777158c4a9f5af2d"
    end
  end

  def install
    bin.install "tarry"
  end

  test do
    system "#{bin}/tarry", "--version"
  end
end
