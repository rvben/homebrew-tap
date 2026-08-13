class N8nc < Formula
  desc "CLI for n8n workflow automation"
  homepage "https://github.com/rvben/n8nc"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.5.3/n8nc-v0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "3aeca3ac47ddd8a1a624d535f48d70427223aa00bd1e32474f71bccf6d131e88"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.5.3/n8nc-v0.5.3-x86_64-apple-darwin.tar.gz"
      sha256 "47ee22fb7e3b16f0ce47783d4f49c5ca9fd59e7c8ca9d6f1cbbd644d548eec87"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.5.3/n8nc-v0.5.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1fc6feb551241c0ec1b7f91e11f5a43ca96d0e23e66cb2f16a4b7f30c482770e"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.5.3/n8nc-v0.5.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e0d2de7747450a30def24108e1f64e3a761566460bbb38f6cff5fbf669abcb1"
    end
  end

  def install
    bin.install "n8nc"
  end

  test do
    system "#{bin}/n8nc", "--version"
  end
end
