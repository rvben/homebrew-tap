class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.27/vership-v0.5.27-aarch64-apple-darwin.tar.gz"
      sha256 "74b78e788503a0dafd42975d8ee3b029209209f71451ef83130322f7f504438a"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.27/vership-v0.5.27-x86_64-apple-darwin.tar.gz"
      sha256 "48defddae9f96edd03fe63f896a00807f172445773abb053b0a86d73f3bce211"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.27/vership-v0.5.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b6cce62fbf3551ca8ed17b07968d75d725f390d036fd34058320ff889ed914e5"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.27/vership-v0.5.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e3fe2e609f071261e936e1d253e92b729bbb921ae821b6aec46768793c9d8e3e"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
