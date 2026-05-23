class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.1/vership-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "becd1131f3f3fefdfa0ea4d893980973f0a7c2b8f3226ac05202f26b83c9948e"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.1/vership-v0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "313aa25099570ef732922a114adaf61a80c6417a765ac920d092d58a2bcb98f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.1/vership-v0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d2ab0b3149d1d3fcf680d35ed024a68db682ee88369f9b1961c848eeb13f7eb"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.1/vership-v0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "730952935df1dd4db729d37fd3b310bedbd9e1ff6976fe42c51bc5b968b78f03"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
