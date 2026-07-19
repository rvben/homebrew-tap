class TasmotaCli < Formula
  desc "Unofficial CLI for managing Tasmota smart devices over HTTP"
  homepage "https://github.com/rvben/tasmota-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.1/tasmota-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "eb9ed4d0a716d85f730afe2b74aeeacf7b060972d08195e2cb835f9fba869655"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.1/tasmota-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "5f79f764f58666d8f3d7b9a661088bad7ade0effdae25cea5100d69922019ef9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.1/tasmota-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5bc5080a53801de56ff858becf655d2cbfccc23c0618a95c0889ea0f60584362"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.1.1/tasmota-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4412c6bfe0162b280349a44d27a8c37dcbcee31f50bafe2f97bb17460f2fe433"
    end
  end

  def install
    bin.install "tasmota"
  end

  test do
    system "#{bin}/tasmota", "--version"
  end
end
