class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.30/husker-v0.4.30-aarch64-apple-darwin.tar.gz"
      sha256 "8f704d9f832e628fb76e7c768bbad8a27703d06f6d428e159c7c33400a41556c"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.30/husker-v0.4.30-x86_64-apple-darwin.tar.gz"
      sha256 "db2ef889049403d011bbcdd97fd98609303fbcc896357f8cd190f61a7c284879"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.30/husker-v0.4.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd787021c558c92b6f891092a0b3e83b5d6e234901e975343c32d952db72430e"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.30/husker-v0.4.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2d693b8413671acbdc9cfbb3861e2ba908f7f4dcd92024298dad72f8427fded7"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
