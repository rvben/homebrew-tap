class Dotdiff < Formula
  desc "Semantic diff for JSON, YAML, TOML, and NDJSON: a structured, agent-friendly change-list instead of line noise."
  homepage "https://github.com/rvben/dotdiff"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/dotdiff/releases/download/v0.1.0/dotdiff-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "c99c53293c77501e4a3bc51acf8d063301aebe58c2685fa088f512ecbe75bfa3"
    else
      url "https://github.com/rvben/dotdiff/releases/download/v0.1.0/dotdiff-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "87a881cfada8ce66136c43474672aa8b317673c597ff9bc6fc379688c6873d4a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/dotdiff/releases/download/v0.1.0/dotdiff-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f6219465877b54a285a99bda411397cb702c9cc6bf7b7c956f4e7b276abd5b60"
    else
      url "https://github.com/rvben/dotdiff/releases/download/v0.1.0/dotdiff-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "57246a0782ad9ed82a751f2db2f2b5b849e3ef6d42d95bdef0575420ed1dbfeb"
    end
  end

  def install
    bin.install "dotdiff"
  end

  test do
    system "#{bin}/dotdiff", "--version"
  end
end
