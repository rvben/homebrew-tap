class Downstat < Formula
  desc "Downloads and latest version for your packages across crates.io, PyPI, npm and GitHub releases"
  homepage "https://github.com/rvben/downstat"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/downstat/releases/download/v0.1.0/downstat-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "630844a4b603ed359101bdadd1802b6d5d1ea67fd9b638886ab4b31fa24d2b8d"
    else
      url "https://github.com/rvben/downstat/releases/download/v0.1.0/downstat-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "91d5fed8d8036499a56f2912ecda50c3aa4560a8ec59a5d449e201c069f3d053"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/downstat/releases/download/v0.1.0/downstat-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "693a560831c1c7e3552cadbede5094c51bd5ead347b1d75b9a1e0a9fbbe0d876"
    else
      url "https://github.com/rvben/downstat/releases/download/v0.1.0/downstat-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "787909d4db996672ff6b6a1fc9582736982984cd8611be51b8ef2cfdc3b96ac1"
    end
  end

  def install
    bin.install "downstat"
  end

  test do
    system "#{bin}/downstat", "--version"
  end
end
