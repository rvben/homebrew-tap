class Ext4 < Formula
  desc "Read ext4 filesystems from image files and block devices"
  homepage "https://github.com/rvben/ext4-cli"
  version "0.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/ext4-cli/releases/download/v0.0.5/ext4-v0.0.5-aarch64-apple-darwin.tar.gz"
      sha256 "1669a0cc106a644541ce918619b7c9cfe450a58af10e7c833e59f6357711a45c"
    else
      url "https://github.com/rvben/ext4-cli/releases/download/v0.0.5/ext4-v0.0.5-x86_64-apple-darwin.tar.gz"
      sha256 "d968282f0a80d55cedbadd02e62b443df7b0646e677bffe8d3046df801e4cf3b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/ext4-cli/releases/download/v0.0.5/ext4-v0.0.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "567ed20fc84a7ee09cb2848e432e10b9f58e6f0fd4dcbde108c7d82e275756ea"
    else
      url "https://github.com/rvben/ext4-cli/releases/download/v0.0.5/ext4-v0.0.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "16fa352d1c4428b1ee15fd0ca209ec09b9d5e0c8819237dfb26fe4409f2e2a8c"
    end
  end

  def install
    bin.install "ext4"
  end

  test do
    system "#{bin}/ext4", "--version"
  end
end
