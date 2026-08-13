class Tidemark < Formula
  desc "Snapshot a directory tree and diff what changed - no git required"
  homepage "https://github.com/rvben/tidemark"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tidemark/releases/download/v0.1.3/tidemark-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "cc14d6554449bcc1775b6335ea7ae44391e6b86e6a6e3ce07c3edd8918aa3b01"
    else
      url "https://github.com/rvben/tidemark/releases/download/v0.1.3/tidemark-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "6ee0cd91ba4670ba8d9b6c7b4dc6e1793ff178dd6f0d2290f58d987fd01a1126"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tidemark/releases/download/v0.1.3/tidemark-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "59db8635ab89cd6620fdf9d93a964eb3dcba6c8f67a6dcb15d9b0a11d061ae47"
    else
      url "https://github.com/rvben/tidemark/releases/download/v0.1.3/tidemark-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc85cb1ff2431b10f833291fa8b5a81cd8fe544f9946e88e0ded33d257a6c21d"
    end
  end

  def install
    bin.install "tidemark"
  end

  test do
    system "#{bin}/tidemark", "--version"
  end
end
