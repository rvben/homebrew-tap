class Verg < Formula
  desc "Stateless infrastructure convergence engine"
  homepage "https://github.com/rvben/verg"
  version "0.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/verg/releases/download/v0.8.2/verg-v0.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "2f4b7fab7c328ccc9ab15e60b978ae4581ce1200589795b9cec5245d1c3b7178"
    else
      url "https://github.com/rvben/verg/releases/download/v0.8.2/verg-v0.8.2-x86_64-apple-darwin.tar.gz"
      sha256 "6092cb0cb4ec10322882657942c77c5463536a9c1ec006c13cdf3e8703e7cbc8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/verg/releases/download/v0.8.2/verg-v0.8.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ff0649bfee81a55cf22baa6c00f06e89b207c6a4153143a9c74a0b2ab02c2753"
    else
      url "https://github.com/rvben/verg/releases/download/v0.8.2/verg-v0.8.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "295f9a53a9ce56830fa5bc3eb5fc06d1e28b2ec6faf40f932b5e98f04a3cc098"
    end
  end

  def install
    bin.install "verg"
  end

  test do
    system "#{bin}/verg", "--version"
  end
end
