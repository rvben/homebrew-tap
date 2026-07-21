class Plugboard < Formula
  desc "Unofficial web dashboard and admin for Tasmota and Shelly smart devices"
  homepage "https://github.com/rvben/plugboard"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/plugboard/releases/download/v0.2.1/plugboard-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "191161c9f16342dc5b17086bc477c9302e99bdf850168d986b36bbeef813b176"
    else
      url "https://github.com/rvben/plugboard/releases/download/v0.2.1/plugboard-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "5099f6135ae4a87814e6c0f87768979cb4c7106c6ad361e2c78351d524996145"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/plugboard/releases/download/v0.2.1/plugboard-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6ce0d0a97cd299387d444eccbbd101432469e298973006b72b9f6e92e1493d28"
    else
      url "https://github.com/rvben/plugboard/releases/download/v0.2.1/plugboard-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7d9193bfbcc4356a3c38b473bfc0db37f0828f0380d49a56808020f91eaab7ad"
    end
  end

  def install
    bin.install "plugboard"
  end

  test do
    system "#{bin}/plugboard", "--version"
  end
end
