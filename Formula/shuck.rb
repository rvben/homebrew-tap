class Shuck < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/shuck"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/shuck/releases/download/v0.1.3/shuck-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "f07f5d3cafc8b537125500e7d9d2f1d91a18829436250e708fcc5cbf676c7c65"
    else
      url "https://github.com/rvben/shuck/releases/download/v0.1.3/shuck-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "97d6861d1cfe1fb56aec5160853f0467d06df737759648216c4b1e063ca7f488"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/shuck/releases/download/v0.1.3/shuck-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2bf5bb9a639859165e6e8bcdb6a725e6b8c800a14c5a4589d0d5691727d27231"
    else
      url "https://github.com/rvben/shuck/releases/download/v0.1.3/shuck-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "60b9cef253df717d38e579fc2a55782299515e4153aeeec9216f850e56796948"
    end
  end

  def install
    bin.install "shuck"
  end

  test do
    system "#{bin}/shuck", "--version"
  end
end
