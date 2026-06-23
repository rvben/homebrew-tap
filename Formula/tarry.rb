class Tarry < Formula
  desc "Block until a condition holds, then print one compact verdict"
  homepage "https://github.com/rvben/tarry"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tarry/releases/download/v0.1.3/tarry-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "29c341eb92a88b72096a40f270d184fce40d5881cb3395dfe99ea81fba5b57d3"
    else
      url "https://github.com/rvben/tarry/releases/download/v0.1.3/tarry-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "b3c476a22da8441c3db553ea56c0743beb6112980c3014b6008fd4deeaf6cf68"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tarry/releases/download/v0.1.3/tarry-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d70d1769a59b6aff9e7146661ff4cd550e190b9942c355996ecd6bb244276db2"
    else
      url "https://github.com/rvben/tarry/releases/download/v0.1.3/tarry-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f528677b5892cb91f7b0bb3133727ac137959b0496fa4b0ce85f1e794eba18f"
    end
  end

  def install
    bin.install "tarry"
  end

  test do
    system "#{bin}/tarry", "--version"
  end
end
