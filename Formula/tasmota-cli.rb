class TasmotaCli < Formula
  desc "Unofficial CLI for managing Tasmota smart devices over HTTP"
  homepage "https://github.com/rvben/tasmota-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.2.1/tasmota-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "f461485a3de061328e56e5a5d5fb4fbe7f08be331a677d015636d07432a777e4"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.2.1/tasmota-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "c1f7326ac68a682c29672b2dc44f34997a1cb9b6f94dffb46a6daba94f7785b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.2.1/tasmota-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0748a10cbb1293e7ff9aaf41e6acdd4bb970767ae97b894500afebc026cfb488"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.2.1/tasmota-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d8eae19067dffc80184bd6c56392e4c413837af0bb7b5a01063fbbd7177b5931"
    end
  end

  def install
    bin.install "tasmota"
  end

  test do
    system "#{bin}/tasmota", "--version"
  end
end
