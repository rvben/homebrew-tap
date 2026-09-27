class Tarry < Formula
  desc "Block until a condition holds, then print one compact verdict"
  homepage "https://github.com/rvben/tarry"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tarry/releases/download/v0.1.5/tarry-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "fc3cc4949eeb31548019c70cef32ccf8776e984960564c219dd363e1cd374e39"
    else
      url "https://github.com/rvben/tarry/releases/download/v0.1.5/tarry-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "b8196e9eb474799b28fbe5034f4a1a36408c029dc1aa5530a8f644f9a97d8dc6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tarry/releases/download/v0.1.5/tarry-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b64f0716a40688264fabe8898d2b1a7790072c9be1a07bdac64b255bc5cbfb61"
    else
      url "https://github.com/rvben/tarry/releases/download/v0.1.5/tarry-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9fdbf81a25e3d85eaffe24041e3779bc45b4847a704eda6532c870b85c4b602b"
    end
  end

  def install
    bin.install "tarry"
  end

  test do
    system "#{bin}/tarry", "--version"
  end
end
