class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.7/husker-v0.4.7-aarch64-apple-darwin.tar.gz"
      sha256 "1f30ef60d311d7a8da9230f879d4057e0a8fca7c1dee5dd7adc42861b85401d9"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.7/husker-v0.4.7-x86_64-apple-darwin.tar.gz"
      sha256 "095d72edaf5646062fe5c6c5dc9cba0a95c9e1806a44ea35d016b75b68c0e047"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.7/husker-v0.4.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "134d69c206a6e9b0755d406caa512d0f49fcd2c2e74b2dd7163cb3451b353cdf"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.7/husker-v0.4.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "62c799673a4a2ee576d63e1817d460d3f74c1b33df4963fd29ebd1976b5f8713"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
