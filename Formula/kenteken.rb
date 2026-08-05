class Kenteken < Formula
  desc "Look up Dutch vehicle data by licence plate from the RDW open data API"
  homepage "https://github.com/rvben/kenteken"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/kenteken/releases/download/v0.2.0/kenteken-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "2627db1aa63accc92ef168aef3f96be003ea5e9badc0d6519496d56a60369924"
    else
      url "https://github.com/rvben/kenteken/releases/download/v0.2.0/kenteken-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "eba8ca92c21a4246f5d939984f9a4eb0bbc6943863d3fe814222eed820692104"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/kenteken/releases/download/v0.2.0/kenteken-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "140979a5527cc1b7adef28bf14f4c980be6b2e376310c08e1d78f6e24b22acf1"
    else
      url "https://github.com/rvben/kenteken/releases/download/v0.2.0/kenteken-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b73316f88626449c63ef65a26bc4edf87ae2e9388a6415b824a74e9e661739a"
    end
  end

  def install
    bin.install "kenteken"
  end

  test do
    system "#{bin}/kenteken", "--version"
  end
end
