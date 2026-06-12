class Tarry < Formula
  desc "Block until a condition holds, then print one compact verdict"
  homepage "https://github.com/rvben/tarry"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tarry/releases/download/v0.1.0/tarry-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "147bf585af737d4ef25fad627c7bec9bef76e1980a1670aa48b8db3189fffbe7"
    else
      url "https://github.com/rvben/tarry/releases/download/v0.1.0/tarry-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "a208941783312dd828d3c5509c673f1a1193e0e98d603154d0b0ca7ec257b30d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tarry/releases/download/v0.1.0/tarry-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57afb9d11f05a183e567caaed4e63a3bfb3e8c0d8c8b07fbecfa65f106ea9b13"
    else
      url "https://github.com/rvben/tarry/releases/download/v0.1.0/tarry-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a4256544080b91c3fc933edb9299578ad7209b4a84b2a503957832c02171ef3"
    end
  end

  def install
    bin.install "tarry"
  end

  test do
    system "#{bin}/tarry", "--version"
  end
end
