class Dotdiff < Formula
  desc "Semantic diff for JSON, YAML, TOML, and NDJSON: a structured, agent-friendly change-list instead of line noise."
  homepage "https://github.com/rvben/dotdiff"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/dotdiff/releases/download/v0.1.1/dotdiff-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "bc0ee311a34aa9d16f6079e332c13dbb702c28ba4c40391f9d5c91061bc2ce1d"
    else
      url "https://github.com/rvben/dotdiff/releases/download/v0.1.1/dotdiff-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "3e0a5c8d7e925b45b71b361637d33630789d2e93c88170efe42cdea2f639ac03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/dotdiff/releases/download/v0.1.1/dotdiff-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b20b68d6d7e915a8299b8e3ea044c63695c99fcf0bfcc7e19963069481077b3"
    else
      url "https://github.com/rvben/dotdiff/releases/download/v0.1.1/dotdiff-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "caa074316ef2b1592a4b2870699ac67e284c04e84bf22973399d09cedd06f478"
    end
  end

  def install
    bin.install "dotdiff"
  end

  test do
    system "#{bin}/dotdiff", "--version"
  end
end
