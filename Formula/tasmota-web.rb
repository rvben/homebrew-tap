class TasmotaWeb < Formula
  desc "Unofficial web dashboard and admin for Tasmota smart devices"
  homepage "https://github.com/rvben/tasmota-web"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-web/releases/download/v0.1.2/tasmota-web-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "38f4f651a3def561bc31a9241252e37b21f35a16ad6895d76ca83bed37f87020"
    else
      url "https://github.com/rvben/tasmota-web/releases/download/v0.1.2/tasmota-web-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "6c8d6ab8ea1d3cca62578a15510a7a59b4dd1ddc01892ae126bc3b978c03d96f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-web/releases/download/v0.1.2/tasmota-web-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "20f8ca28f4e71d6c9c9428468df4f79241578d577e9d72bd8403b9be10290bc5"
    else
      url "https://github.com/rvben/tasmota-web/releases/download/v0.1.2/tasmota-web-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "462ed1c60b4b2ec8062e5fd9217d1467263ccb95551ffadbe717286bb6ca0b5a"
    end
  end

  def install
    bin.install "tasmota-web"
  end

  test do
    system "#{bin}/tasmota-web", "--version"
  end
end
