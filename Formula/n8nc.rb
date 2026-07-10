class N8nc < Formula
  desc "CLI for n8n workflow automation"
  homepage "https://github.com/rvben/n8nc"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.5.2/n8nc-v0.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "46da441782c61bd9bbcff9d77cfa33084a36caf6cda6f24c5e1a8712de1eb4ff"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.5.2/n8nc-v0.5.2-x86_64-apple-darwin.tar.gz"
      sha256 "eb52b02a6f1946b313e2d2fc1c04bf9bc74a94b18bae70ba3322dcfb0bd25655"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.5.2/n8nc-v0.5.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f61c3b2b390bb28b5a0fa84619315df25c13e5b5ddca597398f10a15fe413150"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.5.2/n8nc-v0.5.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "59ccfb30556e85f4e4dd622a79b336323851804f2e4f02a055b6708aa36ccc31"
    end
  end

  def install
    bin.install "n8nc"
  end

  test do
    system "#{bin}/n8nc", "--version"
  end
end
