class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.2.1/husker-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "100f6121644718d61af92902021d6548185a263dbd81616415f6cd88ca29eeb5"
    else
      url "https://github.com/rvben/husker/releases/download/v0.2.1/husker-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "a9ea5bf0e2807fb3868cb6be405185984d8e75dca3726bbcd1744b944696cde2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.2.1/husker-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "39706d2e33dcfc5ffb5bb708a1a9469accc609e88cbff7420c2324ec37fc1f1c"
    else
      url "https://github.com/rvben/husker/releases/download/v0.2.1/husker-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "45e5d410d0119240c32433ee72cad078c4c950fd5157b5b17d21b7b2642988c5"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
