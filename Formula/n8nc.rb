class N8nc < Formula
  desc "CLI for n8n workflow automation"
  homepage "https://github.com/rvben/n8nc"
  version "0.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.4.4/n8nc-v0.4.4-aarch64-apple-darwin.tar.gz"
      sha256 "8c1a539e1cd2026be9ee2765cb8f45d461ced021897e2ec0cd803b98da7729ca"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.4.4/n8nc-v0.4.4-x86_64-apple-darwin.tar.gz"
      sha256 "6e229bc2e71794398266f471313c4a0fa0d003b6bd5d99d11a0cd9179c4f0fd6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.4.4/n8nc-v0.4.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9120a5f1ea5f7906ee3d3ed0480387c4f694cdb27c09302be625b27f8e9ece38"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.4.4/n8nc-v0.4.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ba9b0d569f7c9efd834334ea45bba85374a2c2d7d82353086330c5b4539c4af6"
    end
  end

  def install
    bin.install "n8nc"
  end

  test do
    system "#{bin}/n8nc", "--version"
  end
end
