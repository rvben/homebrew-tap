class Tidemark < Formula
  desc "Snapshot a directory tree and diff what changed - no git required"
  homepage "https://github.com/rvben/tidemark"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tidemark/releases/download/v0.1.2/tidemark-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "dd6ffc7ec59620012e5238a8cf210032aa6147c0bd7a6b3089e8620d260602f3"
    else
      url "https://github.com/rvben/tidemark/releases/download/v0.1.2/tidemark-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "504af8aa1c2d29e7925d1c3e449e7eaa7f0636e4cf06eb9c9e29dbeb27fec346"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tidemark/releases/download/v0.1.2/tidemark-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a8a851f009da7030e0a16e1ffa704f31ab5fc419aa92fa29c6188e3d816e1e5c"
    else
      url "https://github.com/rvben/tidemark/releases/download/v0.1.2/tidemark-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "91e3d08bb29b0d48426698e23a6c8777a82a0f2902e97cae10c69e0b07041f63"
    end
  end

  def install
    bin.install "tidemark"
  end

  test do
    system "#{bin}/tidemark", "--version"
  end
end
