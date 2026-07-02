class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.33/husker-v0.4.33-aarch64-apple-darwin.tar.gz"
      sha256 "54b4f973c7c1883954285291d6d249b030effb09e2cae3c0070e44027defaef7"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.33/husker-v0.4.33-x86_64-apple-darwin.tar.gz"
      sha256 "f570531ebc7107c8d98216248a3d08682f6df20bc69d1286bd54cda59d8b8921"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.33/husker-v0.4.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1a717c7ffbb1dd1e9b56b1d68c16dcfed52e0fda651db7056ab390b12c8f674a"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.33/husker-v0.4.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bc2e29f3430cbfaa0e865b0a639878219d9ac03206e8f66c94f2c24827e0cac3"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
