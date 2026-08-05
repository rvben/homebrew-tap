class Kenteken < Formula
  desc "Look up Dutch vehicle data by licence plate from the RDW open data API"
  homepage "https://github.com/rvben/kenteken"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/kenteken/releases/download/v0.2.2/kenteken-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "cce09cc862850ded9f34b83a9a7a292e7d615a91eb11633bf166912fce514dc9"
    else
      url "https://github.com/rvben/kenteken/releases/download/v0.2.2/kenteken-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "716257a839478b71bf9ba5b85a88057fdc36c953e36431334573d2445e88e8d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/kenteken/releases/download/v0.2.2/kenteken-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6f4d7cd4fa952e4862e0aee3238097fe0c6e6a55e379d27d34f01467cc445225"
    else
      url "https://github.com/rvben/kenteken/releases/download/v0.2.2/kenteken-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "63c5aa819523456f9c0bf34b6c61e7459cba9043a048886e818bc215ca42e03c"
    end
  end

  def install
    bin.install "kenteken"
  end

  test do
    system "#{bin}/kenteken", "--version"
  end
end
