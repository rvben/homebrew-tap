class Ext4 < Formula
  desc "Read ext4 filesystems from image files and block devices"
  homepage "https://github.com/rvben/ext4-cli"
  version "0.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/ext4-cli/releases/download/v0.0.3/ext4-v0.0.3-aarch64-apple-darwin.tar.gz"
      sha256 "0ca49b40ad37588b9d38e68ab6d1cbce3200ea946f81b2cfc277282f70144a8d"
    else
      url "https://github.com/rvben/ext4-cli/releases/download/v0.0.3/ext4-v0.0.3-x86_64-apple-darwin.tar.gz"
      sha256 "75804830125194790938feb9e7ed992c8abf48f814e9a8c3756b646d6a30b402"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/ext4-cli/releases/download/v0.0.3/ext4-v0.0.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "38e93e06f0e7314098968b24943b8e13a8a7e7a079289d0280cd2711bd6024c5"
    else
      url "https://github.com/rvben/ext4-cli/releases/download/v0.0.3/ext4-v0.0.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19dc3dd22588f7de0521f290d112f306967c079417f8f2c28963f6132ca2e847"
    end
  end

  def install
    bin.install "ext4"
  end

  test do
    system "#{bin}/ext4", "--version"
  end
end
