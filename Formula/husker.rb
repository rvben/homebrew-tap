class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.9/husker-v0.4.9-aarch64-apple-darwin.tar.gz"
      sha256 "8eba513cbe10fc3851d07d3539c59585b3ad62a20e323e9d649e3365140f7279"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.9/husker-v0.4.9-x86_64-apple-darwin.tar.gz"
      sha256 "b01ea2f41016404d625ae2a091354d719fd611489b53c3f8b6228f5ee4f31cdb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.9/husker-v0.4.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2c13891d5d68845cd88a7db0aec8445bcbdd457d62a32483895fc4b49ccca522"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.9/husker-v0.4.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "79d808797d815710b6329586d5bd5ab974dcf49b354fe31508c98c917a7d9c36"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
