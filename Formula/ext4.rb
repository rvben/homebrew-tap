class Ext4 < Formula
  desc "Read ext4 filesystems from image files and block devices"
  homepage "https://github.com/rvben/ext4-cli"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/ext4-cli/releases/download/v0.0.2/ext4-v0.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "e96f14b278b813f92ff16451a10205c2ba56c08a09f78eb8de692839aae85c4c"
    else
      url "https://github.com/rvben/ext4-cli/releases/download/v0.0.2/ext4-v0.0.2-x86_64-apple-darwin.tar.gz"
      sha256 "5af28108ee3e71e8643f2cfde09fb1a9ee9054e70ff42110f9e0a4c9be3c855a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/ext4-cli/releases/download/v0.0.2/ext4-v0.0.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b0693c02747cc9796e1919db03dd14a2b4529d900163c62185bebb56c631f03"
    else
      url "https://github.com/rvben/ext4-cli/releases/download/v0.0.2/ext4-v0.0.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f663f05240ce6ec72477cc2f930ecc23478a72095488386aaefb6a8d18fd4111"
    end
  end

  def install
    bin.install "ext4"
  end

  test do
    system "#{bin}/ext4", "--version"
  end
end
