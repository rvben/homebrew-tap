class Downstat < Formula
  desc "Downloads and latest version for your packages across crates.io, PyPI, npm and GitHub releases"
  homepage "https://github.com/rvben/downstat"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/downstat/releases/download/v0.1.2/downstat-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "815c9faa16be4940fc31a342c115654099cf97fc9bd12a04784526f00ab1bf47"
    else
      url "https://github.com/rvben/downstat/releases/download/v0.1.2/downstat-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "41d5de6aae965a8b39798dcc4c6211a812dbf9f0677593571352b7832d336332"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/downstat/releases/download/v0.1.2/downstat-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf2a32c6ba1b6ff87342c7f3b4fd1278b9c0c7c8f1898c2029ec8952a5ab5d02"
    else
      url "https://github.com/rvben/downstat/releases/download/v0.1.2/downstat-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "132d6754adaccf8f87fae3008bbfc727b5de66b95860bfcd85703fe784f8b768"
    end
  end

  def install
    bin.install "downstat"
  end

  test do
    system "#{bin}/downstat", "--version"
  end
end
