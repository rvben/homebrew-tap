class ZoomCli < Formula
  desc "CLI for Zoom"
  homepage "https://github.com/rvben/zoom-cli"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.6/zoom-cli-v0.2.6-aarch64-apple-darwin.tar.gz"
      sha256 "b8d6f20b658a7780dc59892336a5e567193cba2d87b242d3a6fd232037f4beb8"
    else
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.6/zoom-cli-v0.2.6-x86_64-apple-darwin.tar.gz"
      sha256 "b052af3481384164210729ce5703a24c40d21988799c203bba770a546f76d9b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.6/zoom-cli-v0.2.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "623f9ed6a5871ed1cb2b444d4928c58d8f794d35b8d08cbce13c0656f2d8297d"
    else
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.6/zoom-cli-v0.2.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "579d7527c9a6633a2f37c0e3f9dda3bfc52d7ecb88b8c99806dd5e75816de3f8"
    end
  end

  def install
    bin.install "zoom"
  end

  test do
    system "#{bin}/zoom", "--version"
  end
end
