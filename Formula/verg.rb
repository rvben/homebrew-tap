class Verg < Formula
  desc "Stateless infrastructure convergence engine"
  homepage "https://github.com/rvben/verg"
  version "0.6.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/verg/releases/download/v0.6.4/verg-v0.6.4-aarch64-apple-darwin.tar.gz"
      sha256 "77696b37b8fac4d184d492d2713633c884a36075ab6f59c44e85a7ef19f4903e"
    else
      url "https://github.com/rvben/verg/releases/download/v0.6.4/verg-v0.6.4-x86_64-apple-darwin.tar.gz"
      sha256 "6e1b2732a1f8d0b49affead1a0512cfd242959a0079a1e13cfc66c752cf1545d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/verg/releases/download/v0.6.4/verg-v0.6.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2e00d085270e5df3bde5d8bffa15d3e7df908c77e52581d580ee4a315db0f2d2"
    else
      url "https://github.com/rvben/verg/releases/download/v0.6.4/verg-v0.6.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e31350e0e398cc33536eb68319fd8299615583b43b595f5e8a13e15403489fdb"
    end
  end

  def install
    bin.install "verg"
  end

  test do
    system "#{bin}/verg", "--version"
  end
end
