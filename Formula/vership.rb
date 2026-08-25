class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.20/vership-v0.5.20-aarch64-apple-darwin.tar.gz"
      sha256 "6782c301b4a20c6343c556888a316d83e9a1ccc93fd6847484ab9e4df5fb725a"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.20/vership-v0.5.20-x86_64-apple-darwin.tar.gz"
      sha256 "3554e2cbcba3d090d3f3142be6262a34c6c27f1a73f3606885e6f023e72a1b05"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.20/vership-v0.5.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ae46bd338a0122a09316d325a0cf18daa068af6c27d6f929c733a1407b7cd335"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.20/vership-v0.5.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d30be30d64ad92af1f60a8b9e1cb36d15cce92483758290c533f62a08c4b7ff"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
