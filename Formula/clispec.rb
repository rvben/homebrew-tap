class Clispec < Formula
  desc "Score CLI tools against The CLI Spec"
  homepage "https://github.com/rvben/clispec-cli"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.5/clispec-v0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "d2f8cf9680a4eab1896c934e71832e17791acacb404d11caf4d45c8678fa953a"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.5/clispec-v0.2.5-x86_64-apple-darwin.tar.gz"
      sha256 "e1b49d805aeb9f9057a2d1f8d9c8690457bad3589811aa8be3b82b5346325e9d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.5/clispec-v0.2.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "731412334ca94ad4c9d3eb2a931c84f9e5e3c55d480682689088e8b0b429d14b"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.5/clispec-v0.2.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4576698ed2d36b1f5b0a3d17b2719199a943613c033397e8986f9e6a261120ad"
    end
  end

  def install
    bin.install "clispec"
  end

  test do
    system "#{bin}/clispec", "--version"
  end
end
