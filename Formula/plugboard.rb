class Plugboard < Formula
  desc "Unofficial web dashboard and admin for Tasmota and Shelly smart devices"
  homepage "https://github.com/rvben/plugboard"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/plugboard/releases/download/v0.2.3/plugboard-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "33ad502a84948e76eb45e7a9b4c11ce1125329cd98bdc5ed9325a8d139c4e2a0"
    else
      url "https://github.com/rvben/plugboard/releases/download/v0.2.3/plugboard-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "0abb831f9c5602b717d92b9c88d5632e05029ca6203de698aaed9c5fafe88dd2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/plugboard/releases/download/v0.2.3/plugboard-v0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf4e8a20c3d7f84bd7ef1c1b885588e5821f11b11fa3999fd395ee14eac12ede"
    else
      url "https://github.com/rvben/plugboard/releases/download/v0.2.3/plugboard-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8ab21de3910e3791f79d82f258a7c890ecf16714a308b161e1122c6c7f6f494b"
    end
  end

  def install
    bin.install "plugboard"
  end

  test do
    system "#{bin}/plugboard", "--version"
  end
end
