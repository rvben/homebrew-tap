class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.4.4/vership-v0.4.4-aarch64-apple-darwin.tar.gz"
      sha256 "6013196c54cccc4ef79e0bf02448f7ee1e6a4dca08802fc54627c449cab98f6e"
    else
      url "https://github.com/rvben/vership/releases/download/v0.4.4/vership-v0.4.4-x86_64-apple-darwin.tar.gz"
      sha256 "8003842826795dbf7f687e27d25120b7b9d2b81fa6b650297b79fbfa069ed111"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.4.4/vership-v0.4.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bff675bb566e9214a991a55d792d94b7bf68c8da59d4de4aa25ebd21558a1833"
    else
      url "https://github.com/rvben/vership/releases/download/v0.4.4/vership-v0.4.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "90ebccebf5e5db362954511a95b1ac9319e0ac752a4549e8e1d888da73859110"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
