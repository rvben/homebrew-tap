class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.23/vership-v0.5.23-aarch64-apple-darwin.tar.gz"
      sha256 "4112fa4202f6ef84b1dc101215802816d3d036eaa0e6e70994ef385443e0290a"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.23/vership-v0.5.23-x86_64-apple-darwin.tar.gz"
      sha256 "39b72cbd147a89fa9856328c679708e7f56e0d005036ea81ea973b203b7ecdfe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.23/vership-v0.5.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3d1edff53dc162af111ff4d4bd203d33f8887de389412a8bec90ce8d10f9ace3"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.23/vership-v0.5.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "046a083c789efb0856343694b16ddfa838d1aa5b911a62a26b0fbaa96f374579"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
