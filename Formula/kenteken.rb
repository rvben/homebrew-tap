class Kenteken < Formula
  desc "Look up Dutch vehicle data by licence plate from the RDW open data API"
  homepage "https://github.com/rvben/kenteken"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/kenteken/releases/download/v0.2.5/kenteken-v0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "23fcd809df17e54c9cbc500105f0c71984006c186ebd0151a109ba07d0d94916"
    else
      url "https://github.com/rvben/kenteken/releases/download/v0.2.5/kenteken-v0.2.5-x86_64-apple-darwin.tar.gz"
      sha256 "af0bf509f628efc2ff4468ec9a86a898ec5599af06deeef4002773196f419a7b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/kenteken/releases/download/v0.2.5/kenteken-v0.2.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f6ee7c0774106a3bfe667f942490e83d0901fd5d0c5d24d5b08eb72a5297ca2"
    else
      url "https://github.com/rvben/kenteken/releases/download/v0.2.5/kenteken-v0.2.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9a5c7c50ee9395a5ad714eebe1e5b52a11e75e647039c5721916bffebf6867ca"
    end
  end

  def install
    bin.install "kenteken"
  end

  test do
    system "#{bin}/kenteken", "--version"
  end
end
