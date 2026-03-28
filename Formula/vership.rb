class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.3.1/vership-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "ad0fc5bbed40d79a50eecc0b436c5098eaae0e8792005b9c1a2510ba6acf2c39"
    else
      url "https://github.com/rvben/vership/releases/download/v0.3.1/vership-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "8ab937d3f2eca38d9bc590b4a52d4b8a8ff267259f8e897bbf515e3c1302378e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.3.1/vership-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1dd3f6191feaf828f9d7c604760e18fcdae2dfdbbd35d4eac83f7fb1423855bc"
    else
      url "https://github.com/rvben/vership/releases/download/v0.3.1/vership-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "86ed4c1fb4d18dc0344d78abcb9c5d0cbb248651471509c925dbb8245de302b2"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
