class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.24/vership-v0.5.24-aarch64-apple-darwin.tar.gz"
      sha256 "5eee87c9390ebc7e8c64437db22cbb9b2babef1de471c0f6663708540147e185"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.24/vership-v0.5.24-x86_64-apple-darwin.tar.gz"
      sha256 "192e02e3bb74c0b136dd9bdd9df09a8011757edd36a4d6c4c5d0b572f9e1342b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.24/vership-v0.5.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81103b4539217a6d50662e487acfd6e6855ddb1e7b1415a39784aae919a50512"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.24/vership-v0.5.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7834b01ab151ee43ac2829145e9dc62dd46f6006127c0712872e2d82b6cad2ff"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
