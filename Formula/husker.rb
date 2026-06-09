class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.3.0/husker-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "33fc064ad3513d7b2e0bd1025f153491a7107fa4ca9862aa2cbc035ff3c5e19b"
    else
      url "https://github.com/rvben/husker/releases/download/v0.3.0/husker-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "e9a5a2c8ed4d06720b6fb3333c629aef983f97f16bb4a452e33591a71bacd881"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.3.0/husker-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c1dcc361a3e41946716a1562b26af343643205b12f9142acd6af99de448dd834"
    else
      url "https://github.com/rvben/husker/releases/download/v0.3.0/husker-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a5c44a56c01fb9db99dd668f53027624a6ab65e28b88fb882bc56a0446ce211"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
