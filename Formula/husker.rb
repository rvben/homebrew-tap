class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.44"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.44/husker-v0.4.44-aarch64-apple-darwin.tar.gz"
      sha256 "e7b2b6dde9ca42b295b3177589c7a94885d2afe5e5a734b226e14c807306f0e4"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.44/husker-v0.4.44-x86_64-apple-darwin.tar.gz"
      sha256 "aab3957a02cdcfe53a4dc7059915971966124247d78eeb65c8290974940e0cc7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.44/husker-v0.4.44-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c560bf071b6fcca69bd43d4fffb5d7cdd44f1e5de873bca45e4a81c1bcfae5dc"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.44/husker-v0.4.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2cbf0629f692241b8166a2e94ac87fc3162fb4aada9bd5f8c10383c7b0ea5e36"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
