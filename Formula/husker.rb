class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.43"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.43/husker-v0.4.43-aarch64-apple-darwin.tar.gz"
      sha256 "6d9c167753c243e0b3574aec3972ae96d905011529c0a062ff857a09e9a7aff7"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.43/husker-v0.4.43-x86_64-apple-darwin.tar.gz"
      sha256 "03bad30b1dd1b89caec3822e669cbc120358fd3b201ccbdcfdb727647bdcd586"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.43/husker-v0.4.43-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "39189009c53317f737d8e0afc2e96a0cfa2a915c2ab9b6dd796b2490e3d81a7f"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.43/husker-v0.4.43-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7983c87c4ef1a0009cbaa04177b9b676c68147db4972509031dde55268325eba"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
