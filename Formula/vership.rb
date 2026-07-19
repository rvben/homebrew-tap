class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.11/vership-v0.5.11-aarch64-apple-darwin.tar.gz"
      sha256 "dd7f8f0a9eaea5e53f03a4baa4b4c44f5bf7287fa520323bc7020bf33831666c"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.11/vership-v0.5.11-x86_64-apple-darwin.tar.gz"
      sha256 "d451ff78f8e198d6c95cd86164fc1478f2ef453e1a856165ecb0cdbcb82ade2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.11/vership-v0.5.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8cdbe4b9bcaac21d24a018390f565b0eca03cff406c997c77862c5593faa4aa5"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.11/vership-v0.5.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "365d92687d0c794e36085898e9e5e0b49e340987baaff3b78ca35d31a4534a2f"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
