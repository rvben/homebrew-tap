class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.3/husker-v0.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "20f1a70aca791dc1ba491d9b46c00614e66ad1bfaaef1ee662c59a06491e7163"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.3/husker-v0.4.3-x86_64-apple-darwin.tar.gz"
      sha256 "ceaf194f0378891c04eae3810c56a3b0c1b5ac60c0547c1cabdb29028688969e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.3/husker-v0.4.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b1d69efe9c803880df38c9d934d0f3925dfff59e6486ca26f6d4b8ab7c26e0c9"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.3/husker-v0.4.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b88df19a92f4861eac96d74e42b092def0cf42407b3c82c7eab6ba8d185e744"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
