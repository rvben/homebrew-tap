class N8nc < Formula
  desc "CLI for n8n workflow automation"
  homepage "https://github.com/rvben/n8nc"
  version "0.4.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.4.5/n8nc-v0.4.5-aarch64-apple-darwin.tar.gz"
      sha256 "38207d1dfe49cef818fe797c84f9dc68fb219ae0745ecc22a86cfa577e7d82fb"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.4.5/n8nc-v0.4.5-x86_64-apple-darwin.tar.gz"
      sha256 "68ec168d1a460c4f0b4e939ed67ddb3129d87c4f030b53dca6d3a0b8f6e1671d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/n8nc/releases/download/v0.4.5/n8nc-v0.4.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "68f094259eec64469d9483080121915816585ecb4d952f70680f37bc0a4ba7c9"
    else
      url "https://github.com/rvben/n8nc/releases/download/v0.4.5/n8nc-v0.4.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f84f34f4ce20a09d7d304f917e85dda5506b6b967317dad8f2b39fb64f936fb"
    end
  end

  def install
    bin.install "n8nc"
  end

  test do
    system "#{bin}/n8nc", "--version"
  end
end
