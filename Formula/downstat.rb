class Downstat < Formula
  desc "Downloads and latest version for your packages across crates.io, PyPI, npm and GitHub releases"
  homepage "https://github.com/rvben/downstat"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/downstat/releases/download/v0.1.1/downstat-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "db302e90c9e61d51f8c607b49587f089c8fe14dcb0c53a439d49aff181f753d5"
    else
      url "https://github.com/rvben/downstat/releases/download/v0.1.1/downstat-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "2e563ef109e3407736cfb5f1bd9436ece0ec167293277170feabcabcd2009a72"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/downstat/releases/download/v0.1.1/downstat-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a64a8a2bd894aabd45adf47f6126103ede98729af91b96ca4e7b106fa3502d5"
    else
      url "https://github.com/rvben/downstat/releases/download/v0.1.1/downstat-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "37616e996d99ee432e7ecf421dcbbde44928f420ebcf30b86570d2046eeafb87"
    end
  end

  def install
    bin.install "downstat"
  end

  test do
    system "#{bin}/downstat", "--version"
  end
end
