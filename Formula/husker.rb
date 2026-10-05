class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.52"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.52/husker-v0.4.52-aarch64-apple-darwin.tar.gz"
      sha256 "a825a761a5b66a14034695a435994f6d30cd320b97f58b65680a29409491162d"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.52/husker-v0.4.52-x86_64-apple-darwin.tar.gz"
      sha256 "ec8cc340f9c93c2005a5147547d28caae0dbeda698bb9e2a0cae47157f56dc7b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.52/husker-v0.4.52-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d3e109d7cdfab78b27dea8215ec68ebafea58d45277599d13cfa35637d5bfed"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.52/husker-v0.4.52-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f2982a95ee45a5dfcd68b28800e50393f8782bdcd20e20959ca7a7279cdd975"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
