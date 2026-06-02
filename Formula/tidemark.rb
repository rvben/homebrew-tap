class Tidemark < Formula
  desc "Snapshot a directory tree and diff what changed - no git required"
  homepage "https://github.com/rvben/tidemark"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tidemark/releases/download/v0.1.1/tidemark-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "d54aeb8181c19b76fc2a8bb0c8c0649c2f011345d6121030ab3e1211fe3b0c92"
    else
      url "https://github.com/rvben/tidemark/releases/download/v0.1.1/tidemark-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "46435615ee470538a05655a953bfce34654e3bd093f68bb592ea584dfc926794"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tidemark/releases/download/v0.1.1/tidemark-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7b8f22e1583256bc6f57c98724ff1988bf6737e2069c65314f0825b06579fc4"
    else
      url "https://github.com/rvben/tidemark/releases/download/v0.1.1/tidemark-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "29327740b06998e476c73fa6e10962a8e445fb9792218ff583a2acf33e81afd8"
    end
  end

  def install
    bin.install "tidemark"
  end

  test do
    system "#{bin}/tidemark", "--version"
  end
end
