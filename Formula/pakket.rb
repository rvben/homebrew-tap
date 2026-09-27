class Pakket < Formula
  desc "Track shipments from the command line"
  homepage "https://github.com/rvben/pakket"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/pakket/releases/download/v0.1.3/pakket-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "cb2ae03d18c90ed1f276ab9dabaaf8b6487ed5d63590ca96d8b141355aec628d"
    else
      url "https://github.com/rvben/pakket/releases/download/v0.1.3/pakket-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "5a0d6b180346964e03138363b936852be892ab686ffaebcee6a3673767fae70e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/pakket/releases/download/v0.1.3/pakket-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4df2fc08741cfe2da2abebf74f6a88ce68f0614c2e41d39a85b4fa4ec7caac8c"
    else
      url "https://github.com/rvben/pakket/releases/download/v0.1.3/pakket-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb0686014a60b9df5c830f1c33cc0d3cab8820874595718e42a0a15c83f6c246"
    end
  end

  def install
    bin.install "pakket"
  end

  test do
    system "#{bin}/pakket", "--version"
  end
end
