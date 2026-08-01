class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.12/vership-v0.5.12-aarch64-apple-darwin.tar.gz"
      sha256 "a6056dcfcd51a465bee1eb5211de0d73a8770490c275cfde8bcbef9c2c58daea"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.12/vership-v0.5.12-x86_64-apple-darwin.tar.gz"
      sha256 "72b57a4ff436280362cdfe8730d9b22a42abe3a3b0db55daae322debee3d62fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.12/vership-v0.5.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "798063f3f9588d44219356bda422888ea72f407da9808ae3c53f089fe94977a5"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.12/vership-v0.5.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8c4ba0e238606b08742969f0ae340b430ebf3feff613318ef20eadf3723c28b5"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
