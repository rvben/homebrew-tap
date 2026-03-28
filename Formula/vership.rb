class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.3.0/vership-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "cfbea92f8633d56e7aa0ca4d8fe41701ae6fb59222a207ba64b2bddae99e101c"
    else
      url "https://github.com/rvben/vership/releases/download/v0.3.0/vership-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "cf45b7736ab820fc3e5b3f7951fa1acadc40565f655b3eb5b3d1c4d082640ec5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.3.0/vership-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4d0ae3e9dd0538c51468af7bbf27e58e97d0596f149d141167f031a07903fd6"
    else
      url "https://github.com/rvben/vership/releases/download/v0.3.0/vership-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd864110abcab080b131b1350b3efc0d7904f1b836122d189f3d3114efad9dd8"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
