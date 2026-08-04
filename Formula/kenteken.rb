class Kenteken < Formula
  desc "Look up Dutch vehicle data by licence plate from the RDW open data API"
  homepage "https://github.com/rvben/kenteken"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/kenteken/releases/download/v0.1.0/kenteken-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "21b712a877686789142ea7dc5d8ea1d4d59154badfd7e81670178b842d883705"
    else
      url "https://github.com/rvben/kenteken/releases/download/v0.1.0/kenteken-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "e852c6ca2fb00dca5e0a70769fffa204760cf19767433270f307ef9a95b6d46a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/kenteken/releases/download/v0.1.0/kenteken-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d7e1cebc5aed811ff3a58a5a480a9f11f7dd37fcf856c8336c6074bb16982ace"
    else
      url "https://github.com/rvben/kenteken/releases/download/v0.1.0/kenteken-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "817e729b333a5e0f15b6400ef17aaf9f26ce91e9c4562d0cd85e93e2df586cfc"
    end
  end

  def install
    bin.install "kenteken"
  end

  test do
    system "#{bin}/kenteken", "--version"
  end
end
