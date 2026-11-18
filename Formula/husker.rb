class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.57"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.57/husker-v0.4.57-aarch64-apple-darwin.tar.gz"
      sha256 "7e65c606a1f3da7b8d8fd46f69085efaedbd84e52cf7beddb7a450a99aa41d5e"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.57/husker-v0.4.57-x86_64-apple-darwin.tar.gz"
      sha256 "ee3672ff7f7dcab074c17db1e51e4e2a0ba5bdbd035340928f90b97e899e0035"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.57/husker-v0.4.57-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b29ff8c5e3288d14a80a018abda7cecda8341d32df7e27acbf49186a7783f9bc"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.57/husker-v0.4.57-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2795da83b985f790f26f8470e9d99150d0d7548ef3cc84cd6719f4a4e834a5a0"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
