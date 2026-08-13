class Ext4 < Formula
  desc "Read ext4 filesystems from image files and block devices"
  homepage "https://github.com/rvben/ext4-cli"
  version "0.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/ext4-cli/releases/download/v0.0.4/ext4-v0.0.4-aarch64-apple-darwin.tar.gz"
      sha256 "8c4c7fa2be8d3da0613c3be69dfc5e783f41b8bc3f14f95a298680fe839606d9"
    else
      url "https://github.com/rvben/ext4-cli/releases/download/v0.0.4/ext4-v0.0.4-x86_64-apple-darwin.tar.gz"
      sha256 "778416e65709b9cf79a58050525b4df055760bcb27ea2437a7b35c6c41e69829"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/ext4-cli/releases/download/v0.0.4/ext4-v0.0.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da7e751e19ef725415eafe91a7c79d258372fef9c281a7a155d583fe24318ada"
    else
      url "https://github.com/rvben/ext4-cli/releases/download/v0.0.4/ext4-v0.0.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ad4c4cdd3ff9f70ca77dc0e8efde748122e98a12d93f79f2308e59fc17ea99d3"
    end
  end

  def install
    bin.install "ext4"
  end

  test do
    system "#{bin}/ext4", "--version"
  end
end
