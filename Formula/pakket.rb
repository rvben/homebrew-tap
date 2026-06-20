class Pakket < Formula
  desc "Track shipments from the command line"
  homepage "https://github.com/rvben/pakket"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/pakket/releases/download/v0.1.0/pakket-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "46b4eb80b84858f415f286026a645707df2b16f8f413cfaef756bb08b61ca0bc"
    else
      url "https://github.com/rvben/pakket/releases/download/v0.1.0/pakket-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "bc3742d25f3716d145cd01438e3012a6520c1e20932c65887e7f7dc26485189b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/pakket/releases/download/v0.1.0/pakket-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8760b78eeaa214e5dad9c7d3e24287f86931bbec7672ced00cea1f92a79f24a4"
    else
      url "https://github.com/rvben/pakket/releases/download/v0.1.0/pakket-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8248d4cade2f9e3303629eef09ad1c5e91094b9f53cc58c14f3bc6b5cb0f0825"
    end
  end

  def install
    bin.install "pakket"
  end

  test do
    system "#{bin}/pakket", "--version"
  end
end
