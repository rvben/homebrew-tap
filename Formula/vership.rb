class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.8/vership-v0.5.8-aarch64-apple-darwin.tar.gz"
      sha256 "0a6949dcf46a5f2db8433eb049fb9730e24d9bfc1a31ca1eb44fae7a1f7116cb"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.8/vership-v0.5.8-x86_64-apple-darwin.tar.gz"
      sha256 "9f2e888801d64d970119bb9a2d7a3b41da0300f40958ae04d41833786741c4be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.8/vership-v0.5.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8cd28641883f53fcdbbf0088bcc63a4962cee77892b6603f6a5db9f6a544c804"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.8/vership-v0.5.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "31dd652cc7e28679b7d6244b0d44f1324c30bd2b06804572cb041f193357bd27"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
