class TasmotaCli < Formula
  desc "Unofficial CLI for managing Tasmota smart devices over HTTP"
  homepage "https://github.com/rvben/tasmota-cli"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.2.3/tasmota-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "32cbe8ee579d9bc0e59aaeae433c2cf0950dec1ddcbfe7e3304c52f9e28ff5f5"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.2.3/tasmota-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "f6b1f6dfb6dccb3ebbbbd0d6a55c9796c956b3b8820c745db39b0d19d82fca20"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.2.3/tasmota-v0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cb6cdd850b94a902328bf6d18daa689c7e7db063b50c6d1c2ca0515c50282401"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.2.3/tasmota-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b632c58e7c74dd4eddb8580caf48bacfd9db0c35d8d3d9f970da732300c4f7ac"
    end
  end

  def install
    bin.install "tasmota"
  end

  test do
    system "#{bin}/tasmota", "--version"
  end
end
