class N8nc < Formula
  desc "CLI for n8n workflow automation"
  homepage "https://github.com/rvben/n8nc"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.5.1/n8nc-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "29438ee6a102d0dd1ae1de3b52053c76f0f83850bbe0b961cf9b1e7e81ed9808"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.5.1/n8nc-v0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "4d61863abccf46735f58c2dc66d029cad9ec9c6491979dbe53e0932a0e176439"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.5.1/n8nc-v0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "69c1bceb5d1d548d6b56f8b1275fa32e912f45291ba85cc6fa0be64a187b4007"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.5.1/n8nc-v0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18399cd583d91d5921dcab2c386de61d31c38f093873138ade03cf3f4304f76f"
    end
  end

  def install
    bin.install "n8nc"
  end

  test do
    system "#{bin}/n8nc", "--version"
  end
end
