class Verg < Formula
  desc "Stateless infrastructure convergence engine"
  homepage "https://github.com/rvben/verg"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/verg/releases/download/v0.7.0/verg-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "e0efbe015cf65d8508973725e6b47e3d2633a73e2ad4ae6bd6b5227fbcbbbfff"
    else
      url "https://github.com/rvben/verg/releases/download/v0.7.0/verg-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "7f1c42fbe06358202c9c5fb23996b5c07514cb6edf220d1c880f70d4691cbd1c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/verg/releases/download/v0.7.0/verg-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3c32dbec967bf41027bf9ee0638f01c35ae622573fdbd7cc801ab05b28db1fbf"
    else
      url "https://github.com/rvben/verg/releases/download/v0.7.0/verg-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ca5342e9d4c27361b774f3a5d3b645933bc9f37af582d28e481e36459518a78d"
    end
  end

  def install
    bin.install "verg"
  end

  test do
    system "#{bin}/verg", "--version"
  end
end
