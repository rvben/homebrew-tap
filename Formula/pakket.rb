class Pakket < Formula
  desc "Track shipments from the command line"
  homepage "https://github.com/rvben/pakket"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/pakket/releases/download/v0.1.1/pakket-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "69e190a82b96bb0ee3ab5833a9ff42ad4787c0975275ba2aea9ad62aca42845a"
    else
      url "https://github.com/rvben/pakket/releases/download/v0.1.1/pakket-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "673a449b8deb7faf09235694a9a6fa279733d95dc3cc1423df1c26520c8651f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/pakket/releases/download/v0.1.1/pakket-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3ead5665df3804dfc88364e2d812cf449b80461f4bb0b14c36ce868bf9b7426b"
    else
      url "https://github.com/rvben/pakket/releases/download/v0.1.1/pakket-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2146efcadef1a2b636bb2c3c843117a7bd7d4c672569db87521ca485a3303598"
    end
  end

  def install
    bin.install "pakket"
  end

  test do
    system "#{bin}/pakket", "--version"
  end
end
