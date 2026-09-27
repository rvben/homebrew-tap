class Tidemark < Formula
  desc "Snapshot a directory tree and diff what changed - no git required"
  homepage "https://github.com/rvben/tidemark"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tidemark/releases/download/v0.1.4/tidemark-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "fc27e4c04fee4e02ac8f7cfcf53cab274e56f11ccf4ede91a615db2c9ca721e5"
    else
      url "https://github.com/rvben/tidemark/releases/download/v0.1.4/tidemark-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "cd0928d9a8e8d1778a1cbb7f92e64eb446dde4db4ec80db887b0d4fbd81c5d62"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tidemark/releases/download/v0.1.4/tidemark-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d31ef5aca6084c23c4b247455f705d92baaf0facdbdb57ed09fe2b7cd027b631"
    else
      url "https://github.com/rvben/tidemark/releases/download/v0.1.4/tidemark-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "163c545f478314df93cc4eba956c57166a666a7013492ced2d327320e58e2641"
    end
  end

  def install
    bin.install "tidemark"
  end

  test do
    system "#{bin}/tidemark", "--version"
  end
end
