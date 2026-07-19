class TasmotaWeb < Formula
  desc "Unofficial web dashboard and admin for Tasmota smart devices"
  homepage "https://github.com/rvben/tasmota-web"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-web/releases/download/v0.1.1/tasmota-web-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "570cd4b9ecf4af986c65cbf319753d51f77e91dc1c1452c5793d6dac19f859a2"
    else
      url "https://github.com/rvben/tasmota-web/releases/download/v0.1.1/tasmota-web-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "8f14f611d0ee550cd6dad8835834f4c4b3c14b46cfc996da3436869974dec440"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-web/releases/download/v0.1.1/tasmota-web-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e18aacc697f0441470e39e691c8908e3a708768436063ba97efe481daf8f9f61"
    else
      url "https://github.com/rvben/tasmota-web/releases/download/v0.1.1/tasmota-web-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b96f10b612f2d84316467ac6a2539f2fb40f9509ff457a96856fa2226247e4b"
    end
  end

  def install
    bin.install "tasmota-web"
  end

  test do
    system "#{bin}/tasmota-web", "--version"
  end
end
