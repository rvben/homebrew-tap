class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.31/husker-v0.4.31-aarch64-apple-darwin.tar.gz"
      sha256 "41e72aa96cc9682f42e703b10faa2f4c315ecc98d0cdafe16b778981f92998be"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.31/husker-v0.4.31-x86_64-apple-darwin.tar.gz"
      sha256 "2ef8b6187e337c4697650adccd1d64b3ad263948a4eafe9fa15b9643b40149d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.31/husker-v0.4.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c90ac11705f489dd16074e913bb88668f14ee4c8911242fea6a6984210a53aa"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.31/husker-v0.4.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bee5ce6a5fec2bc13bfc886e6bf27de29a78acac68aad00c25924afd0addf311"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
