class Kenteken < Formula
  desc "Look up Dutch vehicle data by licence plate from the RDW open data API"
  homepage "https://github.com/rvben/kenteken"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/kenteken/releases/download/v0.2.4/kenteken-v0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "8bb190045729a6b39d9e36329a9d0160ed08e503b89ca1937910246d9a128618"
    else
      url "https://github.com/rvben/kenteken/releases/download/v0.2.4/kenteken-v0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "7fbbf7dc63936a59b9fce22f3f58a156a55e42c5f014684a059eeac9cae0b2f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/kenteken/releases/download/v0.2.4/kenteken-v0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fdb5051dc140896947e4decd990bf29cf1f19a0f84b0a9f8cabb34f162c2dd22"
    else
      url "https://github.com/rvben/kenteken/releases/download/v0.2.4/kenteken-v0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1cd339470771189d3e1695585aa78f767cc5ff23d58f6e264da5131edb6279a8"
    end
  end

  def install
    bin.install "kenteken"
  end

  test do
    system "#{bin}/kenteken", "--version"
  end
end
