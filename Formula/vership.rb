class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.2/vership-v0.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "692da857de3e131588bcba0a885719a532381a896c4cef3eb4b4048f192ab626"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.2/vership-v0.5.2-x86_64-apple-darwin.tar.gz"
      sha256 "4c9b3fbbe7772dd240c24189393e65cff3485099b48c9ecb5778987df3a519fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.2/vership-v0.5.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d3aeae8ff6bcea29e9c39f03c6f23ff710aa650d4e41b3f7cf07e4c1f2472986"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.2/vership-v0.5.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08251ae81df62ee3d4b6469fdecd6f9cc38d81ad483211d470a0858ef96fc9f9"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
