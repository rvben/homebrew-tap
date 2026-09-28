class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.50"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.50/husker-v0.4.50-aarch64-apple-darwin.tar.gz"
      sha256 "0d0f3e590c61918259ea4a1dc618b2644507ddb1b38706bd4e76f81070595f58"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.50/husker-v0.4.50-x86_64-apple-darwin.tar.gz"
      sha256 "32fe5d63fdb5b5f984e840381ff37d105ae19fa0bc36d9aa46c052e5d59ecfd0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.50/husker-v0.4.50-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "315d28e8a093d1709808501f3ed90e2ae6ea4c2c5d08cb6e722de48221c3b615"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.50/husker-v0.4.50-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c62c9f7294d08691e4d8e4c052f2a25d67dd424a3f69aea859cc4a1844b1772b"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
