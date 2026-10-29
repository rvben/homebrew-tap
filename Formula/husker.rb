class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.56"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.56/husker-v0.4.56-aarch64-apple-darwin.tar.gz"
      sha256 "13abc8f4d5580d80e29a26129a729bf9ff0e4afa215f2a582460b28c2005b894"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.56/husker-v0.4.56-x86_64-apple-darwin.tar.gz"
      sha256 "a303eb4860190ecec41afb5e1a22d92357a94398bb2a14caa95d17f3582d9064"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.56/husker-v0.4.56-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd5b147fb4e80ca93182298e87a80d94cfdc8adda8898b39eda0378d3afec54f"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.56/husker-v0.4.56-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "57c319ec66fc4ccd7f408376aae5fa8c6b403669a6d4e98f6d14f6967e634051"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
