class TasmotaWeb < Formula
  desc "Unofficial web dashboard and admin for Tasmota smart devices"
  homepage "https://github.com/rvben/tasmota-web"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-web/releases/download/v0.1.0/tasmota-web-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "4cb22d0a41ca98028931cd2a64b395877079eaa9c14a5e5a09b3ed5ffbe55d1c"
    else
      url "https://github.com/rvben/tasmota-web/releases/download/v0.1.0/tasmota-web-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "4580ba634e9f7f291bca4aedbdcc2bd1a5304eae737707ec4b4639e959669b6e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-web/releases/download/v0.1.0/tasmota-web-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d63a9c74756839098ec1b45ca9ec9a7bdeea3fc51d1ffe47a4347baa35172b44"
    else
      url "https://github.com/rvben/tasmota-web/releases/download/v0.1.0/tasmota-web-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c3980f32fec45df7337952507f30f27d9eda858b2ccf5c578bdad0089697d16"
    end
  end

  def install
    bin.install "tasmota-web"
  end

  test do
    system "#{bin}/tasmota-web", "--version"
  end
end
