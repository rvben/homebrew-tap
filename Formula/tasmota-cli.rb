class TasmotaCli < Formula
  desc "Unofficial CLI for managing Tasmota smart devices over HTTP"
  homepage "https://github.com/rvben/tasmota-cli"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.2/tasmota-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "111cc2ecb6f0aeb39ed2d9cf7da393c59d0c2e509c074af666178f3f86aba383"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.2/tasmota-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "d502fc6e24bdd2e7242f8c605056cb412fe311502af3f126267548142ef5c2da"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.2/tasmota-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "32f1792375e5e16f53ae3a4f655438bc159519903f2880f557412dd3a3529cf4"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.2/tasmota-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d70e54a682b1592eebb01c2e954579955b7fe8e5f0718751a5a46436265772e"
    end
  end

  def install
    bin.install "tasmota"
  end

  test do
    system "#{bin}/tasmota", "--version"
  end
end
