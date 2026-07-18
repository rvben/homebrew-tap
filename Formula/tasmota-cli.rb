class TasmotaCli < Formula
  desc "Unofficial CLI for managing Tasmota smart devices over HTTP"
  homepage "https://github.com/rvben/tasmota-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.0/tasmota-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "5c92578e555f33a9c70b76506195726c0b3250c652b8292c67491ed172beab1f"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.0/tasmota-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "f91320ab038a46b6c9f82e3dea01b1591a25d3a8793e7e2bb788c6584b48a4b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.0/tasmota-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8a40ea796bacaeb3cb09e1fc7b9df4b0884d68c08c44741dc7f8ddf24c390767"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.0/tasmota-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "52e93f2255b9db4641ed061f5a5b10474019a68a8cf01788b235e40d691c8972"
    end
  end

  def install
    bin.install "tasmota"
  end

  test do
    system "#{bin}/tasmota", "--version"
  end
end
