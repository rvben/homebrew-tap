class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.49"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.49/husker-v0.4.49-aarch64-apple-darwin.tar.gz"
      sha256 "f458f4eaf1aacfa2de7553d579956c23171b027d38e4d7ce9f804c1818660407"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.49/husker-v0.4.49-x86_64-apple-darwin.tar.gz"
      sha256 "8bb07e442fe2696b9aad0668294529c7317dd235f7098a5769c0b22dfc45df1b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.49/husker-v0.4.49-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "21c3f093ba5b2aa34665824f8f5972cc22f451cd1a78f7edbfa70fece2ca3a5d"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.49/husker-v0.4.49-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "045a5057d53b4a85b6660ce2ed1af6a72f40c64fa50f942e420179530063b1e4"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
