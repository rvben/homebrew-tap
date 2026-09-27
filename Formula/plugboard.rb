class Plugboard < Formula
  desc "Unofficial web dashboard and admin for Tasmota and Shelly smart devices"
  homepage "https://github.com/rvben/plugboard"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/plugboard/releases/download/v0.2.2/plugboard-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "d7a4b42f62f222135f21a61f04aca17a0a56636806d932dfa9742fb0be8a6f9a"
    else
      url "https://github.com/rvben/plugboard/releases/download/v0.2.2/plugboard-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "84698f0ba5cf04381e0bc46c95ac164361990c6c2f8e473ca6979f11dd48a41e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/plugboard/releases/download/v0.2.2/plugboard-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "66a93c90ef0160f40388e93898dad5423a508a1f24825b88ef088d356dbd6010"
    else
      url "https://github.com/rvben/plugboard/releases/download/v0.2.2/plugboard-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "697549075da8071dfd507052d388f76908f52f1518fdbdbe1c1a9b6a4c00fdfa"
    end
  end

  def install
    bin.install "plugboard"
  end

  test do
    system "#{bin}/plugboard", "--version"
  end
end
