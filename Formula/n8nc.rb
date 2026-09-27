class N8nc < Formula
  desc "CLI for n8n workflow automation"
  homepage "https://github.com/rvben/n8nc"
  version "0.5.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.5.4/n8nc-v0.5.4-aarch64-apple-darwin.tar.gz"
      sha256 "8505f2eeec011af65e4f2e4ddf8683b24148951947d8e3e4fd63ef4b29f54fd5"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.5.4/n8nc-v0.5.4-x86_64-apple-darwin.tar.gz"
      sha256 "501b9ee28c020d1b81c454ca0d81ec472e33456c27bca4954d076644fb539515"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.5.4/n8nc-v0.5.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8bca3c3c127f0765ee3aa8fd6b2253484c45cac5e6c52ef6c12a17954545c40d"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.5.4/n8nc-v0.5.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "94f2ce00808fdd74565a1d6dc48d468a67aa1c4833b8d41d29854e9a87c59211"
    end
  end

  def install
    bin.install "n8nc"
  end

  test do
    system "#{bin}/n8nc", "--version"
  end
end
