class N8nc < Formula
  desc "CLI for n8n workflow automation"
  homepage "https://github.com/rvben/n8nc"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.5.0/n8nc-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "dfa6994ff4a940fe621544cc8fc791915a0a08155b953e4ba59c67684d04e40e"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.5.0/n8nc-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "9e99046852611ab9b6497cfd484d4fc80c5a9bd0777ba7d908cf38d3d43ec5ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.5.0/n8nc-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "50b5b83653a67cf9332fda350ac8429c262c274f8e78a3fb3a0e70a87b0f0a65"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.5.0/n8nc-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "94f3ac51e96c9e6930d6b48005bd925cb0a3c8e6912b0b89517633d564161e90"
    end
  end

  def install
    bin.install "n8nc"
  end

  test do
    system "#{bin}/n8nc", "--version"
  end
end
