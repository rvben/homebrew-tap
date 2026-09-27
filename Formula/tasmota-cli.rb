class TasmotaCli < Formula
  desc "Unofficial CLI for managing Tasmota smart devices over HTTP"
  homepage "https://github.com/rvben/tasmota-cli"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.2.2/tasmota-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "f6e18420e53222704d323ae41b558fd98eed1a99f17b2265bb4f0b865accf7ee"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.2.2/tasmota-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "ed997b4cdc2745284e0b1bbb4ec6cb52cc9dd511b82439a7696912a7a62f1b0f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.2.2/tasmota-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf19887ddf49864735e712dce169132646d7c335dbb5c810f035bec94549ba7b"
    else
      url "https://github.com/rvben/tasmota-cli/releases/download/v0.2.2/tasmota-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e4b5213a8372b7630ba81cafec1b1bb62c66df4c318a3e7b2d7037e59798c8c9"
    end
  end

  def install
    bin.install "tasmota"
  end

  test do
    system "#{bin}/tasmota", "--version"
  end
end
