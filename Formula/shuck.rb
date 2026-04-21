class Shuck < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/shuck"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/shuck/releases/download/v0.1.4/shuck-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "e57d90c3d5c76b720f8a484cb071275eca24aacd5f7d07e3135388dd36e72b1f"
    else
      url "https://github.com/rvben/shuck/releases/download/v0.1.4/shuck-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "cd68a711f1a7e9cfa7d94741adfa6aa1f8b7eb0d0fe8222d6a72cf806c0c72b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/shuck/releases/download/v0.1.4/shuck-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "675fc8d8fd8eefaa5790615bf705449e6631528df9462bb280056f982a5691a5"
    else
      url "https://github.com/rvben/shuck/releases/download/v0.1.4/shuck-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "67ec162df1ded33c329d573417e1247f03fa78f92e53d943d8a108f960ae568c"
    end
  end

  def install
    bin.install "shuck"
  end

  test do
    system "#{bin}/shuck", "--version"
  end
end
