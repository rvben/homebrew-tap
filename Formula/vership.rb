class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.21/vership-v0.5.21-aarch64-apple-darwin.tar.gz"
      sha256 "711cda325b9a69d38c36055cb3e93cfa9efd79e3731e4d16d4d35976356188b1"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.21/vership-v0.5.21-x86_64-apple-darwin.tar.gz"
      sha256 "c7621723a8b38086fd48dc306fd9ae5ceec457c5ccb819cc4ad9ad6be35c1651"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.21/vership-v0.5.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d10dcb62fe84ca777b755a55e09ad34c2f23d6ed9ea46365af793b7fb1883d6f"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.21/vership-v0.5.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1f5f3f6a787ae6d1d3660c3770c84962c8b12f86fe639114e9a55a9eb2245f95"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
