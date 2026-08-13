class Tarry < Formula
  desc "Block until a condition holds, then print one compact verdict"
  homepage "https://github.com/rvben/tarry"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tarry/releases/download/v0.1.4/tarry-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "889ac9bf28ffdf53e2c9935c7306b9d7278964beb54ebc86b7e3a6048b53c286"
    else
      url "https://github.com/rvben/tarry/releases/download/v0.1.4/tarry-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "d8276a1f10cb73fb816aeb7bc41b251eacfd343df0139d49b5bbbad84bf3f416"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tarry/releases/download/v0.1.4/tarry-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0b8858a262c70284f4bdb46651f303416787820aedab1043996aee3ad486ccb1"
    else
      url "https://github.com/rvben/tarry/releases/download/v0.1.4/tarry-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e1631eeeffd1b7c1dd959016ffd3d0d707e836d8fdc0c925fe9ea6a2405f2b6c"
    end
  end

  def install
    bin.install "tarry"
  end

  test do
    system "#{bin}/tarry", "--version"
  end
end
