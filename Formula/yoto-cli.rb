class YotoCli < Formula
  desc "Manage Yoto Make Your Own playlists from the command line: sign in, upload audio, create and inspect content."
  homepage "https://github.com/rvben/yoto-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yoto-cli/releases/download/v0.1.1/yoto-cli-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "2d31f4fd1f9c315c85edcad6731da82692183f1577b33f2a0574a9b2ea27618b"
    else
      url "https://github.com/rvben/yoto-cli/releases/download/v0.1.1/yoto-cli-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "d61689149bf5e453f84b914d8794d97bb2524cdaca871dee87adb0ed721dd2f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yoto-cli/releases/download/v0.1.1/yoto-cli-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "326817166af29ef8277b29bb410d521b5466fdf5981e0ecbc667ea43f1c2addf"
    else
      url "https://github.com/rvben/yoto-cli/releases/download/v0.1.1/yoto-cli-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5eade4dcdd3fb513db0c855eac41279908be05b845208c27c9d51e8fd9590512"
    end
  end

  def install
    bin.install "yoto-cli"
  end

  test do
    system "#{bin}/yoto-cli", "--version"
  end
end
