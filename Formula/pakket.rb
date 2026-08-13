class Pakket < Formula
  desc "Track shipments from the command line"
  homepage "https://github.com/rvben/pakket"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/pakket/releases/download/v0.1.2/pakket-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "abc4174c6fe6aac05d66ef3f0b5dcec4f878c576f7f837391ebe2a920862f6d9"
    else
      url "https://github.com/rvben/pakket/releases/download/v0.1.2/pakket-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "2f3de5ed3d2bd980339e68678a02079c46c3cd4c87c74e7881484fbb260f6f9c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/pakket/releases/download/v0.1.2/pakket-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3af29c9ec1c640d50587676c2797c6fa2f213631c26796aed7a52c31fd425799"
    else
      url "https://github.com/rvben/pakket/releases/download/v0.1.2/pakket-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b4ef754f7e4318c04cc92f0343ff134fdd528925f2dcec496e017c4676deac2f"
    end
  end

  def install
    bin.install "pakket"
  end

  test do
    system "#{bin}/pakket", "--version"
  end
end
